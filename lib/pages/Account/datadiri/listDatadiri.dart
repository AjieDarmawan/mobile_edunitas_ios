part of 'pengaturan.dart';

class ListDatadiri extends StatefulWidget {
  final String namalengkap,
      tempatlahir,
      tanggallahir,
      nohp,
      nowa,
      pendidikan,
      gender,
      foto_me,
      alamat,
      keycode;
  ListDatadiri(
      {this.namalengkap,
      this.tempatlahir,
      this.tanggallahir,
      this.nohp,
      this.nowa,
      this.pendidikan,
      this.gender,
      this.foto_me,
      this.alamat,
      this.keycode});

  @override
  _ListDatadiriState createState() => _ListDatadiriState();
}

class _ListDatadiriState extends State<ListDatadiri> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  // SessionManager sessionManager = SessionManager();
  // void getPreferences() async {
  //   await sessionManager.getPreference().then((value) {//handled
  //     setState(() {
  //       mystatus = sessionManager.status;
  //       globalkey = sessionManager.key;
  //       globalEmail = sessionManager.email;
  //       print("email${globalEmail}");
  //       print("globalkey${globalkey}");
  //       print("mystatus${mystatus}");
  //     });
  //   });
  // }

  String varnama,
      varemail,
      vargenre,
      varalamat,
      vartgl_lahir,
      vartempat_lahir,
      varpendidikan,
      varnohp,
      varnowa,
      vargender,
      no_virtual,
      campus_me,
      prodi_me,
      logo_me,
      kelas_me,
      nosel,
      singkatan_me,
      kode_campus_me,
      foto_me;

  void datausers() {
    UserViewModel().users_detail(globalEmail.toString()).then((value) {//handled
      UsersDetailModel data = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
          varnowa = data.noWa;
          vargender = data.genre;
          vartempat_lahir = data.tempatLahir;
          vartgl_lahir = data.tanggalLahir.toString();
          no_virtual = data.no_virtual;
          campus_me = data.campus;
          prodi_me = data.prodi;
          logo_me = data.logo;
          kelas_me = data.kelas;
          nosel = data.nosel;
          singkatan_me = data.singkatan;
          kode_campus_me = data.kodecampus;
          foto_me = data.foto;
        });
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
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
                datausers();
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
   // getPreferences();
    datausers();
  }

  @override
  Widget build(BuildContext context) {
    datausers();
    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          title: Text(
            "Info Pribadi",
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        //color: mainColor1,
                        width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => EditAccount(
                        namalengkap: varnama == null ? "" : varnama,
                        tempatlahir:
                            vartempat_lahir == null ? "" : vartempat_lahir,
                        tanggallahir: vartgl_lahir == null ? "" : vartgl_lahir,
                        nohp: varnohp == null ? "" : varnohp,
                        nowa: varnowa == null ? "" : varnowa,
                        pendidikan: varpendidikan == null ? "" : varpendidikan,
                        gender: vargender == null ? "" : vargender,
                        alamat: varalamat == null ? "" : varalamat,
                        foto_me: foto_me == null ? "" : foto_me,
                        //   ),
                      ),
                    ));
                  },
                  leading: Icon(
                    Icons.person,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Data Diri",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        //color: mainColor1,
                        width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => PendidikanDatadiri(
                        keycode: widget.keycode == null
                            ? ""
                            : widget.keycode.toString(),
                      ),
                    ));
                  },
                  leading: Icon(
                    Icons.school,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Pendidikan",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        //color: mainColor1,
                        width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => ShowKeterampilan(
                          keycode:
                              widget.keycode == null ? "" : widget.keycode),
                    ));
                  },
                  leading: Icon(
                    Icons.psychology,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Keterampilan",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        //color: mainColor1,
                        width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  // onTap: () {
                  //   Navigator.of(context).push(new MaterialPageRoute(
                  //     builder: (BuildContext context) => PenglamanDatadiri(),
                  //   ));
                  // },
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => ShowPengalaman(
                        keycode: widget.keycode == null
                            ? ""
                            : widget.keycode.toString(),
                      ),
                    ));
                  },
                  leading: Icon(
                    Icons.folder_shared,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Pengalaman",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        //color: mainColor1,
                        width: 0.5),
                  ),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => ShowInfoTambahan(
                          keycode:
                              widget.keycode == null ? "" : widget.keycode),
                    ));
                  },
                  leading: Icon(
                    Icons.more,
                    color: mainColor1,
                  ),
                  title: Text(
                    "Info Tambahan",
                    style: blackFontStyle2,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: mainColor1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
