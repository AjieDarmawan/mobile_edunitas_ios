part of 'account.dart';

class EditAccount extends StatefulWidget {
  final String namalengkap,
      tempatlahir,
      tanggallahir,
      nohp,
      nowa,
      pendidikan,
      gender,
      foto_me,
      alamat;
  EditAccount(
      {this.namalengkap,
      this.tempatlahir,
      this.tanggallahir,
      this.nohp,
      this.nowa,
      this.pendidikan,
      this.gender,
      this.foto_me,
      this.alamat});

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {//handled
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
        print("mystatus${mystatus}");
      });
    });
  }

  var loading_image = false;

  String name, email, password1, confrim_password;
  List<PendidikanModel> datapendidikan = new List();
  var etemail;

  var InSignIn = false;
  var valpendidikan;

  String valgender;

  List gender = [
    {"inisial": "L", "isi": "Laki - Laki"},
    {"inisial": "P", "isi": "Perempuan"},
  ];

  //1//
  DateTime _dueDate = DateTime.now();
  String dateText = "";
  selectDueDate(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDate = picked;
        dateText = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  File image, image_save; //ktp
  TextEditingController ctitle = new TextEditingController();
  accessCamera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
  
    final title = ctitle.text;
  
    Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    Img.Image _smallerimg = Img.copyResize(_image,
        width: 300, height: 300, interpolation: Img.Interpolation.linear);
  
    var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
      ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  
    if (img == null) {
      print('null');
    } else {
      setState(() {
        image = img;
        image_save = compressImg;
        uploadPhoto();
  
        //  uploadimg();
        // uploadktp();
      });
    }
  }
  
  accessGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
  
    final title = ctitle.text;
  
    Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    Img.Image _smallerimg = Img.copyResize(_image,
        width: 300, height: 300, interpolation: Img.Interpolation.linear);
  
    var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
      ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  
    if (img == null) {
      print('null');
    } else {
      setState(() {
        image = img;
        image_save = compressImg;
        uploadPhoto();
        //  uploadimg();
        // uploadktp();
      });
    }
  }

  void uploadPhoto() {
    setState(() {
      loading_image = true;
    });
    UserViewModel()
        .gantipp(globalkey.toString(), image_save, context)
        .then((value) {//handled
      setState(() {
        loading_image = false;
        Navigator.pop(context);
      });
    }).catchError((erro){
      Navigator.pop(context);
      onErrHandling(erro);
    });
    //network.gantiktp(globalEmail, image_save, context);
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
                getpendidikan();
                getPreferences();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var etnama, ettempatlahir, etwa, ethp, etalamat;
  @override
  void initState() {
    super.initState();
    getpendidikan();
    getPreferences();
    etnama = TextEditingController(text: widget.namalengkap);
    ettempatlahir = TextEditingController(text: widget.tempatlahir);
    etwa = TextEditingController(text: widget.nowa);
    ethp = TextEditingController(text: widget.nohp);
    etalamat = TextEditingController(text: widget.alamat);
    print("etwa${widget.nowa}");
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void getpendidikan() async {
    Masterview_model().masterpendidikan().then((value2) {//handled
      setState(() {
       // datapendidikan = value2;
         datapendidikan = value2 == null ? [] : value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      // Toast.show("Login", context, duration: 3, gravity: Toast.BOTTOM);
      //login();

      setState(() {
        InSignIn = true;
      });

      var etnama1 = etnama.text.toString();
      var ettempatlahir1 = ettempatlahir.text.toString();
      var etwa1 = etwa.text.toString();
      var ethp1 = ethp.text.toString();
      var etalamat1 = etalamat.text.toString();
      print("et${etnama1.toString()}");
      print("et${ettempatlahir1.toString()}");
      print("et${etwa1.toString()}");
      print("et${ethp1.toString()}");
      print("et${etalamat1.toString()}");
      print("et${valpendidikan.toString()}");
      print("etgender${valgender.toString()}");

      // update_profile();

      UserViewModel()
          .update_profile(
              globalkey.toString(),
              etnama1.toString(),
              ettempatlahir1.toString(),
              dateText.toString(),
              valpendidikan.toString(),
              valgender.toString(),
              ethp1.toString(),
              etwa1.toString(),
              etalamat1.toString())
          .then((value) {//handled
        StatusModel data = value;

        if (data.status == 200) {
          setState(() {
            InSignIn = false;
          });

          Navigator.pop(context);
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
    };
  }

  String confirmValidator(String value) {
    _formKey.currentState.save();
    print("myPassword" + password1);
    if (value == password1) {
      print("success $value $password1");
      return null;
    } else {
      print("gagal $value $password1");

      if (value.length == 0) {
        return "Kata sandi harus lebih dari 4";
      } else {
        return "Pengulangan kata sandi tidak sama";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              )),
              automaticallyImplyLeading: false,
              brightness: Brightness.dark,
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: mainColor1,
              expandedHeight: 90.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Ubah Data Diri',
                  style: whiteFontStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 16),
                          Container(
                            child: loading_image
                                ? SpinKitFadingCircle(
                                    color: orenColor,
                                  )
                                : image == null
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      ShowContent(
                                                        onTap1: () {
                                                          accessGallery();
                                                        },
                                                        onTap2: () {
                                                          accessCamera();
                                                        },
                                                      ));
                                            },
                                            child: Container(
                                              width: 72,
                                              height: 72,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  widget.foto_me == null
                                                      ? ""
                                                      : widget.foto_me,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      ShowContent(
                                                        onTap1: () {
                                                          accessGallery();
                                                        },
                                                        onTap2: () {
                                                          accessCamera();
                                                        },
                                                      ));
                                            },
                                            child: Center(
                                              child: Container(
                                                margin: EdgeInsets.all(2),
                                                child: Image.file(
                                                  image,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                          ),
                          Center(child: Text("Upload Image")),
                          Divider(),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Nama Lengkap",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              keyboardType: TextInputType.text,
                              controller: etnama,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.white),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.blue),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "Nama Lengkap",
                              ),
                              validator: nameValidator,
                              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Tempat Lahir",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              keyboardType: TextInputType.text,
                              controller: ettempatlahir,
                              //maxLength: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.white),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.blue),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "Jakarxxxx",
                              ),
                              validator: nameValidator,
                              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Tanggal Lahir",
                              style: blackFontStyle2,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.date_range_rounded,
                                color: Colors.blue,
                              ),
                              TextButton(
                                onPressed: () {
                                  selectDueDate(context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      dateText == ""
                                          ? widget.tanggallahir
                                          : dateText,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.blue),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Jenis Kelamin",
                              style: blackFontStyle2,
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              height: MediaQuery.of(context).size.height / 11,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(7.0),
                              //     border: Border.all(color: Colors.blueGrey)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: valgender,
                                  hint: Text(widget.gender == "L"
                                      ? "Laki - laki"
                                      : widget.gender == "P"
                                          ? "Perempuan"
                                          : "Pilih"),
                                  items: gender.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item['isi']),
                                      value: item['inisial'],
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      valgender = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Nomor WhatsApp",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              keyboardType: TextInputType.phone,
                              controller: etwa,
                              maxLength: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.white),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.blue),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "08123456xxxx",
                              ),
                              //  validator: waValidator,
                              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Nomor Telepon",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              keyboardType: TextInputType.phone,
                              controller: ethp,
                              maxLength: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.white),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.blue),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "08123456xxxx",
                              ),
                              validator: nameValidator,
                              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Pendidikan Terakhir",
                              style: blackFontStyle2,
                            ),
                          ),
                          Center(
                            child: datapendidikan.length ==0 ? Container() : Container(
                              padding: EdgeInsets.only(left: 8, right: 16),
                              //width: MediaQuery.of(context).size.width,
                              //height: MediaQuery.of(context).size.height / 11,
                              child: DropdownButton(
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                value: valpendidikan,
                                //value: valPendidikan == null ? valPendidikan : buildingTypes.where( (i) => i.name == valPendidikan.name).first as BuildingType,
                                hint: Text(widget.pendidikan),
                                items: datapendidikan.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.nama),
                                    value: item.kode.toString(),
                                  );
                                }).toList(),
                                onChanged: (value) async {
                                  // dataCity = await network.getCity(value);
                                  setState(() {
                                    valpendidikan = value;
                                    // valCity = null;
                                  });
                                  //print(dataCity);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Text(
                              "Alamat",
                              style: blackFontStyle2,
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              keyboardType: TextInputType.text,
                              maxLines: 10,
                              controller: etalamat,
                              // maxLength: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.white),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide:
                                //       BorderSide(color: Colors.blue),
                                //   borderRadius:
                                //       BorderRadius.circular(25.7),
                                // ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "Jakarxxxx",
                              ),
                              //validator: waValidator,
                              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 48,
                              child: InSignIn
                                  ? SpinKitFadingCircle(color: orenColor)
                                  : EduButton(
                                      onPressed: () {
                                        checkEmailAndPassowrd();
                                      },
                                      buttonText: 'Simpan',
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]))
          ],
        ));
  }
}

class ShowContent extends StatelessWidget {
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  const ShowContent({@required this.onTap1, this.onTap2});

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
