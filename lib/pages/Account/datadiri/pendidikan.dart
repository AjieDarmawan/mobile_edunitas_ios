part of 'pengaturan.dart';

class PendidikanDatadiri extends StatefulWidget {
  final String keycode;
  PendidikanDatadiri({
    this.keycode,
  });

  @override
  _PendidikanDatadiriState createState() => _PendidikanDatadiriState();
}

class _PendidikanDatadiriState extends State<PendidikanDatadiri> {
  // TextEditingController etkodepos = new TextEditingController();
  // TextEditingController etalamat = new TextEditingController();
  // TextEditingController etnamainstansi = new TextEditingController();
  // TextEditingController etnilaiakhir = new TextEditingController();
  // TextEditingController etdari = new TextEditingController();

  var temp_prodikampus = "";
  var temp_prodikampus_tambahan;
  var temp_proditerpilih;
  var _prodiygditamplikan = "";

  List<MasterJurusanModel> datajurusan = new List();
  void getJurusan() async {
    Masterview_model().jurusan().then((value2) {//handled
      setState(() {
        datajurusan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterDaerahModel> dataprovinsi = new List();
  void getProvinsi() async {
    Masterview_model().provinsi().then((value2) {//handled
      setState(() {
        dataprovinsi = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterDaerahModel> datakabkota = new List();
  void getKabKota(id_parent) async {
    print("idParent${id_parent}");
    Masterview_model().kab__kota(id_parent.toString()).then((value2) {//handled
      setState(() {
        datakabkota = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterDaerahModel> datakecamatan = new List();
  void getkecamatan(idparent) async {
    Masterview_model().kecamatan(idparent.toString()).then((value2) {//handled
      setState(() {
        datakecamatan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterDaerahModel> datadesa = new List();
  void getdesa(idparent) async {
    Masterview_model().desa(idparent.toString()).then((value2) {//handled
      setState(() {
        datadesa = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<PendidikanModel> datapendidikan = new List();
  void getpendidikan() async {
    Masterview_model().conf_leveledu_all().then((value2) {//handled
      setState(() {
        datapendidikan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<PendidikanModel> datatahun_kelulusan = new List();
  void gettahun_kelulusan() async {
    Masterview_model().tahun_kelulusan().then((value2) {//handled
      setState(() {
        datatahun_kelulusan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var etkodepos, etalamat, etnamainstansi, etnilaiakhir, etdari;
  void dataPendidikan() {
    UserViewModel().pendidikan_detail(widget.keycode.toString()).then((value) {//handled
      DetailPendidikanModel data = value;

      hintprov = data.wilayahProv;
      hintkabkota = data.wilayahKota;
      hintkec = data.wilayahKec;
      hintdesa = data.wilayahDesa;
      hintpendidikan = data.namaleveledu;
      hintjurusan = data.jurusan;

      valpendidikan = data.leveledu;
      valprov = data.provinsi;
      valkabkota = data.kota;
      valkec = data.kecamatan;
      valdesa = data.kelurahan;

      valtahunkelulusan = data.thnlulus;

      etkodepos = TextEditingController(text: data.kodepos);
      etalamat = TextEditingController(text: data.alamat);
      etnamainstansi = TextEditingController(text: data.nama);
      etnilaiakhir = TextEditingController(text: data.nilaiakhir);
      etdari = TextEditingController(text: data.dari);

      getKabKota(valprov.toString());
      getkecamatan(valkabkota.toString());
      getdesa(valkec.toString());
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
                dataPendidikan();
                getProvinsi();
                getpendidikan();
                gettahun_kelulusan();
                getJurusan();
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
    dataPendidikan();
    getProvinsi();
    getpendidikan();
    gettahun_kelulusan();
    getJurusan();
  }

  var InSignIn = false;
  void check() {
    // print('tes');
    var _nohpp = "";

    if (_formKey.currentState.validate()) {
      //JIKA TRUE

      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etnamainstansi.text.toString().isEmpty ||
          etnilaiakhir.text.toString().isEmpty ||
          etdari.text.toString().isEmpty ||
          etalamat.text.toString().isEmpty ||
          valtahunkelulusan.toString().isEmpty ||
          valtahunkelulusan.toString() == "" ||
          valtahunkelulusan.toString() == "null" ||
          valtahunkelulusan.toString() == null ||
          valprov.toString().isEmpty ||
          valprov.toString() == "" ||
          valprov.toString() == "null" ||
          valprov.toString() == null ||
          valkabkota.toString().isEmpty ||
          valkabkota.toString() == "" ||
          valkabkota.toString() == "null" ||
          valkabkota.toString() == null ||
          valkec.toString().isEmpty ||
          valkec.toString() == "" ||
          valkec.toString() == "null" ||
          valkec.toString() == null ||
          valdesa.toString().isEmpty ||
          valdesa.toString() == "" ||
          valdesa.toString() == "null" ||
          valdesa.toString() == null) {
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
          InSignIn = false;
        });

        //
        UserViewModel()
            .edit_pendidikan_user(
          valpendidikan.toString(),
          valjurusan.toString(),
          //"",
          valprov.toString(),
          valkabkota.toString(),
          valkec.toString(),
          valdesa.toString(),
          etalamat.text.toString(),
          etkodepos.text.toString(),
          etnamainstansi.text.toString(),
          valtahunkelulusan.toString(),
          etnilaiakhir.text.toString(),
          etdari.text.toString(),
          widget.keycode.toString(),).then((value) {//handled
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
      }

      // update_profile();

    };
  }

  final _formKey = GlobalKey<FormState>();

  var valtahunkelulusan;
  var hinttahunkelulusan;
  void modalBottomTahunKelulusan(context) {
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
                    child: datatahun_kelulusan.length == 0
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
                            itemCount: datatahun_kelulusan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datatahun_kelulusan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valtahunkelulusan = lastDataSipema.nama;
                                    hinttahunkelulusan = lastDataSipema.nama;

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
                SizedBox(height: 24),
              ],
            ),
          );
        });
  }

  var valjurusan;
  var hintjurusan;
  void modalBottomjurusan(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: datajurusan, cat: "jurusan",);
        });
    setState(() {
      valjurusan = result[0].toString();
      hintjurusan = result[1].toString();
    });
  }

  var valpendidikan;
  var hintpendidikan;
  void modalBottomPendidikan(context) {
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
                                    valpendidikan = lastDataSipema.kode;
                                    hintpendidikan = lastDataSipema.nama;

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
                SizedBox(height: 24),
              ],
            ),
          );
        });
  }

  var valprov;
  var hintprov;
  void modalBottomProv(context) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: dataprovinsi, cat: "provinsi",);
        });
    setState(() {
      valprov = result[0].toString();
      hintprov = result[1].toString();
      getKabKota(valprov);
    });
  }

  var valkabkota;
  var hintkabkota;
  void modalBottomkabkota(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: datakabkota, cat: "kabupaten",);
        });
    setState(() {
      valkabkota = result[0].toString();
      hintkabkota = result[1].toString();
      getkecamatan(valkabkota);
    });
  }

  var valkec;
  var hintkec;
  void modalBottomKec(context) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: datakecamatan, cat: "kecamatan",);
        });
    setState(() {
      valkec = result[0].toString();
      hintkec = result[1].toString();
      getdesa(valkec);
    });
  }

  var valdesa;
  var hintdesa;
  void modalBottomDesa(context) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: datadesa, cat: "desa",);
        });
    setState(() {
      valdesa = result[0].toString();
      hintdesa = result[1].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("hintprov${hintprov}");
    print("hintprov${widget.keycode}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Pendidikan',
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
                      'Tingkat Pendidikan',
                      style: blackFontStyle1.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Tambahkan jenjang pendidikan anda',
                        style: blackFontStyle3.copyWith(
                            color: Colors.black54, fontSize: 12)),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Pilih Pendidikan', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (datapendidikan.length != 0)
                            modalBottomPendidikan(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          datapendidikan.length != 0
                              ? valpendidikan == null
                                  ? 'Pilih Pendidikan'
                                  : hintpendidikan
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
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Pilih Jurusan', style: blueFontStyle),
                      ],
                    ),
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
                          if (datajurusan.length != 0)
                            modalBottomjurusan(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          datajurusan.length != 0
                              ? hintjurusan == null
                                  ? 'Pilih Jurusan'
                                  : hintjurusan
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

                    // Divider(
                    //   color: Colors.grey,
                    //   height: 24,
                    //   thickness: 1,
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Nama Instansi', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etnamainstansi,
                        validator: nameValidator,
                        //enabled: false,
                        // keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Nama Instansi"),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Tahun kelulusan', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (datatahun_kelulusan.length != 0)
                            modalBottomTahunKelulusan(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          datatahun_kelulusan.length != 0
                              ? valtahunkelulusan == null
                                  ? 'Tahun Kelulusan'
                                  : valtahunkelulusan
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
                    Row(
                      children: [
                        Text('Pilih Provinsi', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (dataprovinsi.length != 0)
                            modalBottomProv(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          dataprovinsi.length != 0
                              ? hintprov == null
                                  ? 'Pilih Provinsi'
                                  : hintprov
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
                    Row(
                      children: [
                        Text('Pilih Kabupaten Kota', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (datakabkota.length != 0)
                            modalBottomkabkota(context);
                        },
                        leading: Text(
                          datakabkota.length != 0
                              ? hintkabkota == null
                                  ? 'Pilih Kabupaten Kota '
                                  : hintkabkota
                              : hintprov == null
                                  ? 'Pilih Kabupaten Kota '
                                  : 'Mohon tunggu..',
                          // "Pilih Wilayah",
                          style: TextStyle(color: mainColor1, fontSize: 16),
                        ),
                        // leading: Text("Kabupaten / Kota",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: blackColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Pilih Kecamatan', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (datakecamatan.length != 0)
                            modalBottomKec(context);
                        },
                        leading: Text(
                          datakecamatan.length != 0
                              ? hintkec == null
                                  ? 'Pilih Kecamatan '
                                  : hintkec
                              : hintkabkota == null
                                  ? 'Pilih Kecamatan '
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
                    Row(
                      children: [
                        Text('Pilih Desa / Kelurahan', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                          if (datadesa.length != 0) modalBottomDesa(context);
                        },
                        leading: Text(
                          datadesa.length != 0
                              ? hintdesa == null
                                  ? 'Pilih Desa / Kelurahan '
                                  : hintdesa
                              : hintkec == null
                                  ? 'Pilih Desa / Kelurahan '
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
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Alamat', style: blueFontStyle),
                        Text('*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etalamat,
                        //enabled: false,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 10, bottom: 5, top: 5, right: 10),
                            hintText: ""),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Kode POS', style: blueFontStyle),
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etkodepos,
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
                            hintText: ""),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text('Nilai Akhir', style: blueFontStyle),
                        Text(' *',
                            style:
                                blueFontStyleBold.copyWith(color: Colors.red)),
                      ],
                    ),
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etnilaiakhir,
                        // validator: nameValidator,
                        //enabled: false,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Nilai Akhir"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Dari', style: blueFontStyle),
                        Text(' *',
                            style:
                                blueFontStyleBold.copyWith(color: Colors.red)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etdari,
                        // validator: nameValidator,
                        //enabled: false,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Dari"),
                      ),
                    ),

                    SizedBox(
                      height: 24,
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
    );
  }
}
