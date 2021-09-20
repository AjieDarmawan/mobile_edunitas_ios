part of 'pengaturan.dart';

class ShowInfoTambahan extends StatefulWidget {
  final String keycode;
  ShowInfoTambahan({
    this.keycode,
  });

  @override
  _ShowInfoTambahanState createState() => _ShowInfoTambahanState();
}

class _ShowInfoTambahanState extends State<ShowInfoTambahan> {
  List<ShowInfotambahanModel> datainfo = new List();
  void getInfo() async {
    KarirViewModel()
        .show_info_tambahan(widget.keycode.toString())
        .then((value2) {//handled
      setState(() {
        datainfo = value2;
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
                getInfo();
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
    getInfo();
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListDatadiri(
              keycode: widget.keycode == null ? "" : widget.keycode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backPressed,
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
            'Informasi Tambahan',
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
                        Icons.more,
                        size: 56,
                        color: Colors.blue[50],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Tambahan",
                          style: blueFontStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Untuk memudahkan Anda menemukan pekerjaan yang benar-benar cocok dari segi Wilayah dan Penghasilan yang di harapkan.",
                          style: blackFontStyle2.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //     padding: EdgeInsets.all(24),
              //     color: Colors.white,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Container(
              //               child: Text(
              //                 'Informasi Tambahan',
              //                 style: blackFontStyle1.copyWith(
              //                     fontSize: 16, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             Container(
              //               child: datainfo == null
              //                   ? Container(
              //                       width: 50,
              //                       height: 50,
              //                       decoration: BoxDecoration(
              //                           border: Border.all(
              //                             color: Colors.black,
              //                           ),
              //                           borderRadius: BorderRadius.all(
              //                               Radius.circular(16))),
              //                       child: IconButton(
              //                         onPressed: () {
              //                           Navigator.of(context)
              //                               .push(new MaterialPageRoute(
              //                             builder: (BuildContext context) =>
              //                                 InsertInfoTambahan(
              //                               keycode: widget.keycode == null
              //                                   ? ""
              //                                   : widget.keycode.toString(),
              //                             ),
              //                           ));
              //                         },
              //                         icon: Icon(
              //                           Icons.add,
              //                         ),
              //                         iconSize: 30,
              //                         color: Colors.green,
              //                         splashColor: Colors.purple,
              //                       ),
              //                     )
              //                   : Text("tes"),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Text(
              //             'Untuk memudahkan Anda menemukan pekerjaan yang benar-benar cocok dari segi Wilayah dan Penghasilan yang di harapkan.',
              //             style: blackFontStyle3.copyWith(
              //                 color: Colors.black54, fontSize: 12)),
              //       ],
              //     )),

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
                              'Info tambahan lainnya',
                              style: blackFontStyle1.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          datainfo == null
                              ? Container(
                                  height: 32,
                                  child: EduButtonSecond(
                                    buttonText: "Tambah",
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            InsertInfoTambahan(
                                          keycode: widget.keycode == null
                                              ? ""
                                              : widget.keycode.toString(),
                                        ),
                                      ));
                                    },
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    datainfo == null
                        ? Container(
                            height: 16,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: datainfo.length,
                            itemBuilder: (context, index) {
                              final xdatainfo = datainfo[index];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Wilayah yang diinginkan :",
                                              style: blackFontStyle1.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                modalShowInfoTambahan(context,
                                                    xdatainfo, widget.keycode);
                                              },
                                            )
                                          ],
                                        ),
                                        Text(
                                          xdatainfo.wilayah == null
                                              ? ""
                                              : xdatainfo.wilayah.toString(),
                                          style: blueFontStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Penghasilan Minimal :",
                                          style: blackFontStyle1.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        xdatainfo.penghasilan == null
                                            ? Text("")
                                            : Text(
                                                NumberFormat.currency(
                                                        symbol: 'IDR ',
                                                        decimalDigits: 0,
                                                        locale: 'id-ID')
                                                    .format(
                                                        xdatainfo.penghasilan),
                                                style: blueFontStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                              ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Informasi lainnya ( Hobi, Url Portofolio, dll ) :",
                                          style: blackFontStyle1.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          xdatainfo.deskripsi == null
                                              ? ""
                                              : xdatainfo.deskripsi.toString(),
                                          style: blueFontStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
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

  void modalShowInfoTambahan(context, xdatainfo, keycode) {
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
                                    hapus_datainfo(context, keycode);
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
                                                (InsertInfoTambahan(
                                                  keycode: keycode,
                                                  xdatainfo: xdatainfo,
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

  Future<bool> hapus_datainfo(context, keycode) {
    KarirViewModel().hapus_infotambahan(keycode.toString()).then((value) {//handled
      StatusModel data = value;

      if (data.status == 200) {
        //Navigator.of(context).pushNamedAndRemoveUntil(ACTIVASI, (route) => false);

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => (KarirMain())));
        Navigator.pop(context);
        getInfo();
        return Flushbar(
          title: "Berhasil !!",
          message: "Data Sukkses terhapus",
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
        getInfo();
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
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      } else if (data.status == 400) {
        Navigator.pop(context);
        getInfo();
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
        // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      } else {}
    }).catchError((erro){
      Navigator.pop(context);
      onErrHandling(erro);
    });
  }
}
