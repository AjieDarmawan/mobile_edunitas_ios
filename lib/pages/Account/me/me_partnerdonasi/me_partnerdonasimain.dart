part of 'me_partnerdonasi.dart';

class MePartnerDonasi extends StatefulWidget {
  String keycode;
  UsersDetailModel data_me;
  MePartnerDonasi({
    this.keycode,
    this.data_me,
  });
  @override
  _MePartnerDonasiState createState() => _MePartnerDonasiState();
}

class _MePartnerDonasiState extends State<MePartnerDonasi> {
  bool tipecard = true;

  Widget shimmerLoading() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350],
          highlightColor: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
            ],
          ),
        ),
      ),
    ));
  }

  var datadonasi = new List();
  String image_profile;
  void getListDonasi() {
    Donasiview_model().me_patner(widget.keycode).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
        image_profile =
            widget.data_me.foto == null ? null : widget.data_me.foto;
        //lenght = datadonasi == null ? 0 : 1; //is this even list
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
                  getListDonasi();

                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getListDonasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Partner Donasi',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data_me.nama,
                            style: blueFontStyle,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                          Text(
                            widget.data_me.email,
                            style: blackFontStyle3,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                          Text(
                            widget.data_me.noHp,
                            style: blackFontStyle3,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // child: Image.asset(
                      //   'assets/profile/defaultprofil.png',
                      //   //foto_me == null ? "" : foto_me,
                      //   fit: BoxFit.cover,
                      // ),
                      child: image_profile == null
                          ? Image.asset(
                              'assets/profile/defaultprofil.png',
                              //foto_me == null ? "" : foto_me,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              image_profile,
                              //foto_me == null ? "" : foto_me,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue[100]),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Alamat :'),
                      Expanded(
                        child: Text(
                          widget.data_me.alamat,
                          style: blueFontStyle,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(''),
                      Text(widget.data_me.medsos),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.volunteer_activism,
                      color: orenColor,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: EduButtonSecond(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (DonasiDataCampaigner(edit: false,keyCode: widget.keycode,))));
                    },
                    buttonText: 'Galang Dana',
                  )),
                ],
              ),
            ),
            Divider(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'Daftar Campaign',
                style: blackFontStyle1Bold.copyWith(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
             Container(
              child: datadonasi.length == 0
                  ? shimmerLoading()
                  : ListView.builder(
                      padding: EdgeInsets.only(bottom: 16),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: datadonasi.length,
                      itemBuilder: (context, index) {
                        var _konten = datadonasi[index];
                        double _persen = double.parse("0." +
                            _konten.persentase.toString().replaceAll(".", ""));
                        return Container(
                          child: _konten.status.toString() == "0"
                              ? Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0.0, 1.0),
                                              blurRadius: 3.0)
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.fromLTRB(16, 16, 16, 0),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            _konten.judul,
                                            style: blueFontStyleBold,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Daftar Kuliah : ${_konten.instansiLabel} | Personal : ${_konten.champaigner}',
                                            style: blackFontStyle1Bold.copyWith(
                                                fontSize: 12),
                                          ),
                                          Divider(
                                            height: 24,
                                            thickness: 1,
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Dana Terkumpul :",
                                                      style: blackFontStyle3,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "Rp. " +
                                                              "${_konten.terkumpul.toString()}",
                                                          style: blueFontStyle
                                                              .copyWith(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                            "Dari: Rp. " +
                                                                "${_konten.target.toString()}",
                                                            style:
                                                                blackFontStyle3),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      18,
                                                  child:
                                                      new LinearPercentIndicator(
                                                    animation: false,
                                                    lineHeight: 10.0,
                                                    percent: _persen,
                                                    center: Text(""),
                                                    linearStrokeCap:
                                                        LinearStrokeCap
                                                            .roundAll,
                                                    progressColor: orenColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Donatur " +
                                                          _konten.donasi
                                                              .toString(),
                                                      style: blueFontStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                    Text(
                                                      "Hingga: " +
                                                          _konten.hingga
                                                              .toString(),
                                                      style: blueFontStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 24,
                                            thickness: 1,
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: EduButtonSecond(
                                                buttonText: "Edit",
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => (DonasiDataCampaigner(edit: true, seolink: _konten.seolink.toString(),keyCode: widget.keycode,))));
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      right: 16,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color: Colors.orange,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 8),
                                        child: Text("Menunggu Approval",
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: whiteFontStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0.0, 1.0),
                                              blurRadius: 3.0)
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.fromLTRB(16, 16, 16, 0),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            _konten.judul,
                                            style: blueFontStyleBold,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Daftar Kuliah : ${_konten.instansiLabel} | Personal : ${_konten.champaigner}',
                                            style: blackFontStyle1Bold.copyWith(
                                                fontSize: 12),
                                          ),
                                          Divider(
                                            height: 24,
                                            thickness: 1,
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Dana Terkumpul :",
                                                      style: blackFontStyle3,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "Rp. " +
                                                              "${_konten.terkumpul.toString()}",
                                                          style: blueFontStyle
                                                              .copyWith(
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                            "Dari: Rp. " +
                                                                "${_konten.target.toString()}",
                                                            style:
                                                                blackFontStyle3),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      18,
                                                  child:
                                                      new LinearPercentIndicator(
                                                    animation: false,
                                                    lineHeight: 10.0,
                                                    percent: _persen,
                                                    center: Text(""),
                                                    linearStrokeCap:
                                                        LinearStrokeCap
                                                            .roundAll,
                                                    progressColor: orenColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Donatur " +
                                                          _konten.donasi
                                                              .toString(),
                                                      style: blueFontStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                    Text(
                                                      "Hingga: " +
                                                          _konten.hingga
                                                              .toString(),
                                                      style: blueFontStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          _konten.status.toString() == "1"
                                              ? Column(
                                                  children: [
                                                    Divider(
                                                      height: 24,
                                                      thickness: 1,
                                                    ),
                                                    SizedBox(
                                                      height: 32,
                                                      child: EduButtonSecond(
                                                          buttonText: "Detail",
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          (DonasiListDetail(
                                                                            seolink: _konten.seolink.toString() == null
                                                                                ? ""
                                                                                : _konten.seolink.toString(),
                                                                            keycode: widget.keycode,
                                                                          ))),
                                                            );
                                                          }),
                                                    )
                                                  ],
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      right: 16,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color:
                                              _konten.status.toString() == "1"
                                                  ? Colors.green
                                                  : Colors.red,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 8),
                                        child: Text(
                                            _konten.status.toString() == "1"
                                                ? "Publish"
                                                : "Ditolak",
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: whiteFontStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ],
                                ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
