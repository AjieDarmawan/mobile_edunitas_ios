part of 'pengaturan.dart';

class editPengalaman extends StatefulWidget {
  final String keycode;
  final ShowPengalamanModel xpengalaman;
  editPengalaman({this.keycode, this.xpengalaman});

  @override
  _editPengalamanState createState() => _editPengalamanState();
}

class _editPengalamanState extends State<editPengalaman> {

  TextEditingController etsearchposisi = new TextEditingController();
  TextEditingController etsearchspesialisasi = new TextEditingController();
  TextEditingController etsearchbidang = new TextEditingController();
  TextEditingController etsearchindustri = new TextEditingController();

  final _debouncer = Debouncer(milliseconds: 1200);
  
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

  List<SpesialisasiModel> dataSpesialisasi = new List();
  List<SpesialisasiModel> forfilterdataSpesialisasi = [];
  void getSpesialisasi() async {
    KarirViewModel().karir_spesialisasi().then((value1) {//handled
      setState(() {
        dataSpesialisasi = value1 == null ? [] : value1;
        forfilterdataSpesialisasi = dataSpesialisasi;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<SpesialisasiModel> datajabatan = new List();
  void getjabatan() async {
    KarirViewModel().karir_jabatan().then((value1) {//handled
      setState(() {
        datajabatan = value1 == null ? [] : value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<SpesialisasiModel> dataindustri = new List();
  List<SpesialisasiModel> forfilterdataindustri = [];
  void getindustri() async {
    KarirViewModel().karir_industri().then((value1) {//handled
      setState(() {
        dataindustri = value1 == null ? [] : value1;
        forfilterdataindustri = dataindustri;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<SpesialisasiModel> databidang = new List();
  List<SpesialisasiModel> forfilterdatabidang = [];
  void getbidang() async {
    KarirViewModel().karir_bidang().then((value1) {//handled
      setState(() {
        databidang = value1 == null ? [] : value1;
        forfilterdatabidang = databidang;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<SpesialisasiModel> dataposisi = new List();
  List<SpesialisasiModel> forfilterdataposisi = [];
  void getposisi() async {
    KarirViewModel().karir_posisi().then((value1) {//handled
      setState(() {
        dataposisi = value1 == null ? [] : value1;
        forfilterdataposisi = dataposisi;
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
                getProvinsi();
                getSpesialisasi();
                getbidang();
                getindustri();
                getjabatan();
                getposisi();
                getKabKota(valprov.toString());
                getkecamatan(valkabkota.toString());
                getdesa(valkec.toString());
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var etkodepos, etalamat, etperusahaan, etgajibulanan, etdeskripsi;
  @override
  void initState() {
    super.initState();
    getProvinsi();
    getSpesialisasi();
    getbidang();
    getindustri();
    getjabatan();
    getposisi();

    hintprov = widget.xpengalaman.wilayahProv;
    hintkabkota = widget.xpengalaman.wilayahKota;
    hintkec = widget.xpengalaman.wilayahKec;
    hintdesa = widget.xpengalaman.wilayahDesa;

    hintbidang = widget.xpengalaman.bidangNama;
    hintindustri = widget.xpengalaman.industriNama;
    hintposisi = widget.xpengalaman.posisiNama;
    hintjabatan = widget.xpengalaman.jabatanNama;
    hintspesialisasi = widget.xpengalaman.spesialisasiNama;

    valbidang = widget.xpengalaman.bidang;
    valindustri = widget.xpengalaman.industri;
    valposisi = widget.xpengalaman.posisi;
    valjabatan = widget.xpengalaman.jabatan;
    valspesialisasi = widget.xpengalaman.spesialisasi;

    valprov = widget.xpengalaman.provinsi;
    valkabkota = widget.xpengalaman.kota;
    valkec = widget.xpengalaman.kecamatan;
    valdesa = widget.xpengalaman.kelurahan;
    etkodepos = TextEditingController(text: widget.xpengalaman.kodepos);
    etalamat = TextEditingController(text: widget.xpengalaman.alamat);
    etperusahaan = TextEditingController(text: widget.xpengalaman.nama);
    etgajibulanan =
        TextEditingController(text: widget.xpengalaman.gaji.toString());
    etdeskripsi = TextEditingController(text: widget.xpengalaman.deskripsi);

    getKabKota(valprov.toString());
    getkecamatan(valkabkota.toString());
    getdesa(valkec.toString());
  }

  var InSignIn = false;
  void check() {
    // print('tes');
    var _nohpp = "";

    if (_formKey.currentState.validate()) {
      //JIKA TRUE

      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etperusahaan.text.toString().isEmpty ||
          etalamat.text.toString().isEmpty ||
          etgajibulanan.text.toString().isEmpty ||
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
          valdesa.toString() == null ||
          valbidang.toString().isEmpty ||
          valbidang.toString() == "" ||
          valbidang.toString() == "null" ||
          valbidang.toString() == null ||
          valindustri.toString().isEmpty ||
          valindustri.toString() == "" ||
          valindustri.toString() == "null" ||
          valindustri.toString() == null ||
          valspesialisasi.toString().isEmpty ||
          valspesialisasi.toString() == "" ||
          valspesialisasi.toString() == "null" ||
          valspesialisasi.toString() == null ||
          valposisi.toString().isEmpty ||
          valposisi.toString() == "" ||
          valposisi.toString() == "null" ||
          valposisi.toString() == null ||
          valjabatan.toString().isEmpty ||
          valjabatan.toString() == "" ||
          valjabatan.toString() == "null" ||
          valjabatan.toString() == null) {
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

        print("spesialisasiKirim: "+valspesialisasi.toString());

        KarirViewModel()
            .edit_pengalaman(
          etperusahaan.text.toString(),
          _dari.toString(),
          _sampai.toString(),
          "",
          valbidang.toString(),
          valspesialisasi.toString(),
          "",
          valprov.toString(),
          valkabkota.toString(),
          valkec.toString(),
          valdesa.toString(),
          etalamat.text.toString(),
          etkodepos.text.toString(),
          valindustri.toString(),
          valjabatan.toString(),
          etgajibulanan.text.toString(),
          etdeskripsi.text.toString(),
          valposisi.toString(),
          widget.keycode.toString(),
          widget.xpengalaman.id.toString(),).then((value) {//handled
          StatusModel data = value;

          if (data.status == 200) {
            setState(() {
              InSignIn = false;
            });

            Navigator.pop(context, "berhasil");
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => (ShowPengalaman(
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
          onErrHandling(erro);
        });
      }

      // update_profile();

    }
    ;
  }

  final _formKey = GlobalKey<FormState>();

  //1//
  DateTime _dueDate = DateTime.now();
  String _tahunberdiri = "";
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
        _tahunberdiri = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  // ganjil
  DateTime _dueDateganjil = DateTime.now();
  String _dari = "";
  selectDueDate_dari(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDateganjil,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDateganjil = picked;
        // _dari = "${picked.day}-${picked.month}-${picked.year}";
        _dari = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //genap
  DateTime _dueDategenap = DateTime.now();
  String _sampai = "";
  selectDueDate_sampai(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDategenap,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDategenap = picked;
        //_sampai = "${picked.day}-${picked.month}-${picked.year}";
        _sampai = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  bool _p2k = false;
  bool _p2r = false;
  bool _rpl = false;
  bool _ppo = false;

  var valjabatan;
  var hintjabatan;
  void modalBottomjabatan(context) {
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
                    child: datajabatan.length == 0
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
                            itemCount: datajabatan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = datajabatan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valjabatan = lastDataSipema.id;
                                    hintjabatan = lastDataSipema.nama;

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

  var valspesialisasi;
  var hintspesialisasi;
  void modalBottomspesialisasi(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: dataSpesialisasi, cat: "spesialisasi",);
        });
    setState(() {
      valspesialisasi = result[0].toString();
      hintspesialisasi = result[1].toString();
    });
  }

  var valindustri;
  var hintindustri;
  void modalBottomindustri(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: dataindustri, cat: "industri",);
        });
    setState(() {
      valindustri = result[0].toString();
      hintindustri = result[1].toString();
    });
  }

  var valbidang;
  var hintbidang;
  void modalBottombidang(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: databidang, cat: "bidang",);
        });
    setState(() {
      valbidang = result[0].toString();
      hintbidang = result[1].toString();
    });
  }

  var valposisi;
  var hintposisi;
  void modalBottomposisi(context) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(datalist: dataposisi, cat: "posisi",);
        });
    setState(() {
      valposisi = result[0].toString();
      hintposisi = result[1].toString();
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

  int _selectedIndex = 0;
  List<String> _options = ['Ganjil', 'Ganjil / Genap'];

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: whiteFontStyle),
        elevation: 1,
        pressElevation: 2,
        shadowColor: mainColor1,
        backgroundColor: Colors.grey,
        selectedColor: mainColor1,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("_selectedIndex${_selectedIndex}");
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
          'Pengalaman',
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
                      'Tingkat Penglamaan',
                      style: blackFontStyle1.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Untuk meningkatkan kesempatan Anda dipilih oleh perusahaan \n Tambahkan beberapa pengalaman anda pada pekerjaan sebelumnya.',
                        style: blackFontStyle3.copyWith(
                            color: Colors.black54, fontSize: 12)),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Nama Perusahaan', style: blueFontStyle),
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
                        controller: etperusahaan,
                        keyboardType: TextInputType.name,
                        //enabled: false,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 10, bottom: 5, top: 5, right: 10),
                            hintText: "Nama Perusahaan"),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Pilih Posisi', style: blueFontStyle),
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
                          if (dataposisi.length != 0)
                            modalBottomposisi(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          dataposisi.length != 0
                              ? hintposisi == null
                                  ? 'Pilih Posisi'
                                  : hintposisi
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
                        Text('Pilih Jabatan', style: blueFontStyle),
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
                          if (datajabatan.length != 0)
                            modalBottomjabatan(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          datajabatan.length != 0
                              ? hintjabatan == null
                                  ? 'Pilih Jabatan'
                                  : hintjabatan
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
                        Text('Dari', style: blueFontStyle),
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
                      child: ListTile(
                        title: Text(
                          _dari == "" ? widget.xpengalaman.dari : _dari,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        onTap: () {
                          selectDueDate_dari(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Sampai', style: blueFontStyle),
                            Text(' *',
                                style: blueFontStyleBold.copyWith(
                                    color: Colors.red)),
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
                            title: Text(
                              _sampai == ""
                                  ? widget.xpengalaman.hingga
                                  : _sampai,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                            onTap: () {
                              selectDueDate_sampai(context);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   height: 16,
                    // ),
                    Row(
                      children: [
                        Text('Pilih Spesialisasi', style: blueFontStyle),
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
                          if (dataSpesialisasi.length != 0)
                            modalBottomspesialisasi(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          dataSpesialisasi.length != 0
                              ? hintspesialisasi == null
                                  ? 'Pilih Spesialisasi'
                                  : hintspesialisasi
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
                        Text('Pilih Bidang Pekerjaan', style: blueFontStyle),
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
                          if (databidang.length != 0)
                            modalBottombidang(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          databidang.length != 0
                              ? hintbidang == null
                                  ? 'Pilih Bidang Pekerjaan'
                                  : hintbidang
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
                        Text('Pilih Industri', style: blueFontStyle),
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
                          if (dataindustri.length != 0)
                            modalBottomindustri(context);
                        },
                        // leading: Text("Provinsi",
                        //     style: blackFontStyle1.copyWith(fontSize: 16)),
                        leading: Text(
                          dataindustri.length != 0
                              ? hintindustri == null
                                  ? 'Pilih Industri'
                                  : hintindustri
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

                    Text('Gaji Bulanan', style: blueFontStyle),
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

                    // Divider(
                    //   color: Colors.grey,
                    //   height: 24,
                    //   thickness: 1,
                    // ),
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
                        maxLength: 5,
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
                        Text('Desripsi Pekerjaan', style: blueFontStyle),
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
                        maxLines: 7,
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Deskripsi Pekerjaan"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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