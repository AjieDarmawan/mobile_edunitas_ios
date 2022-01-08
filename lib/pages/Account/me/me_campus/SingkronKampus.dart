part of 'me_kampus.dart';

class SingkronKampus extends StatefulWidget {
  final String email,
      keycode,
      namalengkap,
      logo_me,
      campus_me,
      prodi_me,
      no_virtual,
      nosel,
      singkatan_me,
      kode_campus_me,
      kelas_me;
  SingkronKampus(
      {this.email,
      this.keycode,
      this.namalengkap,
      this.logo_me,
      this.campus_me,
      this.prodi_me,
      this.singkatan_me,
      this.kelas_me,
      this.nosel,
      this.kode_campus_me,
      this.no_virtual});

  @override
  _SingkronKampusState createState() => _SingkronKampusState();
}

class _SingkronKampusState extends State<SingkronKampus> {
  //TextEditingController etemail = TextEditingController();
  TextEditingController etno_virtual = TextEditingController();

  var etemail;

  List<KelasModel> datakelas = new List();
  void getkelas() async {
    Masterview_model().masterkelas().then((value2) {//handled
      setState(() {
        datakelas = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<KampusMasterModel> datakampus = new List();
  void getkampus() async {
    Masterview_model().kampus_master().then((value2) {//handled
      setState(() {
        datakampus = value2;
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
                getkelas();
                getkampus();
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
    getkelas();
    getkampus();
    etemail = TextEditingController(text: widget.email);
  }

  var valkelas;
  var hintkelas;
  void modalBottomKel(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      height: 4,
                      width: 32,
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: datakelas.length == 0
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: datakelas.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datakelas[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkelas = lastDataSipema.singkatan;
                                    hintkelas = lastDataSipema.nama;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(lastDataSipema.nama,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: whiteFontStyle.copyWith(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  var valkampus;
  var hintkampus;
  void modalBottomKamp(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 480,
            child: Column(
              children: [
                Container(
                  height: 48,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      height: 4,
                      width: 32,
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: datakampus.length == 0
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: datakampus.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datakampus[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkampus = lastDataSipema.singkatan;
                                    hintkampus = lastDataSipema.nama;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(lastDataSipema.nama,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: whiteFontStyle.copyWith(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.white38,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  var InSignIn = false;
  void check() {
    print('tes');

    setState(() {
      InSignIn = true;
    });

    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      print('cees');
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etno_virtual.text.toString() == null ||
          valkampus.toString() == null ||
          valkampus.toString() == "null" ||
          valkampus.toString() == "" ||
          valkelas.toString() == null ||
          valkelas.toString() == "null" ||
          valkelas.toString() == "") {
        setState(() {
          InSignIn = false;
        });
        Flushbar(
          title: "Error",
          message: "Mohon Di lengkapi Terlebih dahulu",
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
        Apiinfoview_model()
            .sinkron_mhs(
                widget.keycode.toString(),
                etno_virtual.text.toString(),
                valkelas.toString(),
                widget.email,
                valkampus.toString()).then((value) {//handled
          StatusModel data = value;

          if (data.status == 200) {
            setState(() {
              InSignIn = false;
            });

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (List_me_campus(
                          email: etemail.text.toString() == null
                              ? ""
                              : etemail.text.toString(),
                          namalengkap: widget.namalengkap == null
                              ? ""
                              : widget.namalengkap,
                          logo_me: widget.logo_me == null ? "" : widget.logo_me,
                          prodi_me:
                              widget.prodi_me == null ? "" : widget.prodi_me,
                          campus_me:
                              widget.campus_me == null ? "" : widget.campus_me,
                          no_virtual: widget.no_virtual == null
                              ? ""
                              : widget.no_virtual,
                          kelas_me:
                              widget.kelas_me == null ? "" : widget.kelas_me,
                          nosel: widget.nosel == null ? "" : widget.nosel,
                          singkatan_me: widget.singkatan_me == null
                              ? ""
                              : widget.singkatan_me,
                          keycode: widget.keycode == null
                              ? ""
                              : widget.keycode.toString(),
                          kode_campus_me:
                              widget.kode_campus_me.toString() == null
                                  ? ""
                                  : widget.kode_campus_me.toString(),
                        ))));

            Flushbar(
              title: "Berhasil",
              message: "Singkronisasi Berhasil",
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
          } else if (data.status == 400) {
            setState(() {
              InSignIn = false;
            });

            Flushbar(
              title: "Maaf",
              message: "Virtual yang kamu masukkan sudah terdaftar",
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
          } else if (data.status == 401) {
            setState(() {
              InSignIn = false;
            });

            Flushbar(
              title: "Maaf",
              message:
                  "Email yang kamu masukan sudah terdaftar di kampus mitra kami",
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
          } else if (data.status == 404) {
            setState(() {
              InSignIn = false;
            });

            Flushbar(
              title: "Sinkronisasi gagal",
              message: "Sinkronisasi gagal, Nomor Virtual tidak ditemukan",
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

      // update_profile();

    };
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("valkelas${valkelas}");
    print("valkampus${valkampus}");

    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Kampus Saya',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFBAE3FF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anda ingin melakukan singkronisasi SIPEMA ?',
                      style:
                          blueFontStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Bagi yang tercatat sebagai mahasiswa aktif atau mahasiswa baru yang akan melakukan sinkronisasi SIPEMA ke eduNitas, anda tidak perlu Daftar Online Cukup lakukan sinkronisasi pada form di bawah',
                      style: blueFontStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(24),
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Form Sinkronisasi Data',
                        style: blackFontStyle1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Singkronisasi data mahasiswa dari sipema ke eduNitas',
                          style: blackFontStyle3.copyWith(
                              color: Colors.black54, fontSize: 12)),
                      Divider(
                        color: Colors.grey,
                        height: 24,
                        thickness: 1,
                      ),
                      Text('Email', style: blueFontStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: mainColor1,
                          controller: etemail,
                          enabled: false,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 5, top: 5, right: 10),
                              hintText: "Email"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('No Virtual Account (Tanpa Spasi)',
                          style: blueFontStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: etno_virtual,
                          cursorColor: mainColor1,
                          //validator: waValidator,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 5, top: 5, right: 10),
                              hintText: "123456789"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Pilih Kelas Sesuai SIPEMA', style: blueFontStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            if (datakelas != null) {
                              modalBottomKel(context);
                            }
                          },
                          leading: Text(
                              datakelas != null
                                  ? hintkelas == null
                                      ? 'Pilih Kelas'
                                      : hintkelas
                                  : 'Mohon tunggu..',
                              style: blackFontStyle1.copyWith(fontSize: 16)),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Pilih Kampus sesuai SIPEMA', style: blueFontStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            if (datakampus != null) {
                              modalBottomKamp(context);
                            }
                          },
                          leading: Text(
                              datakampus != null
                                  ? hintkampus == null
                                      ? 'Pilih Kampus'
                                      : hintkampus
                                  : 'Mohon tunggu..',
                              style: blackFontStyle1.copyWith(fontSize: 16)),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        child: InSignIn
                            ? SpinKitFadingCircle(color: orenColor)
                            : EduButton(
                                onPressed: () {
                                  check();
                                },
                                buttonText: "Sinkronisasi",
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 96,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue[200],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Icon(
                      Icons.location_city_outlined,
                      color: Colors.blue[100],
                      size: 64,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Icon(
                      Icons.location_city_outlined,
                      color: Colors.blue[100],
                      size: 64,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      Icons.domain_outlined,
                      color: Colors.blue[100],
                      size: 64,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 72.0),
                    child: Text(
                      'Sedang mencari kampus dan ingin mendaftar kuliah ?',
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                height: 64,
                color: mainColor1,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  child: Text(
                    'Daftar disini !',
                    style: whiteFontStyle,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
