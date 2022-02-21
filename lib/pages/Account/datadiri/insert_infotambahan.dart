part of 'pengaturan.dart';

class InsertInfoTambahan extends StatefulWidget {
  final String proditerpilih, proditertambah, gajian, deskripsi, keycode;
  final ShowInfotambahanModel xdatainfo;

  InsertInfoTambahan(
      {this.proditerpilih,
      this.proditertambah,
      this.gajian,
      this.deskripsi,
      this.xdatainfo,
      this.keycode});

  @override
  _InsertInfoTambahanState createState() => _InsertInfoTambahanState();
}

class _InsertInfoTambahanState extends State<InsertInfoTambahan> {
  //initState
  bool selected = false;

  var _valuecheck = [];
  var _tempwilayah = [];
  var _tambahprodi = [];
  var _wilayahterpilih = [];
  var _proditertambah = [];
  var _temp_tambahprodi = '';
  var _resultprodi = ['', '', ''];

  var InSignIn = false;

  void _generateValueCheckWilayah() {
    var _sTempWill =
        widget.xdatainfo != null ? widget.xdatainfo.wilayah.toString() : "";
    var _tempprod = _sTempWill.split(",");
    _tempprod.sort((a, b) => a.toString().compareTo(b.toString()));
    //var _tempprod = json.decode('[' + _sTempWill + ']');
    //var _tempprod = widget.xdatainfo.wilayah;
    print('proh_c: ' + _tempprod.toString());
    if (_tempprod.length != 0) {
      for (var i = 0, n = 0; i < dataunitarea.length; i++) {
        var x = _tempprod[n].toString();
        if (x == dataunitarea[i].nama.toString()) {
          print('proh: ' + x.toString());
          _tempwilayah.add(dataunitarea[i].id);
          _wilayahterpilih.add(i);
          _valuecheck.add(true);
          if (n < _tempprod.length - 1) n++;
        } else {
          _valuecheck.add(false);
        }
      }
    } else {
      for (var i = 0; i < dataunitarea.length; i++) {
        _valuecheck.add(false);
      }
    }
  }

  void _generateValueAddProdi() {
    List _tempprod =
        widget.proditertambah != null ? widget.proditertambah.split(', ') : [];
    print('proh_t: ' + _tempprod.length.toString());
    if (_tempprod.length != 0) {
      for (var i = 0; i < _tempprod.length; i++) {
        //_proditertambah.add(_tempprod[i]);
        _tambahprodi.add(_tempprod[i].toString());
      }
    }
  }

  void _sumProdiResult() {
    _wilayahterpilih.sort();
    setState(() {
      _resultprodi[0] =
          _tempwilayah.toString().replaceAll('[', '"').replaceAll(']', '"');
      _resultprodi[1] =
          _tambahprodi.toString().replaceAll('[', '"').replaceAll(']', '"');
      _resultprodi[2] =
          _wilayahterpilih.toString().replaceAll('[', '"').replaceAll(']', '"');
    });
  }

  List<ProdiMultipleModel> listprodi = [];
  void getProdi() async {
    Masterview_model().prodimultipe().then((value) {//handled
      setState(() {
        listprodi = value == null ? [] : value;
        _generateValueCheckWilayah();
        //_generateValueAddProdi();
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List dataunitarea = [];
  void getunitrea() async {
    Masterview_model().unitarea().then((value) {//handled
      setState(() {
        dataunitarea = value == null ? [] : value;
        _generateValueCheckWilayah();
        //print('apasih: '+dataunitarea[0].nama.toString());
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void check(area) {
    if (etgajibulanan.text.toString().isEmpty) {
      Flushbar(
        title: "Maaf !!",
        message: "Mohon Di lengkapi Terlebih dahulu",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.red[600],
      )..show(context);
    } else {
      setState(() {
        InSignIn = true;
      });

      KarirViewModel()
          .insert_infotambahan(
        area.toString(),
        etgajibulanan.text.toString(),
        etdeskripsi.text.toString(),
        widget.keycode,).then((value) {//handled
        StatusModel data = value;

        if (data.status == 200) {
          setState(() {
            InSignIn = false;
          });

          Navigator.pop(context, 'berhasil');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => (ShowInfoTambahan(
          //               keycode: widget.keycode,
          //             ))));
          Flushbar(
            title: "Berhasil",
            message: "Data Berhasil Disimpan",
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
          setState(() {
            InSignIn = false;
          });

          Flushbar(
            title: "Maaf  !!",
            message:
                "Password harus lebih dari 6 karakter, mengandung huruf besar kecil dan angka",
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
          setState(() {
            InSignIn = false;
          });

          Flushbar(
            title: "Maaf  !!",
            message: "Email Sudah Digunakan",
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
        } else {
          setState(() {
            InSignIn = false;
          });
        }
      }).catchError((erro){
        InSignIn = false;
        onErrHandling(erro);
      });
    }
  }

  Future<bool> _onWillpop() {
    Navigator.pop(context);
    // _sumProdiResult();
    // Navigator.pop(context, _resultprodi.toString());
    // Flushbar(
    //   title: "Berhasil",
    //   message: "Data Berhasil Disimpan",
    //   duration: Duration(seconds: 3),
    //   flushbarPosition: FlushbarPosition.TOP,
    //   flushbarStyle: FlushbarStyle.FLOATING,
    //   reverseAnimationCurve: Curves.decelerate,
    //   forwardAnimationCurve: Curves.fastOutSlowIn,
    //   boxShadows: [
    //     BoxShadow(
    //         color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
    //   ],
    //   backgroundColor: Colors.green[600],
    // )..show(context);
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
                getunitrea();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var etgajibulanan, etdeskripsi;
  var pnghsilan, dskrpsi;

  @override
  void initState() {
    super.initState();
    //getProdi();
    getunitrea();
    pnghsilan = widget.xdatainfo == null ? "0" : widget.xdatainfo.penghasilan;
    dskrpsi = widget.xdatainfo == null ? "" : widget.xdatainfo.deskripsi;
    etgajibulanan = TextEditingController(text: pnghsilan.toString());
    etdeskripsi = TextEditingController(text: dskrpsi.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          title: Text(
            'Tambahkan Info Tambahan',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Text("Pilih Wilayah yang di inginkan",
                    style: blueFontStyleBold),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 420,
                child: ListView.builder(
                  itemCount: dataunitarea.length,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return dataunitarea.length != 0
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: CheckboxListTile(
                              title: Text(dataunitarea[i].nama),
                              value: _valuecheck[i],
                              onChanged: (bool value) {
                                setState(() {
                                  _valuecheck[i] = value;
                                  if (value) {
                                    _tempwilayah.add(dataunitarea[i].id);
                                    _wilayahterpilih.add(i);
                                  } else {
                                    _tempwilayah.removeWhere(
                                        (item) => item == dataunitarea[i].id);
                                    _wilayahterpilih
                                        .removeWhere((item) => item == i);
                                  }
                                });
                                print('prodi_apaansih: ' +
                                    _tempwilayah
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''));
                              },
                            ),
                          )
                        : Center(child: SpinKitThreeBounce(color: mainColor1));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text("Penghasilan yang diharapkan",
                    style: blueFontStyleBold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor1, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  cursorColor: mainColor1,
                  controller: etgajibulanan,
                  keyboardType: TextInputType.phone,
                  //enabled: false,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, bottom: 5, top: 5, right: 10),
                      hintText: "Gaji Bulanan"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text("Desripsi Pekerjaan", style: blueFontStyleBold),
                    Text(' *',
                        style: blueFontStyleBold.copyWith(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor1, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  maxLines: 4,
                  cursorColor: mainColor1,
                  controller: etdeskripsi,
                  //validator: nameValidator,
                  //enabled: false,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: "Deskripsi Pekerjaan"),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 48,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: InSignIn
                            ? SpinKitFadingCircle(color: orenColor)
                            : EduButton(
                                buttonText: "Simpan",
                                onPressed: () {
                                  check(_tempwilayah
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', ''));
                                },
                              ),
                      ),
                    )),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
