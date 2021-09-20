part of 'pengaturan.dart';

class BahasaDatadiri extends StatefulWidget {
  final String keycode,status;
  final ShowBahasaModel xbahasa;
  BahasaDatadiri({
    this.keycode,
    this.xbahasa,
    this.status,
  });

  @override
  _BahasaDatadiriState createState() => _BahasaDatadiriState();
}

class _BahasaDatadiriState extends State<BahasaDatadiri> {
  TextEditingController etsearchbahasa = new TextEditingController();

  final _debouncer = Debouncer(milliseconds: 1200);

  List<MasterDaerahModel> databahasa = new List();
  List<MasterDaerahModel> forfilterdatabahasa = [];
  void getbahasa() async {
    Masterview_model().bahasa().then((value2) {//handled
      setState(() {
        databahasa = value2;
        forfilterdatabahasa = databahasa;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }
  
  String id_cek = "";
  void check_insert_or_update(status){
    if(widget.status=="update"){
       valbahasa = widget.xbahasa.bahasa_kode;
    valkemampuantlisan = widget.xbahasa.lisan_kode;
    valkemampuanttulisan = widget.xbahasa.tulisan_kode;


    hintbahasa = widget.xbahasa.bahasa;
    hintkemampuantlisan = widget.xbahasa.lisan;
    hintkemampuanttulisan = widget.xbahasa.tulisan;

      id_cek = widget.xbahasa.id.toString() == null
            ? ""
            : widget.xbahasa.id.toString();
    }
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
    getbahasa();
    check_insert_or_update(widget.status);
   
  }

  var InSignIn = false;

  void check() {
    // print('tes');
    var _nohpp = "";

    if (_formKey.currentState.validate()) {
      //JIKA TRUE

      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (valbahasa.toString().isEmpty ||
          valbahasa.toString() == "" ||
          valbahasa.toString() == "null" ||
          valbahasa.toString() == null) {
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
                color: Colors.black38,
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0)
          ],
          backgroundColor: Colors.red[600],
        )..show(context);
      } else {
        setState(() {
          InSignIn = true;
        });

        print("vallaa"+valbahasa);
        UserViewModel()
            .insert_bahasa(
          valbahasa.toString(),
          valkemampuantlisan.toString(),
          valkemampuanttulisan.toString(),
          widget.keycode.toString(),
          id_cek,).then((value) {//handled
          StatusModel data = value;

          if (data.status == 200) {
            setState(() {
              InSignIn = false;
            });

            //Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (ShowKeterampilan(
                          keycode: widget.keycode,
                        ))));
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

      // update_profile();

    };
  }

  final _formKey = GlobalKey<FormState>();

  var bahasa_dummy = ["English", "Taiwan", "Mep", "LMAO", "Kikireki"];
  List kemampuan_t_dummy = [
    {"inisial": "1", "isi": "Beginer"},
    {"inisial": "2", "isi": "Advance"},
    {"inisial": "3", "isi": "Expert"},
  ];

  List kemampuan_t_tulisan = [
    {"inisial": "1", "isi": "Beginer"},
    {"inisial": "2", "isi": "Advance"},
    {"inisial": "3", "isi": "Expert"},
  ];

  var valbahasa;
  var hintbahasa;
  void modalBottombahasa(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModalBahasa(datalist: databahasa, cat: "bahasa",);
        });
    setState(() {
      valbahasa = result[0].toString();
      hintbahasa = result[1].toString();
      print("yoyake: "+valbahasa+", "+hintbahasa);
    });
  }

  var valkemampuantlisan;
  var hintkemampuantlisan;
  void modalBottomKemampuanTingkatlisan(context) {
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
                    child: kemampuan_t_dummy.length == 0
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
                            itemCount: kemampuan_t_dummy.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = kemampuan_t_dummy[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkemampuantlisan =
                                        lastDataSipema['inisial'];
                                    hintkemampuantlisan = lastDataSipema['isi'];
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
                                      Text(lastDataSipema['isi'],
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
          );
        });
  }

  var valkemampuanttulisan;
  var hintkemampuanttulisan;
  void modalBottomKemampuanTingkatTulisan(context) {
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
                    child: kemampuan_t_tulisan.length == 0
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
                            itemCount: kemampuan_t_tulisan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = kemampuan_t_tulisan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valkemampuanttulisan =
                                        lastDataSipema['inisial'];
                                    hintkemampuanttulisan =
                                        lastDataSipema['isi'];
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
                                      Text(lastDataSipema['isi'],
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
          );
        });
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowKeterampilan(keycode: widget.keycode == null ? "" : widget.keycode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("_selectedIndex${_selectedIndex}");
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
            'Bahasa',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tingkat Kemampuan',
                        style: blackFontStyle1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Untuk meningkatkan kesempatan Anda dipilih oleh perusahaan,\nJabarkanlah seluruh kemampuan anda.',
                          style: blackFontStyle3.copyWith(
                              color: Colors.black54, fontSize: 12)),
                      SizedBox(
                        height: 16,
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
                            if (databahasa.length != 0)
                              modalBottombahasa(context);
                          },
                          // leading: Text("Provinsi",
                          //     style: blackFontStyle1.copyWith(fontSize: 16)),
                          leading: Text(
                            databahasa.length != 0
                                ? hintbahasa == null
                                ? 'Pilih Bahasa'
                                : hintbahasa
                                : 'Mohon tunggu..',
                            // "Pilih Wilayah",
                            style: TextStyle(color: mainColor1, fontSize: 16),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
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
                            if (kemampuan_t_dummy.length != 0)
                              modalBottomKemampuanTingkatlisan(context);
                          },
                          // leading: Text("Provinsi",
                          //     style: blackFontStyle1.copyWith(fontSize: 16)),
                          leading: Text(
                            kemampuan_t_dummy.length != 0
                                ? hintkemampuantlisan == null
                                ? 'Tingkat Kemahiran Lisan'
                                : hintkemampuantlisan
                                : 'Mohon tunggu..',
                            // "Pilih Wilayah",
                            style: TextStyle(color: mainColor1, fontSize: 16),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
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
                            if (kemampuan_t_dummy.length != 0)
                              modalBottomKemampuanTingkatTulisan(context);
                          },
                          // leading: Text("Provinsi",
                          //     style: blackFontStyle1.copyWith(fontSize: 16)),
                          leading: Text(
                            kemampuan_t_dummy.length != 0
                                ? hintkemampuanttulisan == null
                                ? 'Tingkat Kemahiran Tulisan'
                                : hintkemampuanttulisan
                                : 'Mohon tunggu..',
                            // "Pilih Wilayah",
                            style: TextStyle(color: mainColor1, fontSize: 16),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: blackColor,
                          ),
                        ),
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
                          buttonText: "Simpan",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentModalBahasa extends StatefulWidget{
  var datalist;
  String cat;
  ContentModalBahasa({Key key, @required this.datalist, this.cat}): super(key : key);

  @override
  ContentModalBahasaState createState() => new ContentModalBahasaState();

}

class ContentModalBahasaState extends State<ContentModalBahasa>{

  TextEditingController etsearchkemampuan = new TextEditingController();
  TextEditingController etsearchbahasa = new TextEditingController();
  List<MasterDaerahModel> fdataList;
  List<MasterDaerahModel> dataList;
  List<String> result = ["", ""];

  @override
  initState(){
    super.initState();
    fdataList = widget.datalist;
    dataList = widget.datalist;
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
                controller:
                widget.cat=="kemampuan"
                    ? etsearchkemampuan
                    : etsearchbahasa,
                keyboardType: TextInputType.text,
                //enabled: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 10, bottom: 5, top: 5, right: 10),
                    hintText: "Cari "+widget.cat),
                onChanged: (string) {
                  setState(() {
                    fdataList = dataList
                        .where((u) => (u.nama
                        .toLowerCase()
                        .contains(string.toLowerCase())))
                        .toList();
                  });
                },
              ),
            ),
            Container(
              child: Expanded(
                child: fdataList.length == 0
                    ?
                Column(
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
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                  ],
                )
                    : ListView.builder(
                  itemCount: fdataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final lastDataSipema = fdataList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          //print("valpos: "+lastDataSipema.id.toString()+"&&"+lastDataSipema.nama);
                          //valposisi = lastDataSipema.id;
                          //hintposisi = lastDataSipema.nama;
                          result[0]=lastDataSipema.kode.toString();
                          result[1]=lastDataSipema.nama.toString();
                          Navigator.pop(context, result);
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
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

}
