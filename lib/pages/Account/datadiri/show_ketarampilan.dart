part of 'pengaturan.dart';

class ShowKeterampilan extends StatefulWidget {
  final String keycode;
  ShowKeterampilan({
    this.keycode,
  });

  @override
  _ShowKeterampilanState createState() => _ShowKeterampilanState();
}

class _ShowKeterampilanState extends State<ShowKeterampilan> {
  List<ShowKemampuanModel> datakemampuan = new List();
  void getkemampuan() async {
    UserViewModel().show_kemampuan(widget.keycode.toString()).then((value2) {//handled
      setState(() {
        datakemampuan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<ShowBahasaModel> databahasa = new List();
  void getbahasa() async {
    UserViewModel().show_bahasa(widget.keycode.toString()).then((value2) {//handled
      setState(() {
        databahasa = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro){
    print("do_login_err: "+erro.toString());
    if(erro.toString().contains("SocketException")){
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
                getkemampuan();
                getbahasa();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    getkemampuan();
    getbahasa();
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListDatadiri(
              keycode: widget.keycode == null ? "" : widget.keycode)),
    );
  }

  void prepareBackButtonKeterampilan() async {
    var result = await Navigator.of(context)
        .push(new MaterialPageRoute(
      builder: (BuildContext context) =>
          KemampuanDatadiri(
            keycode: widget.keycode == null
                ? ""
                : widget.keycode.toString(),
            status: "insert",
          ),
    ));
    if (result!=null) getkemampuan();
  }

  void prepareBackButtonBahasa() async {
    var result = await Navigator.of(context)
        .push(new MaterialPageRoute(
      builder: (BuildContext context) =>
          BahasaDatadiri(
            keycode: widget.keycode == null
                ? ""
                : widget.keycode.toString(),
            status: "insert",
          ),
    ));
    if (result!=null) getbahasa();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: _backPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          title: Text(
            'Keterampilan',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue[50], width: 2)),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.psychology,
                        size: 56,
                        color: Colors.blue[50],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tingkat kemampuan",
                          style: blueFontStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Untuk meningkatkan kesempatan Anda dipilih oleh perusahaan Jabarkanlah seluruh kemampuan anda.",
                          style: blackFontStyle2.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Keterampilan anda',
                              style: blackFontStyle1.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 32,
                            child: EduButtonSecond(
                              buttonText: "Tambah",
                              onPressed: () {
                                prepareBackButtonKeterampilan();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    datakemampuan == null
                        ? Container(
                            height: 16,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: datakemampuan.length,
                            itemBuilder: (context, index) {
                              final xkemampuan = datakemampuan[index];

                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              //xkemampuan.nama == null
                                              xkemampuan.kemampuan == null
                                                  ? ""
                                                  //: xkemampuan.nama,
                                                  : xkemampuan.kemampuan,
                                              style: blueFontStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Tingkat",
                                                style: blackFontStyle2.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                //xkemampuan.industriNama == null
                                                xkemampuan.tingkatan == null
                                                    ? ""
                                                    //: xkemampuan.industriNama,
                                                    : xkemampuan.tingkatan,
                                                style: blackFontStyle2.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              modalShowKemampuan(
                                                  context,
                                                  xkemampuan.id.toString(),
                                                  xkemampuan,
                                                  widget.keycode);
                                            },
                                          )
                                        ]),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
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
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Bahasa yang anda kuasai',
                              style: blackFontStyle1.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 32,
                            child: EduButtonSecond(
                              buttonText: "Tambah",
                              onPressed: () {
                                prepareBackButtonBahasa();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    databahasa == null
                        ? Container(
                            height: 16,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: databahasa.length,
                            itemBuilder: (context, index) {
                              final xdatabaahasa = databahasa[index];

                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              //xpengalaman.nama == null
                                              xdatabaahasa.bahasa == null
                                                  ? ""
                                                  //: xdatabaahasa.nama,
                                                  : xdatabaahasa.bahasa,
                                              style: blueFontStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Tingkat Tulisan",
                                                style: blackFontStyle2.copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                //xdatabaahasa.industriNama == null
                                                xdatabaahasa.tulisan == null
                                                    ? ""
                                                    //: xdatabaahasa.industriNama,
                                                    : xdatabaahasa.tulisan,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              height: 24,
                                              width: 1,
                                              color: Colors.grey),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Tingkat Lisan",
                                                style: blackFontStyle2.copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                //xpengalaman.industriNama == null
                                                xdatabaahasa.lisan == null
                                                    ? ""
                                                    //: xpengalaman.industriNama,
                                                    : xdatabaahasa.lisan,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              modalShowBahasa(
                                                  context,
                                                  xdatabaahasa.id.toString(),
                                                  xdatabaahasa,
                                                  widget.keycode);
                                            },
                                          )
                                        ]),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void modalShowKemampuan(context, id, xkemampuan, keycode) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 270,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/dialog/editmdpi.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 32,
                              child: Text(
                                'Lakukan Perubahan',
                                style: blueFontStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Apakah anda yakin ?',
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    hapus_kemampuan(context, id);
                                  },
                                  buttonText: "Hapus",
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                (KemampuanDatadiri(
                                                  keycode: keycode,
                                                  xkemampuan: xkemampuan,
                                                  status: "update",
                                                ))));
                                    //edit(context,xpengalaman);
                                  },
                                  buttonText: "Edit",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 48,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<bool> hapus_kemampuan(context, id) {
    UserViewModel().hapus_kemampuan(id.toString()).then((value) {//handled
      StatusModel data = value;

      print("hapus :" + data.status.toString());
      if (data.status == 200) {
        Navigator.pop(context);
        getkemampuan();
        return Flushbar(
          title: "Berhasil !!",
          message: "Data Sukses Terhapus",
          duration: Duration(seconds: 3),
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
          backgroundColor: Colors.green[600],
        )..show(context);
      } else if (data.status == 404) {
        Navigator.pop(context);
        // getkemampuan();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else if (data.status == 400) {
        Navigator.pop(context);
        //getkemampuan();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal Dihapus",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else {
        print("pengalaman hapus err: " + data.status.toString());
        Navigator.pop(context);
      }
    }).catchError((erro){
      Navigator.pop(context);
      onErrHandling(erro);
    });
  }

  void modalShowBahasa(context, id, xbahasa, keycode) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 270,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/dialog/editmdpi.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 32,
                              child: Text(
                                'Lakukan Perubahan',
                                style: blueFontStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Apakah anda yakin ?',
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    hapus_bahasa(context, id);
                                  },
                                  buttonText: "Hapus",
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                (BahasaDatadiri(
                                                  keycode: keycode,
                                                  xbahasa: xbahasa,
                                                  status: "update",
                                                ))));
                                    //edit(context,xpengalaman);
                                  },
                                  buttonText: "Edit",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 48,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<bool> hapus_bahasa(context, id) {
    UserViewModel().hapus_bahasa(id.toString()).then((value) {//handled
      StatusModel data = value;

      print("hapus :" + data.status.toString());
      if (data.status == 200) {
        Navigator.pop(context);
        getbahasa();
        return Flushbar(
          title: "Berhasil !!",
          message: "Data Sukses Terhapus",
          duration: Duration(seconds: 3),
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
          backgroundColor: Colors.green[600],
        )..show(context);
      } else if (data.status == 404) {
        Navigator.pop(context);
        // getkemampuan();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else if (data.status == 400) {
        Navigator.pop(context);
        //getkemampuan();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal Dihapus",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else {
        print("pengalaman hapus err: " + data.status.toString());
        Navigator.pop(context);
      }
    }).catchError((erro){
      Navigator.pop(context);
      onErrHandling(erro);
    });
  }
}
