part of 'widget_donasi.dart';

class MainDonasi extends StatefulWidget {
  String kategori, kendala;
  int key_enter;

  MainDonasi({
    this.kategori,
    this.kendala,
    this.key_enter,
  });
  @override
  _MainDonasiState createState() => _MainDonasiState();
}

class _MainDonasiState extends State<MainDonasi> {
  // DonasiDetailModel datadonasi;
  int lenght;
  // void getdonasidetail() {
  //   Donasiview_model().getDetail().then((value1) {
  //     //handled
  //     setState(() {
  //       datadonasi = value1 == null ? null : value1;
  //       lenght = datadonasi == null ? 0 : 1; //is this even list
  //     });
  //   }).catchError((erro) {
  //     setState(() {
  //       onErrHandling(erro);
  //     });
  //   });
  // }

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
  void getListDonasi(kategori, kendala) {
    Donasiview_model().listDonasi(kategori, kendala).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
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
                  check_search_donasi();
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  // void backButton(){
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => (Navigation_bottom())));
  // }

  void check_search_donasi() {
    if (widget.key_enter == 1) {
      getListDonasi(widget.kategori, widget.kendala);
    } else {
      getListDonasi("", "");
    }
  }

  @override
  void initState() {
    super.initState();
    check_search_donasi();
  }

  Future bottomModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return Container(
            height: 420,
            padding: MediaQuery.of(context).viewInsets,
            child: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(
                    "Cari Campaign",
                    style: whiteFontStyle,
                  ),
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  automaticallyImplyLeading: false,
                  backgroundColor: blueColor,
                  elevation: 0,
                ),
                body: SearchDonasi(),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: mainColor1,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: mainColor1,
          title: Text(
            "Pemberi Beasiswa",
            style: whiteFontStyle,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_alt),
              onPressed: () {
                bottomModal(context);
              },
            )
          ]),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFE192D),
                      const Color(0xFFFF5555),
                    ],
                    begin: const FractionalOffset(0.0, 1.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: EdgeInsets.only(left: 16, top: 10),
                          child: Text(
                            'Mulai dari Rp. 10.000,-',
                            textAlign: TextAlign.left,
                            style: whiteFontStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            'Cara mudah memberikan beasiswa serta menggalang dana melalui online di dunia pendidikan. Bantulah mereka, tolonglah mereka agar bisa terus belajar (Kuliah dan Sekolah).',
                            textAlign: TextAlign.left,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: whiteFontStyle.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Image.asset('assets/bannerdonasi.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: datadonasi.length == 0
                  ? shimmerLoading()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: datadonasi.length,
                      itemBuilder: (BuildContext context, int indx) {
                        var _konten = datadonasi[indx];
                        double _persen = double.parse("0." +
                            _konten.persentase.toString().replaceAll(".", ""));
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              color: Colors.white,
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(_konten.cover),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _konten.judul,
                                            style: blueFontStyleBold,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _konten.permasalahan +
                                                " : " +
                                                _konten.kategori +
                                                " | Lembaga : " +
                                                _konten.instansiLabel,
                                            style: blackFontStyle3.copyWith(
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      indent: 16,
                                      endIndent: 16,
                                      height: 24,
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
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
                                                "Rp. " + _konten.terkumpul,
                                                style: blueFontStyle.copyWith(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                  "Dari: Rp. " + _konten.target,
                                                  style: blackFontStyle3),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
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
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: mainColor1,
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(10.0))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      child: Row(
                                                    children: [
                                                      Text(
                                                        _konten.donasi,
                                                        style: whiteFontStyle
                                                            .copyWith(
                                                                color:
                                                                    yellowColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "Donatur",
                                                          style: whiteFontStyle
                                                              .copyWith(
                                                                  fontSize: 12),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: 'Sampai Dengan : ',
                                                      style: whiteFontStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: _konten.hingga,
                                                          style: whiteFontStyle.copyWith(
                                                              color:
                                                                  yellowColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailDonasi(
                                              seolink:
                                                  _konten.seolink.toString() ==
                                                          null
                                                      ? ""
                                                      : _konten.seolink
                                                          .toString())));
                                },
                              ),
                            ));
                      },
                    ),
            )
          ],
        ),
      )),
    );
  }
}
