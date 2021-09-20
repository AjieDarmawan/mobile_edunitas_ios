part of 'widget_agensi.dart';

class AgensiMe extends StatefulWidget {
  final String keycode, nameRek;

  AgensiMe({
    this.keycode,
    this.nameRek,
  });
  @override
  _AgensiMeState createState() => _AgensiMeState();
}

class _AgensiMeState extends State<AgensiMe> {
  TextEditingController etnama = new TextEditingController();
  TextEditingController etemail = new TextEditingController();
  TextEditingController etnohp = new TextEditingController();
  TextEditingController etnowa = new TextEditingController();

  String edit_gambar;
  String _cid_mhs;

  CheckRekeningAgentModel rekList;
  String _cid_r;
  String _kodebank;
  String _norekening;
  String _namarekening;
  String _label_bank;
  String _ccid;
  String _imgbuku;

  bool _loading = false;

  var random_name_brek = 0;
  var InSignIn = false;

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
  //       datausers();
  //     });
  //   });
  // }

  List<Photo> datakampus = [];
  void getKampus() async {
    Kampusview_model().getKampus().then((value) {//handled
      setState(() {
        datakampus = value;
      });
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  UsersDetailModel userInfo;
  void datausers() {
    UserViewModel().users_detail(globalEmail.toString()).then((value) {//handled
      UsersDetailModel data = value;
      if (data.status == 200) {
        setState(() {
          userInfo = data;
        });
      }
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  var valkampus;
  var hintkampus;
  void modalBottomAgensi(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentKampusModal(
            datalist: datakampus,
          );
        });
    setState(() {
      valkampus = result[0].toString();
      hintkampus = result[1].toString();
    });
  }

  File image_brek, image_brek_save; //ktp
  TextEditingController ctitleimage_brek = new TextEditingController();
  accessGallery() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitleimage_brek.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image_${random_name_brek}${random_name_brek}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_brek = img;
    //     image_brek_save = compressImg;
    //     print("phoho: " + image_brek.toString());
    //     Navigator.pop(context);
    //   });
    // }
  }

  File image_brekgambar1, brekgambar1_save; //ktp
  TextEditingController ctitle_brekgambar1 = new TextEditingController();
  accessCamera() async {
    // File imgjob_gambar1 =
    //     await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_brekgambar1.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar1.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job1 =
    //     new File("$path/image1_${random_name_brek}${random_name_brek}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar1 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_brekgambar1 = imgjob_gambar1;
    //     brekgambar1_save = compressImg_job1;
    //     Navigator.pop(context);
    //   });
    // }
  }

  void getInfoRekening() {
    Agentview_model().getRekening(widget.keycode).then((value) {//handled
      setState(() {
        CheckRekeningAgentModel data = value;
        rekList = data;
        _cid_r = data.cid == null ? "" : data.cid;
        _kodebank = data.kodebank == null ? "" : data.kodebank;
        _norekening = data.norekening == null ? "" : data.norekening;
        _namarekening = data.namarekening == null ? "" : data.namarekening;
        _label_bank = data.label_bank == null ? "" : data.label_bank;
        _ccid = data.ccid == null ? "" : data.ccid;
        _imgbuku = data.imgbuku == null ? "" : data.imgbuku;
        print("cidcid: "+_cid_r);
        print("ccidccid: "+_ccid);
      });
    }).catchError((erro) {
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
                getInfoRekening();
                getKampus();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  bool _nrek = false;

  @override
  void initState() {
    super.initState();
    _nrek = widget.nameRek!=null?true:false;
    //getPreferences();
    getInfoRekening();
    getKampus();
  }

  Future<bool> _backAgent() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
  }

  void _backNonAgent() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backAgent,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            backgroundColor: mainColor1,
            title: Text(
              'Mitra Agensi',
              style: whiteFontStyle,
            ),
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.grey[300],
              ),
              SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 3.0)
                            ],
                            color: Colors.white),
                        child: ListTile(
                            leading: Icon(Icons.credit_card),
                            title: _namarekening == null
                                ? Text("Loading..")
                                : Text(_namarekening),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _label_bank == null ? Text("") : Text(_label_bank),
                                _norekening == null ? Text("") : Text(_norekening),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (FormulirMitraAgensi(
                                          keycode: widget.keycode, userInfo: userInfo, rekinfo: rekList, edit: true,
                                        )))).then((value){//handled
                                  if(value=='edited'){
                                    getInfoRekening();
                                  }
                                }).catchError((erro) {
                                  onErrHandling(erro);
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.account_balance_wallet,
                                    color: mainColor1),
                                title: Text(
                                  "Informasi Perolehan",
                                  style: blackFontStyle2,
                                ),
                                trailing: Icon(Icons.navigate_next),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (InformasiPerolehan(
                                            keycode: widget.keycode,
                                          ))));
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.account_balance_wallet,
                                    color: mainColor1),
                                title: Text(
                                  "Syarat & Ketentuan",
                                  style: blackFontStyle2,
                                ),
                                trailing: Icon(Icons.navigate_next),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (MainAgensi(onSyarat: true,))));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 3.0)
                                ],
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 48,
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Nama ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    cursorColor: mainColor1,
                                    controller: etnama,
                                    validator: nameValidator,
                                    //enabled: false,
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      hintText: "Nama",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Email ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    cursorColor: mainColor1,
                                    controller: etemail,
                                    validator: emailValidator,
                                    //enabled: false,
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      hintText: "Email",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "No. Handphone ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    cursorColor: mainColor1,
                                    controller: etnowa,
                                    validator: teleponValidator,
                                    //enabled: false,
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      hintText: "+628xxxxx",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "No. Whatsapp ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: TextFormField(
                                    cursorColor: mainColor1,
                                    controller: etnohp,
                                    validator: teleponValidator,
                                    //enabled: false,
                                    decoration: new InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      // errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      hintText: "+628xxxxx",
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Pilih kampus yang diminati ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey, width: 1),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        modalBottomAgensi(context);
                                      },
                                      // leading: Text("Provinsi",
                                      //     style: blackFontStyle1.copyWith(fontSize: 16)),
                                      leading: Text(
                                        hintkampus == null
                                            ? 'Pilih Kampus yang Diminati'
                                            : hintkampus,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      trailing: Icon(
                                        Icons.navigate_next,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Foto Bersama Mahasiswa ",
                                      style: blueFontStyleBold,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => ShowContent(
                                            onTap1: () {
                                              accessGallery();
                                            },
                                            onTap2: () {
                                              accessCamera();
                                            },
                                          ));
                                    },
                                    child:
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(vertical: 16),
                                    //   height: 56,
                                    //   width: 56,
                                    //   child: Stack(
                                    //     children: [
                                    //       Image(
                                    //         image: AssetImage("assets/uploadlogo.png"),
                                    //       ),
                                    //       Center(
                                    //         child: Container(
                                    //             height: 32,
                                    //             width: 32,
                                    //             color: Colors.white),
                                    //       ),
                                    //       Center(
                                    //         child: Icon(
                                    //           Icons.supervised_user_circle_outlined,
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    Container(
                                        margin:
                                        EdgeInsets.symmetric(vertical: 16),
                                        height: 56,
                                        width: 56,
                                        child: image_brek == null &&
                                            edit_gambar == null
                                            ? Stack(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  "assets/uploadlogo.png"),
                                            ),
                                            Center(
                                              child: Container(
                                                  height: 32,
                                                  width: 32,
                                                  color: Colors.white),
                                            ),
                                            Center(
                                              child: Icon(
                                                Icons
                                                    .supervised_user_circle_outlined,
                                              ),
                                            )
                                          ],
                                        )
                                            : edit_gambar != null
                                            ? Image.network(edit_gambar)
                                            : Image.file(image_brek)),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 16),
                                    height: 48,
                                    width: 250,
                                    child: InSignIn
                                        ? SpinKitFadingCircle(color: orenColor)
                                        : EduButton(
                                      onPressed: () {
                                        setState(() {
                                          InSignIn = true;
                                          check();
                                        });
                                      },
                                      buttonText: "Join as Partner",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.0)),
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                'Profile Mahasiswa yang direkomendasikan',
                                style: whiteFontStyle.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }

  void check() {
    bool image_ada =
        edit_gambar != null || image_brek_save != null ? true : false;
    print("check_daftar_mhs_agent: \n" +
        etnama.text.toString() +
        ",\n" +
        etemail.text.toString() +
        ",\n" +
        etnohp.text.toString());

    if (image_ada == true || _imgbuku != null) {
      Agentview_model()
          .daftarkan_mhs(
        etnama.text.toString(),
        etemail.text.toString(),
        etnohp.text.toString(),
        etnowa.text.toString(),
        valkampus,
        image_brek_save,
        widget.keycode.toString(),
        context,
      )
          .then((value) {//handled
        if (value != null) {
          print("tell_me_what_happen: " + value.toString());
          AddMhsAgensiModel data = value == null ? [] : value;

          if (data.statuscode.toString() == "200") {
            setState(() {
              _loading = false;
              InSignIn = false;
              var mm = data.response;
              print("tell_me_what_happen: " + mm);
              // data.responsecode;
              // data.statuscode;
              // data.message;
            });

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
          }
        } else {
          setState(() {
            _loading = false;
            InSignIn = false;
          });
          Flushbar(
            title: "Gagal",
            message: "Data Gagal Disimpan",
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
        }
      }).catchError((erro) {
        onErrHandling(erro);
      });
    } else {
      setState(() {
        _loading = false;
        InSignIn = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "Mohon Isi Foto Selfie",
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
    }
  }
}

class ShowContentAgensi extends StatelessWidget {
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  const ShowContentAgensi({@required this.onTap1, this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 360,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                child: Text(
                  'Upload File',
                  style: blueFontStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                //color: Colors.red,
                height: 100,
                child: Image.asset(
                  "assets/dialog/uploadxhdpi.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: mainColor1,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: onTap1,
                      leading: Icon(
                        Icons.collections_outlined,
                      ),
                      title: Text(
                        'Pilih Dari Galeri',
                        style: blackFontStyle1.copyWith(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.add_circle_outline_outlined),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: mainColor1,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: onTap2,
                      leading: Icon(
                        Icons.add_a_photo_outlined,
                      ),
                      title: Text(
                        'Pilih Dari Kamera',
                        style: blackFontStyle1.copyWith(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.add_circle_outline_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentKampusModal extends StatefulWidget {
  var datalist;
  ContentKampusModal({Key key, @required this.datalist}) : super(key: key);
  @override
  ContentKampusModalState createState() => new ContentKampusModalState();
}

class ContentKampusModalState extends State<ContentKampusModal> {
  TextEditingController etkampus = new TextEditingController();

  //List<MasterDaerahModel> dataListwilayah = [];
  //List bankListDummy = ["Polnas", "Lainnya"];
  List<Photo> kampusList = [];

  List tempKampus = [];
  List ftempKampus = [];
  List<String> result = ["", ""];

  int lenght = 0;

  final _debouncer = Debouncer(milliseconds: 1200);

  void searchKampus(dataSearch) async {
    Kampusview_model().SearchgetKampusFront(dataSearch).then((value) {//handled
      setState(() {
        kampusList = value;
        lenght = kampusList.length;
        print("hdata_fy: " + kampusList.toString());
      });
    }).catchError((erro) {
      onErrHandlingS(erro);
    });
  }

  void onErrHandlingS(erro){
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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              buttonText: 'Tutup',
            ),
          )).show(context);
    }
  }

  @override
  initState() {
    super.initState();

    kampusList = widget.datalist;
    tempKampus = kampusList;
    ftempKampus = kampusList;
    lenght = kampusList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: mainColor1, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: mainColor1,
                controller: etkampus,
                keyboardType: TextInputType.text,
                //enabled: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
                    hintText: "Cari Kampus"),
                onChanged: (string) {
                  setState(() {
                    // ftempKampus = tempKampus
                    //     .where((u) => (u.nama
                    //         .toLowerCase()
                    //         .contains(string.toLowerCase())))
                    //     .toList();
                    // lenght = ftempKampus.length;
                    print("hdata_th: " + kampusList.toString());
                    lenght = 0;
                    print("hdata_nao: " + kampusList.toString());
                    _debouncer.run(() {
                      searchKampus(string);
                    });
                  });
                },
              ),
            ),
            Container(
              child: Expanded(
                child: lenght == 0
                    ? Column(
                        children: [
                          Text("Tidak ditemukan",
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
                      )
                    : ListView.builder(
                        itemCount: lenght,
                        itemBuilder: (BuildContext context, int index) {
                          final fdata = ftempKampus[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                //print("valpos: "+lastDataSipema.id.toString()+"&&"+lastDataSipema.nama);
                                //valposisi = lastDataSipema.id;
                                //hintposisi = lastDataSipema.nama;
                                result[0] = fdata.kode.toString();
                                result[1] = fdata.nama.toString();
                                Navigator.pop(context, result);
                              });
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 24, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(fdata.nama,
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
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
