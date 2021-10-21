part of 'home.dart';

class HomeDetailPage extends StatefulWidget {
  final Photo campus;
  final String routef;

  final String nilaiunitarea, nilaikelas, nilaijurusan, nilai;
  final int key_enter;

  final String nama, unitarea, kodejurusan, karir, valLokasi;

  HomeDetailPage(
      {this.campus,
      this.routef,
      this.nilaijurusan,
      this.nilaikelas,
      this.nilaiunitarea,
      this.nilai,
      this.key_enter,
      this.nama,
      this.unitarea,
      this.kodejurusan,
      this.karir,
      this.valLokasi});

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  var transp = new List();
  var fileimg = new List();
  var data = [];
  bool _loading;
  List<Kend> kend;
  //List kend;
  String youtubemuncul;
  String rektor;

  bool isConn = true;

  var labelnamaweb = '', kodeweb = '', jenjangweb;
  var dataWebJurusan = new List();
  int dataWebJurusan_lenght = 0;
  void getWebJurusan() {
    sipemaview_model().getBiayaSipema_web(widget.campus.kode,widget.campus.webacid).then((value) {
      setState(() {
        dataWebJurusan = value;
        dataWebJurusan_lenght = dataWebJurusan.length;

        //labelkelompok = dataWebJurusan[0].kelompok;
        // labelprogram = dataWebJurusan[0].program;
      });
    });
  }

  var dataSipema = new List();
  int dataSipema_lenght = 0;
  void getBiayaSipema2() {
    sipemaview_model()
        .getBiayaSipema(widget.campus.kode.toString())
        .then((value) {
      setState(() {
        Map<String, Map<String, Sipema>> data = value;
        Sipema tempData1 = Sipema.fromJson(data.values.first);
        List<Map<String, Sipema>> list =
            data.entries.map((e) => e.value).toList();
        List<Iterable<Sipema>> finalList = list.map((e) => e.values).toList();
        final lastList =
            finalList.map((e) => e.map((e) => e).toList()).toList();
        List<List<Sipema>> dataSipema2 = lastList.map((e) => e).toList();
        dataSipema = dataSipema2;
        // List<Sipema> lastDataSipema = dataSipema[0];
        // Sipema datSipemaByIndex = lastDataSipema[0];

        // namakonversi = datSipemaByIndex.itembayar.itembayar;
        dataSipema_lenght = dataSipema.length;
      });
    }).catchError((erro) {
      setState(() {
        isConn == false;
        onErrHandling(erro);
      });
    });
  }

  var rektorImg,
      rektor_jabatan,
      _youtube,
      _profile,
      _visi_misi,
      urlGooglemaps,
      gambar_youtube;

  void getDetailCampus() {
    print("widget.campus.kode: " + widget.campus.kode);
    Kampusview_model().detailCampus(widget.campus.kode).then((value) {
      setState(() {
        DetailCampusModel2 data = value;
        //youtubemuncul = data.youtube;
        rektor_jabatan = data.rektorJabatan;
        rektorImg = data.rektorImg;
        rektor = data.rektor;
        _youtube = data.linkYoutubePendek;
        _profile = data.profile;
        _visi_misi = data.visiMisi
            .replaceAll('-*-Visi =', '')
            .replaceAll(' -*-Misi = ', '');
        urlGooglemaps = data.linkPeta;
        gambar_youtube = data.gambar_youtube;
        // transp = data.transportasi;
        fileimg = data.foto;
        kend = data.kend;

        //munculvideo();
      });
    }).catchError((erro) {
      setState(() {
        isConn == false;
        onErrHandling(erro);
      });
    });
  }

  void getData() {
    getDetailCampus();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  void onErrHandling(erro) {
    print("do_login_err: " + erro.toString());
    if (erro.toString().contains("SocketException")) {
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
                _loading = true;
                getWebJurusan();
                getBiayaSipema2();
                getData;
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  Future<void> share() async {
    print("share_helper");
    await FlutterShare.share(
        title: 'Kampus Shared',
        text:
            'Daftar sekarang juga sebelum Kuota penuh dan Biaya Kuliah Naik\n\n*Biaya Kuliah Mulai 350 ribu/bulan*',
        linkUrl: 'https://edunitas.com/educampus/detail/' +
            widget.campus.singkatan.replaceAll(' ', '-'),
        chooserTitle: 'Chooser Kampus');
  }

  //conn has been updated 22 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          getData();
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  // LatLng myLocation;
  // Timer _timer;
  // final Map<String, Marker> _marker = {};

  String linknya;
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  String videoId;
  @override
  void initState() {
    super.initState();
    _loading = true;
    conn();
    getBiayaSipema2();
    getWebJurusan();

    //periodicMethod();
  }

  Future<bool> _backPressed() {
    widget.routef == "DaftarOnline"
        ? Navigator.pop(context)
        : Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (widget.routef == 'SearchKampusHasil'
                    ? Search_Kampus_Hasil(
                        nilaiunitarea: widget.nilaiunitarea,
                        nilaikelas: widget.nilaikelas,
                        nilaijurusan: widget.nilaijurusan == null
                            ? ''
                            : widget.nilaijurusan,
                        nilai: "1",
                        key_enter: 1,
                      )
                    : widget.routef == 'SearchCampusJurusan'
                        ? SearchCampusJurusan(
                            nama: widget.nama,
                            unitarea: widget.unitarea,
                            kodejurusan: widget.kodejurusan,
                            karir: widget.karir,
                            valLokasi: widget.valLokasi,
                          )
                        : widget.routef == 'HomeDetail'
                            ? Home_detail(
                                key_enter: 1,
                              )
                            : widget.routef == 'Wishlist'
                                ? Navigation_bottom(
                                    selectedIndex: 1,
                                  )
                                : Navigation_bottom())));
  }

  @override
  Widget build(BuildContext context) {
    print("tes" + 'https://img.youtube.com/vi/${gambar_youtube}/0.jpg');
    buildCollapsed1() {
      return Html(
        data: _profile == null || _profile.length == 0
            ? ""
            : _profile.substring(0, 100) + "...",
        // : _profile.length < 250
        // ? _profile.substring(0, 100) + "..."
        // : _profile.substring(0, 250) + "...",
        defaultTextStyle:
            blackFontStyle1.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      );
    }

    buildExpanded1() {
      return Html(
        data: _profile == null ? "" : _profile,
        defaultTextStyle:
            blackFontStyle1.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      );
    }

    buildCollapsed2() {
      return Html(
        data: _visi_misi == null || _visi_misi.length == 0
            ? ""
            : _visi_misi.substring(0, 250) + "...",
        // : _profile.length < 250
        // ? _profile.substring(0, 100) + "..."
        // : _profile.substring(0, 250) + "...",
        defaultTextStyle:
            blackFontStyle1.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      );
    }

    buildExpanded2() {
      return Html(
        data: _visi_misi == null ? "" : _visi_misi,
        defaultTextStyle:
            blackFontStyle1.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      );
    }

    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
          body: isConn == false
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SpinKitThreeBounce(
                    color: mainColor1,
                  ),
                ))
              : CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: 130.0,
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
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          var top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                              title: AnimatedOpacity(
                                opacity: top > 60 && top < 120 ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 300),
                                child: Text(
                                    top > 71 && top < 91
                                        ? widget.campus.singkatan == null
                                            ? ""
                                            : widget.campus.singkatan
                                        : "",
                                    style: whiteFontStyle,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              background: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    height: 160,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            widget.campus.cover == null
                                                ? ""
                                                : widget.campus.cover,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                      left: 24,
                                      bottom: 24,
                                      child: Row(children: [
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  widget.campus.logo == null
                                                      ? ""
                                                      : widget.campus.logo,
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 16),
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.4,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              color: Colors.black54),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.campus.singkatan == null
                                                    ? ""
                                                    : widget.campus.singkatan,
                                                style: whiteFontStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                widget.campus.nama == null
                                                    ? ""
                                                    : widget.campus.nama,
                                                style: whiteFontStyle.copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ])),
                                ],
                              ));
                        },
                      )),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
                          height: 79,
                          width: double.infinity,
                          child: Row(
                            children: [
                              rektor == null
                                  ? Container(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[350],
                                        highlightColor: Colors.white,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 16),
                                          height: 56,
                                          width: 56,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              color: Colors.grey[350]),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(28),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(left: 16),
                                      height: 56,
                                      width: 56,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: Image.network(
                                          rektorImg,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                height: 63,
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    rektor_jabatan == null
                                        ? Container(
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[350],
                                              highlightColor: Colors.white,
                                              child: Container(
                                                height: 10,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.grey[350]),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            rektor_jabatan == null
                                                ? ""
                                                : rektor_jabatan.toString(),
                                            style: blackFontStyle1.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                            textAlign: TextAlign.start,
                                          ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    rektor == null
                                        ? Container(
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[350],
                                              highlightColor: Colors.white,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 4),
                                                height: 16,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.grey[350]),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            rektor == null ? "" : rektor,
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: blueFontStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        _youtube != ''
                            ? Container(
                                padding: EdgeInsets.all(16),
                                width: double.infinity,
                                height: 230,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      //_launched = _launchInBrowser(toLaunch);
                                    }),
                                    child: Container(
                                      color: CupertinoColors.systemGrey4,
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            'https://img.youtube.com/vi/${gambar_youtube}/0.jpg',
                                            //gambar_youtube,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                              child: Stack(
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 80,
                                              ),
                                              Icon(
                                                Icons.play_circle_fill,
                                                color: Colors.red,
                                                size: 80,
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Profil",
                                    style: blueFontStyleBold,
                                  ),
                                ),
                              ),
                        Container(
                          child: _profile == null
                              ? Text("")
                              : ExpandableNotifier(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 10),
                                    child: ScrollOnExpand(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expandable(
                                            collapsed: buildCollapsed1(),
                                            expanded: buildExpanded1(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Builder(
                                                builder: (context) {
                                                  var controller =
                                                      ExpandableController.of(
                                                          context);
                                                  return TextButton(
                                                    child: Text(
                                                      controller.expanded
                                                          ? "Sembunyikan"
                                                          : "Baca Selengkapnya",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button
                                                          .copyWith(
                                                              color:
                                                                  mainColor1),
                                                    ),
                                                    onPressed: () {
                                                      controller.toggle();
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 24, top: 16),
                          margin: EdgeInsets.only(bottom: 16),
                          child: Text("Visi Misi",
                              style: blueFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        _profile == null
                            ? Container(
                                alignment: Alignment.topLeft,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 4, 0, 16),
                                    height: 24,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey[350]),
                                  ),
                                ),
                              )
                            : Container(
                                child: _profile == null
                                    ? Text("")
                                    : ExpandableNotifier(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16, bottom: 10),
                                          child: ScrollOnExpand(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Expandable(
                                                  collapsed: buildCollapsed2(),
                                                  expanded: buildExpanded2(),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Builder(
                                                      builder: (context) {
                                                        var controller =
                                                            ExpandableController
                                                                .of(context);
                                                        return TextButton(
                                                          child: Text(
                                                            controller.expanded
                                                                ? "Sembunyikan"
                                                                : "Baca Selengkapnya",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .button
                                                                .copyWith(
                                                                    color:
                                                                        mainColor1),
                                                          ),
                                                          onPressed: () {
                                                            controller.toggle();
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 24, top: 16),
                          child: Text("Galeri Kampus",
                              style: blueFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: fileimg.length >= 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 160,
                                      width: MediaQuery.of(context).size.width /
                                          1.55,
                                      child: GestureDetector(
                                        child: Hero(
                                            tag: 'image1',
                                            child: !_loading
                                                ? Container(
                                                    child: fileimg.length == 0
                                                        ? Container(
                                                            child: Shimmer
                                                                .fromColors(
                                                              baseColor: Colors
                                                                  .grey[350],
                                                              highlightColor:
                                                                  Colors.white,
                                                              child: Container(
                                                                height: 160,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.55,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Colors
                                                                            .grey[
                                                                        350]),
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: CupertinoColors
                                                                  .systemGrey4,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black38,
                                                                  spreadRadius:
                                                                      1,
                                                                  blurRadius: 2,
                                                                  offset: Offset(
                                                                      0,
                                                                      1), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                                child: Image
                                                                    .network(
                                                                  fileimg[0],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                          ))
                                                : Container(
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[350],
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        height: 160,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.55,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors
                                                                .grey[350]),
                                                      ),
                                                    ),
                                                  )),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (_) {
                                            return DetailScreen(
                                              imageCurr: fileimg[0],
                                            );
                                          }));
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Container(
                                            height: 72,
                                            width: 80,
                                            child: fileimg.length >= 1
                                                ? GestureDetector(
                                                    child: Hero(
                                                      tag: 'image2',
                                                      child: !_loading
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: CupertinoColors
                                                                    .systemGrey4,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black38,
                                                                    spreadRadius:
                                                                        1,
                                                                    blurRadius:
                                                                        2,
                                                                    offset: Offset(
                                                                        0,
                                                                        1), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                                child: Image
                                                                    .network(
                                                                  fileimg[1],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ))
                                                          : Container(
                                                              child: Shimmer
                                                                  .fromColors(
                                                                baseColor:
                                                                    Colors.grey[
                                                                        350],
                                                                highlightColor:
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    Container(
                                                                  height: 72,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                              .grey[
                                                                          350]),
                                                                ),
                                                              ),
                                                            ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder: (_) {
                                                        return DetailScreen(
                                                          imageCurr: fileimg[1],
                                                        );
                                                      }));
                                                    },
                                                  )
                                                : Container(
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[350],
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        height: 72,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors
                                                                .grey[350]),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          child: Container(
                                            height: 72,
                                            width: 80,
                                            child: fileimg.length > 2
                                                ? GestureDetector(
                                                    child: Hero(
                                                      tag: 'image3',
                                                      child: !_loading
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: CupertinoColors
                                                                    .systemGrey4,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black38,
                                                                    spreadRadius:
                                                                        1,
                                                                    blurRadius:
                                                                        2,
                                                                    offset: Offset(
                                                                        0,
                                                                        1), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                                child: Image
                                                                    .network(
                                                                  fileimg[2],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ))
                                                          : Container(
                                                              child: Shimmer
                                                                  .fromColors(
                                                                baseColor:
                                                                    Colors.grey[
                                                                        350],
                                                                highlightColor:
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    Container(
                                                                  height: 72,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                              .grey[
                                                                          350]),
                                                                ),
                                                              ),
                                                            ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder: (_) {
                                                        return DetailScreen(
                                                          imageCurr: fileimg[2],
                                                        );
                                                      }));
                                                    },
                                                  )
                                                : Container(
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[350],
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        height: 72,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors
                                                                .grey[350]),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : Container(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Container(
                                      height: 160,
                                      width: MediaQuery.of(context).size.width /
                                          1.55,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[350]),
                                    ),
                                  ),
                                ),
                        ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 24, top: 16),
                          child: Text("Alamat Kampus",
                              style: blueFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _launched = _launchInBrowser(urlGooglemaps);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: Text(
                                  widget.campus.alamat.replaceAll('<br>', ','),
                                  style: blackFontStyle3,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 16),
                                height: 28,
                                child: Image.asset('assets/locicon.png'),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 24, top: 16),
                          child: Text("Transportasi",
                              style: blueFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          child: kend == null || kend.length == 0
                              ? Container(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Column(
                                  children: kend.map<Widget>((document) {
                                  return ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToExpand: true,
                                      tapBodyToCollapse: true,
                                      hasIcon: false,
                                    ),
                                    header: Container(
                                      //  color: Color(0xFFFFCE00),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            ExpandableIcon(
                                              theme: const ExpandableThemeData(
                                                expandIcon: Icons.arrow_right,
                                                collapseIcon:
                                                    Icons.arrow_drop_down,
                                                iconColor: Colors.blue,
                                                iconSize: 24.0,
                                                alignment:
                                                    Alignment.centerRight,
                                                //iconRotationAngle: math.pi / 2,
                                                iconPadding:
                                                    EdgeInsets.only(right: 5),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              60,
                                                      child: Text(
                                                        document.angkutan,
                                                        //"mikrolet ",
                                                        style: blackFontStyle3,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    expanded: Container(
                                      color: CupertinoColors.systemGrey5,
                                      padding: EdgeInsets.only(left: 24),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            document.rute,
                                            //document[0],
                                            style: blackFontStyle3.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  );
                                }).toList()),
                        ),
                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),

                        // List Jurusan
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 24, top: 16),
                          child: Text("Program Studi / Jurusan yang Tersedia",
                              style: blueFontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          child: dataWebJurusan_lenght == 0
                              ? Container(
                                  margin: EdgeInsets.only(top: 24),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[350],
                                    highlightColor: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[350]),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: dataWebJurusan_lenght,
                                  itemBuilder:
                                      (BuildContext context, int indexsatu) {
                                    final xweb = dataWebJurusan[indexsatu];
                                    return ExpandablePanel(
                                      theme: ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToExpand: true,
                                        tapBodyToCollapse: true,
                                        hasIcon: false,
                                      ),
                                      header: Container(
                                        height: 32,
                                        child: Row(
                                          children: [
                                            ExpandableIcon(
                                              theme: const ExpandableThemeData(
                                                expandIcon: Icons.arrow_right,
                                                collapseIcon:
                                                    Icons.arrow_drop_down,
                                                iconColor: Colors.blue,
                                                iconSize: 24.0,
                                                alignment:
                                                    Alignment.centerRight,
                                                //iconRotationAngle: math.pi / 2,
                                                iconPadding:
                                                    EdgeInsets.only(right: 5),
                                              ),
                                            ),
                                            Text(
                                              "${xweb.label}",
                                              style: blackFontStyle3.copyWith(
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      expanded: Container(
                                        color: CupertinoColors.systemGrey5,
                                        padding: EdgeInsets.only(left: 24),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                  child: Container(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: EduButtonSecond(
                                                    onPressed: () {
                                                      // checkEmailAndPassowrd();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  (CekbiayaWebJurusan(
                                                                    campus: widget.campus ==
                                                                            null
                                                                        ? ""
                                                                        : widget
                                                                            .campus,
                                                                    kodejurusan: xweb.kode ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .kode
                                                                            .toString(),
                                                                    jenjang: xweb.jenjang ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .jenjang
                                                                            .toString(),
                                                                    namaJurusan: xweb.label ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .label
                                                                            .toString(),
                                                                    // kodeprogram: labelprogram
                                                                    //             .toString() ==
                                                                    //         null
                                                                    //     ? ""
                                                                    //     : labelprogram
                                                                    //         .toString(),
                                                                    // namaKelompok: labelkelompok
                                                                    //             .toString() ==
                                                                    //         null
                                                                    //     ? ""
                                                                    //     : labelkelompok
                                                                    //         .toString(),
                                                                  ))));
                                                    },
                                                    buttonText: "Cek Biaya",
                                                  ),
                                                ),
                                              )),
                                              Container(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: EduButtonSecond(
                                                    onPressed: () {
                                                      // checkEmailAndPassowrd();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      (Prospek(
                                                                        kodejurusan: xweb
                                                                            .kode
                                                                            .toString(),
                                                                      ))));
                                                    },
                                                    buttonText: "Prospek",
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: EduButtonSecond(
                                                    onPressed: () {
                                                      // checkEmailAndPassowrd();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  (Daftar_kuliahWebJurusan(
                                                                    campus: widget.campus ==
                                                                            null
                                                                        ? ""
                                                                        : widget
                                                                            .campus,
                                                                    kodejurusan: xweb.kode ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .kode
                                                                            .toString(),
                                                                    jenjang: xweb.jenjang ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .jenjang
                                                                            .toString(),
                                                                    namaJurusan: xweb.label ==
                                                                            null
                                                                        ? ""
                                                                        : xweb
                                                                            .label
                                                                            .toString(),
                                                                  ))));
                                                    },
                                                    buttonText: "Daftar",
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ),

                        Divider(
                          indent: 24,
                          endIndent: 24,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 200,
                        ),
                      ],
                    ),
                  )
                ]),
          bottomSheet: isConn == false
              ? Container()
              : Container(
                  height: 200,
                  child: Container(
                    height: 200,
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        // child: DetailBottomSheet(
                        //     campus: widget.campus,
                        //     jurusan: widget.routef == 'SearchKampusHasil'
                        //         ? widget.nilaijurusan
                        //         : widget.kodejurusan,
                        //     routef: widget.routef),
                        child: DetailBottomSheetWebJurusan(
                            campus: widget.campus,
                            jurusan: widget.routef == 'SearchKampusHasil'
                                ? widget.nilaijurusan
                                : widget.kodejurusan,
                            routef: widget.routef)),
                  ),
                )),
    );
  }
}

class DetailScreen extends StatelessWidget {
  var imageCurr;
  DetailScreen({Key key, this.imageCurr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imagezoom',
            child: Image.network(
              imageCurr,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
