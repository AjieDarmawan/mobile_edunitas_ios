part of 'Auth.dart';

class RegistarDatadiri extends StatefulWidget {
  final String email2;
  RegistarDatadiri({
    this.email2,
  });

  @override
  _RegistarDatadiriState createState() => _RegistarDatadiriState();
}

class _RegistarDatadiriState extends State<RegistarDatadiri> {
  String name, email, password1, confrim_password;
  List<PendidikanModel> datapendidikan = new List();
  var etemail;
  // TextEditingController etEmail = TextEditingController();
  TextEditingController etnama = TextEditingController();
  TextEditingController etnotlpn = TextEditingController();
  TextEditingController etnowa = TextEditingController();
  TextEditingController etPassword = TextEditingController();
  TextEditingController etPassword2 = TextEditingController();
  var InSignIn = false;
  var valpendidikan;

  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  @override
  void initState() {
    super.initState();
    getpendidikan();
    etemail = TextEditingController(text: widget.email2);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void getpendidikan() async {
    Masterview_model().masterpendidikan().then((value2) {
      setState(() {
        datapendidikan = value2;
      });
    });
  }

  void checkEmailAndPassowrd() async {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etPassword.text.isEmpty || valpendidikan.toString().isEmpty) {
        // Toast.show("Email/Password Tidak Boleh Kosong", context,
        //     duration: 3, gravity: Toast.BOTTOM);

        Fluttertoast.showToast(
            msg: "Harus Di isi Semua",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            fontSize: 16.0);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => (RegistarDatadiri())));
      } else {
        // Toast.show("Login", context, duration: 3, gravity: Toast.BOTTOM);
        //login();

        setState(() {
          InSignIn = true;
        });

        cek_email();
      }
    }
    ;
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

  void cek_email() {
    UserViewModel()
        .register(
            widget.email2.toString(),
            etPassword.text.toString(),
            etnama.text.toString(),
            etnowa.text.toString(),
            etnotlpn.text.toString(),
            valpendidikan.toString())
        .then((value) {
      StatusModel data = value;
      print("status${data.status}");
      print("etnowa${etnowa.text.toString()}");
      if (data.status == 200) {
        //Navigator.of(context).pushNamedAndRemoveUntil(ACTIVASI, (route) => false);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    (Activasi(email3: widget.email2.toString()))));
      }
      // else if (data.status == 404) {
      //   setState(() {
      //     InSignIn = false;
      //   });

      //   Flushbar(
      //     title: "Maaf !!",
      //     message:
      //         "Password harus lebih dari 6 karakter, mengandung huruf besar kecil dan angka",
      //     duration: Duration(seconds: 3),
      //     flushbarPosition: FlushbarPosition.TOP,
      //     flushbarStyle: FlushbarStyle.FLOATING,
      //     reverseAnimationCurve: Curves.decelerate,
      //     forwardAnimationCurve: Curves.fastOutSlowIn,
      //     boxShadows: [
      //       BoxShadow(
      //           color: Colors.black38,
      //           offset: Offset(0.0, 3.0),
      //           blurRadius: 3.0)
      //     ],
      //     backgroundColor: Colors.red[600],
      //   )..show(context);

      //   // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
      // }
      else if (data.status == 400) {
        setState(() {
          InSignIn = false;
        });

        Flushbar(
          title: "Maaf !!",
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            automaticallyImplyLeading: false,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: mainColor1,
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Registrasi Data Diri',
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
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(
                            "Email",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            controller: etemail,
                            enabled: false,
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
                                fillColor: Colors.blue[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // labelText: "Email",
                                hintText: "Email"),
                            validator: emailValidator,
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
                            "Nama Lengkap",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
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
                            validator: baruValidator,
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
                            "Kata Sandi",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            obscureText: _isHidePassword,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            //  keyboardType: TextInputType.visiblePassword,
                            controller: etPassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.white),
                              //   borderRadius: BorderRadius.circular(25.7),
                              // ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.white),
                              //   borderRadius: BorderRadius.circular(25.7),
                              // ),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglePasswordVisibility();
                                },
                                child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _isHidePassword
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //labelText: "Password",
                              hintText: "Kata Sandi",
                            ),
                            validator: nameValidator,
                            onSaved: (value) {
                              password1 = value;
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(
                            "Ulangi Kata Sandi",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            obscureText: _isHidePassword,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            //  keyboardType: TextInputType.visiblePassword,
                            controller: etPassword2,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.white),
                              //   borderRadius: BorderRadius.circular(25.7),
                              // ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.white),
                              //   borderRadius: BorderRadius.circular(25.7),
                              // ),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglePasswordVisibility();
                                },
                                child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _isHidePassword
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //labelText: "Password",
                              hintText: "Ulangi Kata Sandi",
                            ),
                            validator: confirmValidator,
                            onSaved: (value) {
                              confrim_password = value;
                            },
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
                            child: Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 25, right: 15),
                                child: Text(
                                  "+62",
                                  style: blackFontStyle2,
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  keyboardType: TextInputType.phone,
                                  controller: etnowa,
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
                                    hintText: "8123456xxxx",
                                  ),
                                  validator: waValidator,
                                  // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                  onSaved: (value) {
                                    email = '0' + value;
                                  },
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(
                            "Nomor Telepon",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 25, right: 15),
                              child: Text(
                                "+62",
                                style: blackFontStyle2,
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                keyboardType: TextInputType.phone,
                                controller: etnotlpn,
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
                                  hintText: "8123456xxxx",
                                ),
                                validator: teleponValidator,
                                // validator: (value) => value.length < 6 ? 'Password too short.' : null,
                                onSaved: (value) {
                                  email = '0' + value;
                                },
                              ),
                            )
                          ],
                        )),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(
                            "Pendidikan Terakhir",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            onTap: () {
                              if (datapendidikan != null) {
                                modalBottomPendidikanTerakhir(context);
                              }
                            },
                            leading: Text(
                              datapendidikan != null
                                  ? hintpendidikanterakhir == null
                                      ? 'Pilih Pendidikan Terakhir '
                                      : hintpendidikanterakhir
                                  : 'Mohon tunggu..',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                            ),
                          ),
                        ),
                        // Center(
                        //   child: Container(
                        //     padding: EdgeInsets.only(left: 8, right: 16),
                        //     //width: MediaQuery.of(context).size.width,
                        //     //height: MediaQuery.of(context).size.height / 11,
                        //     child: DropdownButton(
                        //       isExpanded: true,
                        //       style: TextStyle(
                        //           fontSize: 16.0, color: Colors.black),
                        //       value: valpendidikan,
                        //       //value: valPendidikan == null ? valPendidikan : buildingTypes.where( (i) => i.name == valPendidikan.name).first as BuildingType,
                        //       hint: Text("Pilih Pendidikan"),
                        //       items: datapendidikan.map((item) {
                        //         return DropdownMenuItem(
                        //           child: Text(item.nama),
                        //           value: item.kode.toString(),
                        //         );
                        //       }).toList(),
                        //       onChanged: (value) async {
                        //         // dataCity = await network.getCity(value);
                        //         setState(() {
                        //           valpendidikan = value;
                        //           // valCity = null;
                        //         });
                        //         //print(dataCity);
                        //       },
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 48,
                            child: InSignIn
                                ? SpinKitFadingCircle(color: orenColor)
                                : EduButton(
                                    onPressed: () {
                                      checkEmailAndPassowrd();
                                    },
                                    buttonText: 'Daftar',
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }

  var valpendidikanterakhir;
  var hintpendidikanterakhir;
  void modalBottomPendidikanTerakhir(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
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
                  child: Expanded(
                    child: datapendidikan.length == 0
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: datapendidikan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datapendidikan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valpendidikanterakhir = lastDataSipema.kode;
                                    hintpendidikanterakhir =
                                        lastDataSipema.nama;
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
                SizedBox(
                  height: 24,
                )
              ],
            ),
          );
        });
  }
}
