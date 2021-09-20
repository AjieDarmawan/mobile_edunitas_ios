part of 'widget_donasi.dart';

class DetailDonasi extends StatefulWidget {
  final String seolink;
  DetailDonasi({
    this.seolink,
  });
  @override
  _DetailDonasiState createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {
  var _loading = false;

  DonasiDetailModel datadonasi;
  String _percent = "";
  String _instansi_label = "";
  String _cover = "";
  String _donasi = "";
  String _judul = "";
  String _dkumpul = "";
  String _dhingga = "";
  String _dtarget = "";
  String _cid = "";
  void getdonasidetail() {
    Donasiview_model().getDetail(widget.seolink).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
        //lenght = datadonasi==null?0:1;//is this even list
        _percent = datadonasi.persentase;
        _instansi_label = datadonasi.instansi_label;
        _cover = datadonasi.cover;
        _donasi = datadonasi.donasi;
        _judul = datadonasi.judul;
        _dkumpul = datadonasi.terkumpul;
        _dhingga = datadonasi.hingga;
        _dtarget = datadonasi.target;
        _cid = datadonasi.cid;
        _loading = false;
        getdonaturlist(_cid);
        getkabarlist(_cid);
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  List<DonaturListModel> datadonatur;
  int datadonatur_leng = 0;
  void getdonaturlist(_cid) {
    Donasiview_model().getDonaturList(_cid.toString()).then((value1) {
      //handled
      setState(() {
        datadonatur = value1 == null ? null : value1;
        datadonatur_leng =
            datadonatur == null ? 0 : datadonatur.length; //is this even list
        _loading = false;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  List<DonasiKabarModel> datakabar;
  int datakabar_leng = 0;
  void getkabarlist(cid) {
    Donasiview_model().getKabarList(cid.toString()).then((value1) {
      //handled
      setState(() {
        datakabar = value1 == null ? null : value1;
        datakabar_leng =
            datakabar == null ? 0 : datakabar.length; //is this even list
        _loading = false;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  var _stillhandling = false;
  void onErrHandling(erro) {
    print("do_home_err: " + erro.toString());
    var _error_val_cather = erro.toString().substring(0, 49);
    if (_stillhandling == false) {
      setState(() {
        _stillhandling = true;
      });
      if (_error_val_cather.contains("SocketException")) {
        Flushbar(
            title: "Tidak ada koneksi",
            message: "Mohon cek koneksi internet",
            duration: Duration(days: 360),
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.FLOATING,
            reverseAnimationCurve: Curves.decelerate,
            forwardAnimationCurve: Curves.fastOutSlowIn,
            boxShadows: [
              BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 3.0)
            ],
            backgroundColor: Colors.red[600],
            isDismissible: true,
            mainButton: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: EduButton(
                onPressed: () {
                  _stillhandling = false;
                  getdonasidetail();
               
                
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  Future<void> share() async {
    print("share_helper");
    await FlutterShare.share(
        title: 'Donasi Shared',
        text: 'Sebarkan kebaikan, berikan donasi terbaik mu',
        //todo ganti kalo share donasi ada share nya
        linkUrl:
            'https://edunitas.com/edudonation/detail/${widget.seolink.toString()}',
        chooserTitle: 'Chooser Donasi');
  }

  @override
  void initState() {
    super.initState();
    getdonasidetail();
   
  
  }

  @override
  Widget build(BuildContext context) {
    double _persen =
        double.parse("0." + _percent.toString().replaceAll(".", ""));
    //var _loading = datadonasi==null&&datadonatur==null&&datakabar==null?true:false;
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 200.0,
            backgroundColor: mainColor1,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    share();
                  })
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      opacity: top > 60 && top < 100 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 100),
                      child: Text("Detail Penggalangan Dana",
                          style: whiteFontStyle.copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis),
                    ),
                    background: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              _cover,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ));
              },
            )),
        SliverToBoxAdapter(
          child: !_loading
              ? Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.volunteer_activism,
                              color: orenColor,
                              size: 48,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penggalang Dana",
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                _instansi_label,
                                style: blueFontStyle2Bold,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      // Proses Pemberian Beasiswa
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Progres Pemberian Beasiswa",
                                  style: blackFontStyle3.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                color: mainColor1,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dana Terkumpul :",
                                          style: blackFontStyle3,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Rp. " + _dkumpul,
                                              style: blueFontStyle.copyWith(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Dari: Rp. " + _dtarget,
                                                style: blackFontStyle3),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                18,
                                            child: new LinearPercentIndicator(
                                              animation: false,
                                              lineHeight: 20.0,
                                              percent: _persen,
                                              center: Text(""),
                                              linearStrokeCap:
                                                  LinearStrokeCap.roundAll,
                                              progressColor: orenColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Hingga: " + _dhingga,
                                          style: blueFontStyle.copyWith(
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      // Donatur
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Jumlah Donatur",
                                        style: blackFontStyle3.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: orenColor,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            _donasi,
                                            style: blueFontStyleBold,
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              Divider(
                                height: 0,
                                thickness: 2,
                                color: mainColor1,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 460,
                                child: ListView.builder(
                                    padding: EdgeInsets.all(10.0),
                                    itemCount: datadonatur_leng,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var _donatur = datadonatur[index];
                                      var _donatur_image =
                                          datadonatur[index].pict == null
                                              ? ""
                                              : datadonatur[index].pict;
                                      return Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  //Icon(Icons.account_circle_rounded, color: Colors.grey, size: 30,),
                                                  Container(
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                _donatur_image),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _donatur.donaturname,
                                                          style:
                                                              blackFontStyle3,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Nominal : ",
                                                              style:
                                                                  blackFontStyle3,
                                                            ),
                                                            Text(
                                                              NumberFormat.currency(
                                                                      symbol:
                                                                          'Rp ',
                                                                      decimalDigits:
                                                                          0,
                                                                      locale:
                                                                          'id-ID')
                                                                  .format(double
                                                                      .parse(_donatur
                                                                          .price)),
                                                              style:
                                                                  blueFontStyle
                                                                      .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(_donatur.crdt)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _donatur.judul,
                                            style: blackFontStyle3,
                                          ),
                                          Divider(
                                            height: 24,
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ]),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //Sisanya
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _judul,
                              style: blueFontStyleBold,
                            ),
                            Divider(
                              height: 30,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              _judul,
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tujuan Penggalangan Dana",
                              style: blueFontStyleBold,
                            ),
                            Divider(
                              height: 15,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              _judul,
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        child: Text(
                          "Kabar Terbaru Penggalanagn Dana",
                          style: blueFontStyleBold,
                        ),
                      ),

                      //Kabar
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: datakabar_leng,
                            itemBuilder: (BuildContext context, int index) {
                              var _kabar = datakabar[index];
                              var _duplicate_waktu = false;
                              if (index < 0) {
                                print("kiksi:" +
                                    datakabar[index].waktu +
                                    " nicmna: " +
                                    datakabar[index - 1].waktu);
                                if (datakabar[index].waktu ==
                                    datakabar[index - 1].waktu) {
                                  _duplicate_waktu = true;
                                } else {
                                  _duplicate_waktu = false;
                                }
                              }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  index != 0
                                      ? _duplicate_waktu == false
                                          ? Container(
                                              height: 20,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: abuColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              child: Center(
                                                child: Text(
                                                  _kabar.waktu,
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          color:
                                                              Colors.grey[600]),
                                                ),
                                              ),
                                            )
                                          : Container()
                                      : Container(
                                          height: 20,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: abuColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Center(
                                            child: Text(
                                              _kabar.waktu,
                                              style: blackFontStyle3.copyWith(
                                                  color: Colors.grey[600]),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _kabar.judul,
                                            style: blueFontStyle,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _kabar.textmessage,
                                            style: blackFontStyle3,
                                            maxLines: 3,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: mainColor1,
                                                    size: 10,
                                                  ),
                                                  Text(
                                                    " " + _kabar.waktu,
                                                    style: blueFontStyle,
                                                  )
                                                ],
                                              ),
                                              EduButtonSecond(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              (DetailLengkapDonasi(
                                                                datakabar:
                                                                    _kabar,
                                                              ))));
                                                },
                                                buttonText: "Selengkapnya",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 16, 10, 0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                'Apabila penggalangan dana ini mencurigakan ',
                                style:
                                    blackFontStyle1Bold.copyWith(fontSize: 10),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Laporkan',
                                style: blackFontStyle1Bold.copyWith(
                                    fontSize: 11, color: Colors.red[900]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: SpinKitThreeBounce(color: mainColor1),
                ),
        )
      ]),
      bottomSheet: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 3.0)
            ],
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 64, vertical: 14),
            child: EduButton(
              buttonText: "Beri Beasiswa Sekarang",
              textColor: mainColor1,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (FormulirDonasi(
                              cid: _cid.toString() == null
                                  ? ""
                                  : _cid.toString(),
                            ))));
              },
            ),
          )
          // Row(
          //   children: [
          //     Container(
          //       height: 40,
          //       width: 40,
          //       child: EduButtonSecondIcon(
          //         icon: Icons.share,
          //         iconSize: 24,
          //         iconColor: mainColor1,
          //         onPressed: () {
          //           share();
          //         },
          //       ),
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),

          //   ],
          // ),
          ),
    );
  }
}
