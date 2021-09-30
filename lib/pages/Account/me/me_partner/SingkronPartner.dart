part of 'me_partner.dart';

class SingkronPartner extends StatefulWidget {
  final String keycode;
  SingkronPartner({
    this.keycode,
  });

  @override
  _SingkronPartnerState createState() => _SingkronPartnerState();
}

class _SingkronPartnerState extends State<SingkronPartner> {
  TextEditingController etnamakampus = new TextEditingController();
  TextEditingController etakreditasi = new TextEditingController();
  TextEditingController etbanpt = new TextEditingController();
  TextEditingController etwebsite = new TextEditingController();
  TextEditingController etrektor = new TextEditingController();
  TextEditingController etkodepos = new TextEditingController();

  TextEditingController etemailresmikampus = new TextEditingController();
  TextEditingController etnotlpn = new TextEditingController();
  TextEditingController etalamat = new TextEditingController();
  TextEditingController etnamap = new TextEditingController();
  TextEditingController etemailp = new TextEditingController();
  TextEditingController etnotlpnp = new TextEditingController();
  TextEditingController etjabtanp = new TextEditingController();

  var temp_prodikampus = "";
  var temp_prodikampus_tambahan;
  var temp_proditerpilih;
  var _prodiygditamplikan = "";

  List<MasterDaerahModel> dataprovinsi = new List();
  void getProvinsi() async {
    Masterview_model().provinsi().then((value2) {//handled
      setState(() {
        dataprovinsi = value2;
      });
    }).catchError((erro){
      onErrHandling(erro, "prov", null);
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
      onErrHandling(erro, 'kab', id_parent.toString());
    });
  }

  List<MasterDaerahModel> datakecamatan = new List();
  void getkecamatan(idparent) async {
    Masterview_model().kecamatan(idparent.toString()).then((value2) {//handled
      setState(() {
        datakecamatan = value2;
      });
    }).catchError((erro){
      onErrHandling(erro, 'kec', idparent.toString());
    });
  }

  List<MasterDaerahModel> datadesa = new List();
  void getdesa(idparent) async {
    Masterview_model().desa(idparent.toString()).then((value2) {//handled
      setState(() {
        datadesa = value2;
      });
    }).catchError((erro){
      onErrHandling(erro, 'desa', idparent.toString());
    });
  }

  // logo

  File image, logo_save; //ktp
  TextEditingController ctitle = new TextEditingController();
  // accessCamera() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       image = img;
  //       logo_save = compressImg;
  //       Navigator.pop(context);
  //       // uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGallery() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       image = img;
  //       logo_save = compressImg;
  //       Navigator.pop(context);
  //       //uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  //gedung

  File imagegedung, gedung_save; //ktp
  TextEditingController ctitlegedung = new TextEditingController();
  // accessCameraGedung() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagegedung = img;
  //       gedung_save = compressImg;
  //       Navigator.pop(context);
  //       //  uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGalleryGedung() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   print("accessGalleryGedung: " + _image.toString());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagegedung = img;
  //       gedung_save = compressImg;
  //       Navigator.pop(context);
  //       // uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  // aktivitas
  File imageaktivitas, aktivitas_save; //ktp
  TextEditingController ctitleaktivitas = new TextEditingController();
  // accessCameraAktivitas() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitleaktivitas.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imageaktivitas = img;
  //       aktivitas_save = compressImg;
  //       Navigator.pop(context);
  //       //uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGalleryAktivitas() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   print("accessGalleryAktivitas: " + _image.toString());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imageaktivitas = img;
  //       aktivitas_save = compressImg;
  //       Navigator.pop(context);
  //       // uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  // fasilitias
  File imagefasilitas, fasilitas_save; //ktp
  TextEditingController ctitlefasilitas = new TextEditingController();
  // accessCamerafasilitas() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitlefasilitas.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefasilitas = img;
  //       fasilitas_save = compressImg;
  //       Navigator.pop(context);
  //       //  uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGalleryfasilitas() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefasilitas = img;
  //       fasilitas_save = compressImg;
  //       print("accessGalleryfasilitas: " + imagefasilitas.toString());
  //       print("accessGalleryfasilitas: " + fasilitas_save.toString());
  //       Navigator.pop(context);
  //       // uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  File imagebiaya, biaya_save; //ktp
  TextEditingController ctitlebiaya = new TextEditingController();
  // accessCamerabiaya() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitlebiaya.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagebiaya = img;
  //       biaya_save = compressImg;
  //       Navigator.pop(context);
  //       //  uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGallerybiaya() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitle.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg =
  //       new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
  //         ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagebiaya = img;
  //       biaya_save = compressImg;
  //       Navigator.pop(context);
  //       // uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  void onErrHandling(erro, cat, id_parrent){
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
                if(cat=='prov'){
                  getProvinsi();
                }else if(cat=='kab'){
                  getKabKota(id_parrent);
                }else if(cat=='kec'){
                  getkecamatan(id_parrent);
                }else if(cat=='desa'){
                  getdesa(id_parrent);
                }else{
                  getProvinsi();
                  Navigator.of(context).pop();
                }
                getProvinsi();
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
    getProvinsi();
    // getKabKota();
    // getkecamatan();
    // getdesa();
  }

  var InSignIn = false;
  void check() {
    // print('tes');
    var _nohpp = "";

    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      print('cees${_tahunberdiri}');
      print('cees${_genap}');
      print('cees${_ganjil}');
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

      if (etnamakampus.text.toString().isEmpty ||
              etakreditasi.text.toString().isEmpty ||
              etbanpt.text.toString().isEmpty ||
              etwebsite.text.toString().isEmpty ||
              etnamakampus.text.toString().isEmpty ||
              etemailresmikampus.text.toString().isEmpty ||
              etrektor.text.toString().isEmpty ||
              etemailresmikampus.text.toString().isEmpty ||
              etnotlpn.text.toString().isEmpty ||
              etalamat.text.toString().isEmpty ||
              etnamap.text.toString().isEmpty ||
              etemailp.text.toString().isEmpty ||
              etnotlpnp.text.toString().isEmpty ||
              etjabtanp.text.toString().isEmpty ||
              logo_save == null ||
              logo_save == "null" ||
              gedung_save == null ||
              gedung_save == "null" ||
              fasilitas_save == null ||
              fasilitas_save == "null" ||
              biaya_save == null ||
              biaya_save == "null"

          // ||
          // valkampus.toString().isEmpty ||
          // valkampus.toString() == "" ||
          // valkampus.toString() == "null" ||
          // valkampus.toString() == null
          ) {
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
          _nohpp = etnotlpnp.text
              .toString()
              .substring(1, etnotlpnp.text.toString().length);
          InSignIn = true;
        });

        HomeViewModel()
            .patner_kampus_me(
          etnamakampus.text.toString() == null
              ? ""
              : etnamakampus.text.toString(),
          _tahunberdiri.toString() == null ? "" : _tahunberdiri.toString(),
          etakreditasi.text.toString() == null
              ? ""
              : etakreditasi.text.toString(),
          etbanpt.text.toString() == null ? "" : etbanpt.text.toString(),
          etwebsite.text.toString() == null ? "" : etwebsite.text.toString(),
          etrektor.text.toString() == null ? "" : etrektor.text.toString(),
          etemailresmikampus.text.toString() == null
              ? ""
              : etemailresmikampus.text.toString(),
          etnotlpn.text.toString() == null ? "" : etnotlpn.text.toString(),
          valprov.toString() == null ? "" : valprov.toString(),
          valkabkota.toString() == null ? "" : valkabkota.toString(),
          valkec.toString() == null ? "" : valkec.toString(),
          valdesa.toString() == null ? "" : valdesa.toString(),
          etalamat.text.toString() == null ? "" : etalamat.text.toString(),
          etkodepos.text.toString() == null ? "" : etkodepos.text.toString(),
          etnamap.text.toString() == null ? "" : etnamap.text.toString(),
          etemailp.text.toString() == null ? "" : etemailp.text.toString(),
          _nohpp,
          etjabtanp.text.toString() == null ? "" : etjabtanp.text.toString(),
          logo_save,
          gedung_save,
          aktivitas_save,
          fasilitas_save,
          biaya_save,
          widget.keycode.toString(), //api,
          temp_prodikampus == null ? "" : temp_prodikampus, //formdata_prodi
          temp_prodikampus_tambahan == null
              ? ""
              : temp_prodikampus_tambahan, //formdata_prodilain
          _selectedIndex == 0 ? "G#${_ganjil}" : "N#${_ganjil}#${_genap}",
          //formdata_pmb
          _p2k == true ? "P2K" : "",
          //           bool _p2k = false;
          // bool _p2r = false;
          // bool _rpl = false;
          // bool _ppo = false;
          context,
        )
            .then((value) {//handled
          setState(() {
            InSignIn = false;
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

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (Navigation_bottom())));
        }).catchError((erro){
          InSignIn = false;
          onErrHandling(erro,'', null);
        });
      }

      // update_profile();

    };
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
  String _ganjil = "";
  selectDueDate_ganjil(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDateganjil,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDateganjil = picked;
        // _ganjil = "${picked.day}-${picked.month}-${picked.year}";
        _ganjil = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //genap
  DateTime _dueDategenap = DateTime.now();
  String _genap = "";
  selectDueDate_genap(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDategenap,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDategenap = picked;
        //_genap = "${picked.day}-${picked.month}-${picked.year}";
        _genap = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  var _blueCardTitle = [
    '1. Pembayaran Online',
    '2. Penagihan Online',
    '3. Fasilitas publikasi',
    '4. Akses dunia kerja',
  ];
  var _blueCardDetail = [
    'Support pembayaran kuliah secara online dan didukung pembayaran di berbagai outlet, seperti Indomaret dll',
    'Support notifikasi/tagihan online pembayaran mahasiswa.',
    'Fasilitas publikasi Nilai, Jadwal Kuliah, Jadwal Ujian, Kurikulum, Kalender Akademik dll',
    'Lowongan kerja yang sangat bermanfaat bagi Mahasiswa anda.',
  ];

  bool _p2k = false;
  bool _p2r = false;
  bool _rpl = false;
  bool _ppo = false;

  var valprov;
  var hintprov;
  void modalBottomProv(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: dataprovinsi,
            cat: "provinsi",
          );
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
          return ContentModal(
            datalist: datakabkota,
            cat: "kabupaten",
          );
        });
    setState(() {
      valkabkota = result[0].toString();
      hintkabkota = result[1].toString();
      getkecamatan(valkabkota);
    });
  }

  var valkec;
  var hintkec;
  void modalBottomKec(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: datakecamatan,
            cat: "kecamatan",
          );
        });
    setState(() {
      valkec = result[0].toString();
      hintkec = result[1].toString();
      getdesa(valkec);
    });
  }

  var valdesa;
  var hintdesa;
  void modalBottomDesa(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: datadesa,
            cat: "desa",
          );
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
          'Partner Kampus',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'Dapatkan berbagai kemudahan dan keuntungan menjadi mitra kampus kami.',
                    style: blueFontStyle2Bold.copyWith(fontSize: 14),
                  ),
                  Text(
                    'Kampus anda akan kami promosikan/publikasikan secara luas.',
                    style: blackFontStyle2.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Dapatkan fitur-fitur pendukung lainnya yang dapat meningkatkan Citra dan Pelayanan Kampus anda seperti :',
                    style: blackFontStyle2.copyWith(fontSize: 12),
                  ),
                  ListView.builder(
                      itemCount: _blueCardTitle.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _blueCardTitle[index],
                                style: blueFontStyle.copyWith(fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: mainColor1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      _blueCardDetail[index],
                                      style:
                                          whiteFontStyle.copyWith(fontSize: 12),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
            Container(
              height: 8,
              color: CupertinoColors.systemGrey4,
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
                      'Formulir Data Kampus',
                      style: blackFontStyle1.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Yuk segera Gabung menjadi Mitra eduCampus',
                        style: blackFontStyle3.copyWith(
                            color: Colors.black54, fontSize: 12)),
                    Divider(
                      color: Colors.grey,
                      height: 24,
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Nama Kampus ",
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etnamakampus,
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
                          hintText: "Nama Kampus",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Tahun Berdiri ",
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
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        title: Text(
                          _tahunberdiri == "" ? "YYYY/MM/DD" : _tahunberdiri,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        onTap: () {
                          selectDueDate(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Program Kelas yang tersedia",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Pilih Program Kelas ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                        title: const Text('Program Perkuliahan Karyawan'),
                        value: _p2k,
                        onChanged: (bool value) {
                          setState(() {
                            _p2k = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                        title: const Text('Program Perkuliahan Regular'),
                        value: _p2r,
                        onChanged: (bool value) {
                          setState(() {
                            _p2r = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                        title: const Text('Rekognisi Pembelajaran Lampau'),
                        value: _rpl,
                        onChanged: (bool value) {
                          setState(() {
                            _rpl = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                        title: const Text('Program Perkuliahan Online'),
                        value: _ppo,
                        onChanged: (bool value) {
                          setState(() {
                            _ppo = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Program Studi yang tersedia",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Pilih Program Studi ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        onTap: () {
                          // modalBottomProdi(context);

                          _navigateToProdiCheck(context);
                        },
                        leading: Text(
                          _prodiygditamplikan == ""
                              ? "Program Studi"
                              : _prodiygditamplikan.length > 37
                                  ? _prodiygditamplikan.substring(0, 37) + ".."
                                  : _prodiygditamplikan,
                          style: blackFontStyle1.copyWith(fontSize: 16),
                          maxLines: 1,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Akredetasi Kampus ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etakreditasi,
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
                            hintText: "Akredetasi Kampus"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "No BAN-PT ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etbanpt,
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
                            hintText: "No BAN-PT"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Website Resmi Kampus ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etwebsite,
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
                            hintText: "kampus.ac.id"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Nama Rektor / Ketua Kampus ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etrektor,
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
                            hintText: "Nama Rektor / Ketua Kampus"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Email Resmi Kampus ",
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
                      child: TextFormField(
                        validator: emailValidator,
                        cursorColor: mainColor1,
                        controller: etemailresmikampus,
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
                            hintText: "kampus@email.com"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "No Telepon Kampus ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etnotlpn,
                        keyboardType: TextInputType.phone,
                        //validator: waValidator,
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
                            hintText: "021xxxxx"),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Penerimaan Mahasiswa Baru",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 32,
                        child: _buildChips(),
                      ),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Ganjil ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        title: Text(
                          _ganjil == "" ? "YYYY/MM/DD" : _ganjil,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        onTap: () {
                          selectDueDate_ganjil(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _selectedIndex == 0
                        ? Text("")
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Genap ",
                                    style: blueFontStyleBold,
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListTile(
                                  title: Text(
                                    _genap == "" ? "YYYY/MM/DD" : _genap,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  onTap: () {
                                    selectDueDate_genap(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                    Text(
                      "Alamat Kampus",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Alamat ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etalamat,
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
                            hintText: "Nama Jalan"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Kode POS ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etkodepos,
                        keyboardType: TextInputType.phone,
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
                            hintText: ""),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Data Penanggung Jawab",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Nama Lengkap ",
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etnamap,
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
                            hintText: "Nama Lengkap"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Email Penanggung Jawab ",
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etemailp,
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
                            hintText: "nama@email.com"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "No Telepon Penanggung Jawab ",
                          style: blueFontStyleBold,
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 16),
                            child: Text(
                              "+62",
                              style: blackFontStyle2,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              child: TextFormField(
                                cursorColor: mainColor1,
                                controller: etnotlpnp,
                                keyboardType: TextInputType.phone,
                                //validator: waValidator,
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
                                    hintText: "81345678xxx"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          text: "Jabatan Penanggung Jawab ",
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
                      child: TextFormField(
                        cursorColor: mainColor1,
                        controller: etjabtanp,
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
                            hintText: "Jabatan"),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Upload Gambar (max 500Kb/gambar)",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: image == null
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGallery();
                                                  },
                                                  onTap2: () {
                                                    //accessCamera();
                                                  },
                                                ));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 56,
                                        width: 56,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/uploadlogo.png"),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGallery();
                                                  },
                                                  onTap2: () {
                                                    //accessCamera();
                                                  },
                                                ));
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.file(
                                              image,
                                              height: 56,
                                              width: 56,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Row(
                              children: [
                                Text('Logo', style: blueFontStyle),
                                Text(' *',
                                    style: blueFontStyleBold.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: imagegedung == null
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryGedung();
                                                  },
                                                  onTap2: () {
                                                    //accessCameraGedung();
                                                  },
                                                ));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 56,
                                        width: 56,
                                        child: Image(
                                          image:
                                              AssetImage("assets/gedung.png"),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryGedung();
                                                  },
                                                  onTap2: () {
                                                    //accessCameraGedung();
                                                  },
                                                ));
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.file(
                                              imagegedung,
                                              height: 56,
                                              width: 56,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Row(
                              children: [
                                Text('Gedung', style: blueFontStyle),
                                Text(' *',
                                    style: blueFontStyleBold.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: imageaktivitas == null
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryAktivitas();
                                                  },
                                                  onTap2: () {
                                                    //accessCameraAktivitas();
                                                  },
                                                ));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 56,
                                        width: 56,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/aktifitas.png"),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryAktivitas();
                                                  },
                                                  onTap2: () {
                                                    //accessCameraAktivitas();
                                                  },
                                                ));
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.file(
                                              imageaktivitas,
                                              height: 56,
                                              width: 56,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Text('Aktifitas', style: blueFontStyle),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: imagefasilitas == null
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryfasilitas();
                                                  },
                                                  onTap2: () {
                                                    //accessCamerafasilitas();
                                                  },
                                                ));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 56,
                                        width: 56,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/fasilitas.png"),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGalleryfasilitas();
                                                  },
                                                  onTap2: () {
                                                    //accessCamerafasilitas();
                                                  },
                                                ));
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.file(
                                              imagefasilitas,
                                              height: 56,
                                              width: 56,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Text('Fasilitas', style: blueFontStyle),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Upload Biaya (max 500Kb/gambar/pdf)",
                      style: blackFontStyle1Bold.copyWith(fontSize: 14),
                    ),
                    Divider(height: 24, color: Colors.grey),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Lampirkan photo biaya terkini kampus anda seperti SPP, SPb dan biaya lainnya dalam format .jpg atau .pdf",
                            style: blueFontStyle,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: imagebiaya == null
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGallerybiaya();
                                                  },
                                                  onTap2: () {
                                                    //accessCamerabiaya();
                                                  },
                                                ));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 56,
                                        width: 56,
                                        child: Image(
                                          image: AssetImage("assets/biaya.png"),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => ShowContent(
                                                  onTap1: () {
                                                    //accessGallerybiaya();
                                                  },
                                                  onTap2: () {
                                                    //accessCamerabiaya();
                                                  },
                                                ));
                                      },
                                      child: Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 56,
                                          width: 56,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.file(
                                              imagebiaya,
                                              height: 56,
                                              width: 56,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            Row(
                              children: [
                                Text('Biaya', style: blueFontStyle),
                                Text(' *',
                                    style: blueFontStyleBold.copyWith(
                                        color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(height: 24, color: Colors.grey),
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
                              buttonText: "Join as Partner",
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

  void _navigateToProdiCheck(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProdiMultiple(
                proditerpilih: temp_proditerpilih,
                proditertambah: temp_prodikampus_tambahan,
              )),
    );
    setState(() {
      var _tempresult = json.decode(result);
      temp_prodikampus = _tempresult[0].toString().replaceAll(" ", "");
      temp_prodikampus_tambahan = _tempresult[1] == ""
          ? null
          : _tempresult[1].toString().replaceAll(", ", ",");
      temp_proditerpilih = _tempresult[2].toString();
      var a = temp_prodikampus == "" ? "" : ",";
      var b =
          temp_prodikampus_tambahan == null ? "" : temp_prodikampus_tambahan;
      _prodiygditamplikan = temp_prodikampus + a + b;
      print('prodi_terpilih: ' + temp_prodikampus);
      print('prodi_terpilih_tambahan: ' + temp_prodikampus_tambahan.toString());
      print('prodi_prodiygditamplikan: ' + _prodiygditamplikan);
    });
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

class ContentModal extends StatefulWidget {
  var datalist;
  String cat;
  ContentModal({Key key, @required this.datalist, this.cat}) : super(key: key);

  @override
  ContentModalState createState() => new ContentModalState();
}

class ContentModalState extends State<ContentModal> {
  TextEditingController etsearchprovinsi = new TextEditingController();
  TextEditingController etsearchkabupaten = new TextEditingController();
  TextEditingController etsearchkecamatan = new TextEditingController();
  TextEditingController etsearchdesa = new TextEditingController();

  List<MasterDaerahModel> fdataListwilayah = [];
  List<MasterDaerahModel> dataListwilayah = [];
  List<String> result = ["", ""];

  int lenght = 0;

  @override
  initState() {
    super.initState();
    fdataListwilayah = widget.datalist;
    dataListwilayah = widget.datalist;
    lenght = fdataListwilayah.length;
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
                controller: widget.cat == "provinsi"
                    ? etsearchprovinsi
                    : widget.cat == "kabupaten"
                        ? etsearchkabupaten
                        : widget.cat == "kecamatan"
                            ? etsearchkecamatan
                            : etsearchdesa,
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
                    hintText: "Cari " + widget.cat),
                onChanged: (string) {
                  setState(() {
                    fdataListwilayah = dataListwilayah
                        .where((u) => (u.nama
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                    lenght = fdataListwilayah.length;
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
                          final fdata = fdataListwilayah[index];
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
