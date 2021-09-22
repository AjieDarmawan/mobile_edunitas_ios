part of 'karir.dart';

class KarirPilihTemplate extends StatefulWidget {
  final ListKarirPatnerModel xkarir;
  KarirPilihTemplate({this.xkarir});

  @override
  KarirPilihTemplateState createState() => KarirPilihTemplateState();
}

class KarirPilihTemplateState extends State<KarirPilihTemplate> {
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

  var edit_cid = "",
      edit_nama_perusahaan,
      edit_tentang,
      edit_alamat_link,
      edit_alamat,
      edit_gaji,
      edit_pendidikan,
      edit_lowongan,
      edit_persyaratan,
      edit_dari,
      edit_hingga,
      edit_lokasi_kerja,
      edit_tipe_lowongan,
      edit_jenis_lowongan,
      edit_agency,
      edit_skala,
      edit_nama_perusahaan2,
      edit_bidang,
      edit_email,
      edit_notlp,
      edit_nofax,
      edit_website,
      edit_cpnama,
      edit_cpemail = "",
      edit_cpjabatan,
      edit_cpnotlp,
      edit_kata_kunci,
      edit_kota,
      edit_kecamatan,
      edit_desa,
      edit_provinsi,
      edit_negara,
      edit_kodepos,
      edit_gambar,
      edit_gambar1 = "nulle",
      edit_gambar2 = "nulle",
      edit_gambar3 = "nulle",
      edit_gambar4 = "nulle",
      edit_pdf,
      edit_keterangan,
      edit_seolink;

  void check_edit() {
    KarirViewModel()
        .check_edit(widget.xkarir.cid.toString(),
            widget.xkarir.jenisLowongan.toString()).then((value) {//handled
      setState(() {
        DetailKarirMeModel data = value;

        edit_cid = data.cid;
        edit_nama_perusahaan = data.namaPerusahaan;
        edit_tentang = data.tentang;
        edit_alamat_link = data.alamatLink;
        edit_alamat = data.alamat;
        edit_gaji = data.gaji;
        edit_pendidikan = data.pendidikan;
        edit_lowongan = data.lowongan;
        edit_persyaratan = data.persyaratan;
        edit_dari = data.dari;
        edit_hingga = data.hingga;
        edit_lokasi_kerja = data.lokasiKerja;
        edit_tipe_lowongan = data.tipeLowongan;
        edit_jenis_lowongan = data.jenisLowongan;
        edit_agency = data.agency;
        edit_skala = data.skala;
        edit_nama_perusahaan2 = data.namaPerusahaan2;
        edit_bidang = data.bidang;
        edit_email = data.email;
        edit_notlp = data.notlp;
        edit_nofax = data.nofax;
        edit_website = data.website;
        edit_cpnama = data.cpnama;
        edit_cpemail = data.cpemail;
        edit_cpjabatan = data.cpjabatan;
        edit_cpnotlp = data.cpnotlp;
        edit_kata_kunci = data.kataKunci;
        edit_kota = data.kota;
        edit_kecamatan = data.kecamatan;
        edit_desa = data.kelurahan;
        edit_provinsi = data.provinsi;
        edit_negara = data.negara;
        edit_kodepos = data.kodepos;
        edit_gambar = data.gambar;
        edit_gambar1 = data.gambar1;
        edit_gambar2 = data.gambar2;
        edit_gambar3 = data.gambar3;
        edit_gambar4 = data.gambar4;
        edit_pdf = data.pdf;
        edit_keterangan = data.keterangan;
        edit_seolink = data.seolink;

        //munculvideo();
        if (edit_jenis_lowongan == "lengkap") {
          formTerpilih = "lengkap";
          getTipeLowongan_lengkap();
          getSkala_lengkap();
          getAgensi_lengkap();
          isiFormEdit_lengkap();
        } else if (edit_jenis_lowongan == "gambar") {
          formTerpilih = "gambar";
          isiFormEdit_gambar();
        } else if (edit_jenis_lowongan == "pdf") {
          formTerpilih = "pdf";
          isiFormEdit_pdf();
        } else if (edit_jenis_lowongan == "singkat") {
          formTerpilih = "singkat";
          isiFormEdit_singkat();
        } else if (edit_jenis_lowongan == "sangat-singkat") {
          formTerpilih = "sangat-singkat";
          isiFormEdit_sangatsingkat();
        }
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<bool> _value_tipe_lowongan_lengkap = [false, false, false, false, false];
  List<bool> _value_skala_lengkap = [false, false, false];
  List<bool> _value_agency_lengkap = [false, false];

  int _val_tipe_lowongan_lengkap = 1;
  int _val_skala_lengkap = 1;
  int _val_agency_lengkap = 1;
  var tipe_lowongan_value;
  var skala_value;
  var agency_value;
  Widget widgetFormHolder;

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  //1// lengkap
  DateTime _dueDate = DateTime.now();
  String _tglmulaitampil_lengkap = "";
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
        _tglmulaitampil_lengkap =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //lengkap
  DateTime _dueDatemulai_lengkap = DateTime.now();
  String _tglmulai_lengkap = "";
  selectDueDate_mulai_lengkap(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatemulai_lengkap = picked;
        _tglmulai_lengkap = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  DateTime _dueDatepenutupan_lengkap = DateTime.now();
  String _tglpenutupan_lengkap = "";
  selectDueDate_penutupan_lengkap(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDatepenutupan_lengkap,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatepenutupan_lengkap = picked;
        _tglpenutupan_lengkap = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //singkat
  DateTime _dueDatemulai_singkat = DateTime.now();
  String _tglmulai_singkat = "";
  selectDueDate_mulai_singkat(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatemulai_singkat = picked;
        _tglmulai_singkat = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  DateTime _dueDatepenutupan_singkat = DateTime.now();
  String _tglpenutupan_singkat = "";
  selectDueDate_penutupan_singkat(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDatepenutupan_singkat,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatepenutupan_singkat = picked;
        _tglpenutupan_singkat = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //sangat singkat
  DateTime _dueDatemulai_sangat_singkat = DateTime.now();
  String _tglmulai_sangat_singkat = "";
  selectDueDate_mulai_sangat_singkat(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatemulai_sangat_singkat = picked;
        _tglmulai_sangat_singkat =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  DateTime _dueDatepenutupan_sangat_singkat = DateTime.now();
  String _tglpenutupan_sangat_singkat = "";
  selectDueDate_penutupan_sangat_singkat(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDatepenutupan_sangat_singkat,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatepenutupan_sangat_singkat = picked;
        _tglpenutupan_sangat_singkat =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //gambar
  DateTime _dueDatemulai_gambar = DateTime.now();
  String _tglmulai_gambar = "";
  selectDueDate_mulai_gambar(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatemulai_gambar = picked;
        _tglmulai_gambar = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  DateTime _dueDatepenutupan_gambar = DateTime.now();
  String _tglpenutupan_gambar = "";
  selectDueDate_penutupan_gambar(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDatepenutupan_gambar,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatepenutupan_gambar = picked;
        _tglpenutupan_gambar = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  //pdf
  DateTime _dueDatemulai_pdf = DateTime.now();
  String _tglmulai_pdf = "";
  selectDueDate_mulai_pdf(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatemulai_pdf = picked;
        _tglmulai_pdf = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  DateTime _dueDatepenutupan_pdf = DateTime.now();
  String _tglpenutupan_pdf = "";
  selectDueDate_penutupan_pdf(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDatepenutupan_pdf,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDatepenutupan_pdf = picked;
        _tglpenutupan_pdf = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  String dateSplit(String date) {
    String day, mon, yea;
    List<String> valdate = date.split(" ");
    day = valdate[0];
    yea = valdate[2];
    if (valdate[1] == "Januari") {
      mon = "1";
    } else if (valdate[1] == "Februari") {
      mon = "2";
    } else if (valdate[1] == "Maret") {
      mon = "3";
    } else if (valdate[1] == "April") {
      mon = "4";
    } else if (valdate[1] == "Mei") {
      mon = "5";
    } else if (valdate[1] == "Juni") {
      mon = "6";
    } else if (valdate[1] == "Juli") {
      mon = "7";
    } else if (valdate[1] == "Agustus") {
      mon = "8";
    } else if (valdate[1] == "September") {
      mon = "9";
    } else if (valdate[1] == "Oktober") {
      mon = "10";
    } else if (valdate[1] == "November") {
      mon = "11";
    } else if (valdate[1] == "Desember") {
      mon = "12";
    }
    return "$yea-$mon-$day";
  }

  //logo_lengkap

  File image_logo_lengkap, logo_lengkap_save; //ktp
  TextEditingController ctitlelogo_lengkap = new TextEditingController();
  accessCameralogo_lengkap() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitlelogo_lengkap.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_logo_lengkap = img;
    //     logo_lengkap_save = compressImg;
    //     Navigator.pop(context);
    //     //  uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGallerylogo_lengkap() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitlelogo_lengkap.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_logo_lengkap = img;
    //     logo_lengkap_save = compressImg;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  //jobgambar1

  File image_jobgambar1, jobgambar1_save; //ktp
  TextEditingController ctitle_jobgambar1 = new TextEditingController();
  accessCamera_jobgambar1() async {
    // File imgjob_gambar1 =
    //     await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar1.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar1.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job1 =
    //     new File("$path/image1_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar1 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar1 = imgjob_gambar1;
    //     jobgambar1_save = compressImg_job1;
    //     Navigator.pop(context);
    //     //  uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGallery_jobgambar1() async {
    // File imgjob_gambar1 =
    //     await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar1.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar1.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job1 =
    //     new File("$path/image1_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar1 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar1 = imgjob_gambar1;
    //     jobgambar1_save = compressImg_job1;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  //jobgambar2

  File image_jobgambar2, jobgambar2_save; //ktp
  TextEditingController ctitle_jobgambar2 = new TextEditingController();
  accessCamera_jobgambar2() async {
    // File imgjob_gambar2 =
    //     await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar2.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar2.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job2 =
    //     new File("$path/image2_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar2 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar2 = imgjob_gambar2;
    //     jobgambar2_save = compressImg_job2;
    //     Navigator.pop(context);
    //     //  uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGallery_jobgambar2() async {
    // File imgjob_gambar2 =
    //     await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar2.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar2.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job2 =
    //     new File("$path/image2_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar2 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar2 = imgjob_gambar2;
    //     jobgambar2_save = compressImg_job2;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  //jobgambar3

  File image_jobgambar3, jobgambar3_save; //ktp
  TextEditingController ctitle_jobgambar3 = new TextEditingController();
  accessCamera_jobgambar3() async {
    // File imgjob_gambar3 =
    //     await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar3.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar3.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job3 =
    //     new File("$path/image3_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar3 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar3 = imgjob_gambar3;
    //     jobgambar3_save = compressImg_job3;
    //     Navigator.pop(context);
    //     //  uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGallery_jobgambar3() async {
    // File imgjob_gambar3 =
    //     await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_jobgambar3.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar3.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job3 =
    //     new File("$path/image3_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar3 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_jobgambar3 = imgjob_gambar3;
    //     jobgambar3_save = compressImg_job3;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  //pdf

  //jobgambar3

  File image_pdf, pdf_save; //ktp
  TextEditingController ctitle_pdf = new TextEditingController();
  accessCamera_pdf() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_pdf.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image3_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // String adr_pdf = "$path/image3_${random_name_logo}${random_name_logo}.jpg";

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_pdf = img;
    //     pdf_save = compressImg;
    //     etuploadpdf_pdf.text = adr_pdf;
    //     Navigator.pop(context);
    //     //  uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGallery_pdf() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_pdf.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image_${random_name_logo}${random_name_logo}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_pdf = img;
    //     pdf_save = compressImg;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  // lengkap
  DateTime _dueDate_tglmulaipenutup_lengkap = DateTime.now();
  String __tglmulaipenutup_lengkap = "";
  selectDueDate__tglmulaipenutup_lengkap(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate_tglmulaipenutup_lengkap,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dueDate_tglmulaipenutup_lengkap = picked;
        // __tglmulaipenutup_lengkap = "${picked.day}-${picked.month}-${picked.year}";
        __tglmulaipenutup_lengkap =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  final _listTemplateTitle = [
    '1. Lowongan Kerja Lengkap',
    '2. Singkat',
    '3. Sangat Singkat',
    '4. Hanya Gambar',
    '5. Hanya PDF',
  ];

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

  List<MasterJurusanModel> dataJurusan = new List();
  List<MasterJurusanModel> forfilterdataJurusan = [];
  void getJurusan() async {
    KarirViewModel().karir_pendidikan().then((value1) {//handled
      setState(() {
        dataJurusan = value1 == null ? [] : value1;
        forfilterdataJurusan = dataJurusan;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<MasterDaerahModel> datawilayah = [];
  void getWilayah() async {
    KarirViewModel().wilayah_karir().then((value) {//handled
      setState(() {
        datawilayah = value == null ? [] : value;
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

  List<MasterDaerahModel> datakabkota = [];
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

  List<MasterDaerahModel> datakecamatan = [];
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
                checkXkarir();
                getposisi();
                getJurusan();
                getWilayah();
                getProvinsi();
                getindustri();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var random_name_logo = 0;

  int captcha_satu = 0;
  int captcha_dua = 0;

  @override
  void initState() {
    super.initState();
    getPreferences();
    checkXkarir();
    getposisi();
    getJurusan();
    getWilayah();
    getProvinsi();
    getindustri();
    if (widget.xkarir != null) check_edit();

    Random random = new Random();
    int randomNumber = random.nextInt(20) + 1;

    Random random2 = new Random();
    int randomNumber2 = random2.nextInt(20) + 1;

    setState(() {
      random_name_logo = randomNumber;
      captcha_satu = randomNumber;
      captcha_dua = randomNumber2;
    });
  }

  void checkXkarir() {
    if (widget.xkarir != null) {
      print("cid_boy: " + widget.xkarir.cid.toString());
      print("tipe_lowongan_boy : " + widget.xkarir.tipeLowongan.toString());
      print("jenis_lowongan_boy: " + widget.xkarir.jenisLowongan.toString());
    }
  }

  var valposisi;
  var hintposisi;
  void modalBottomposisi(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: dataposisi,
            cat: "posisi",
          );
        });
    setState(() {
      valposisi = result[0].toString();
      hintposisi = result[1].toString();
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
          return ContentModal(
            datalist: dataindustri,
            cat: "industri",
          );
        });
    setState(() {
      valindustri = result[0].toString();
      hintindustri = result[1].toString();
    });
  }

  var valjurusan;
  var hintjurusan = "";
  void modalBottomjurusan(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: dataJurusan,
            cat: "jurusan",
          );
        });
    setState(() {
      valjurusan = result[0].toString();
      var beforeJurusan = hintjurusan;
      var addJurusan = result[1].toString();
      hintjurusan =
          hintjurusan == "" ? addJurusan : beforeJurusan + ", " + addJurusan;
    });
  }

  var valwilayah;
  var hintwilayah;
  void modalBottomWilayah(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModal(
            datalist: datawilayah,
            cat: "provinsi",
          );
        });
    setState(() {
      valwilayah = result[0].toString();
      hintwilayah = result[1].toString();
    });
  }

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
      print("valkec: " + valkec);
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

  var InSignIn = false;
  var formTerpilih = "lengkap";

  //form satu
  TextEditingController etnamaperusahaan_lengkap = new TextEditingController();
  TextEditingController etdeskripsi_lengkap = new TextEditingController();
  TextEditingController etpersyaratan_lengkap = new TextEditingController();
  TextEditingController etalamatsuratlamaran_lengkap =
      new TextEditingController();
  TextEditingController etseolink_lengkap = new TextEditingController();
  TextEditingController etemail_data_lengkap = new TextEditingController();
  TextEditingController etalamat_data_lengkap = new TextEditingController();
  TextEditingController etkodepos_data_lengkap = new TextEditingController();
  TextEditingController etnamalengkap_pj_lengkap = new TextEditingController();
  TextEditingController etjabatan_pj_lengkap = new TextEditingController();
  TextEditingController etemail_pj_lengkap = new TextEditingController();
  TextEditingController etnotlpn_pj_lengkap = new TextEditingController();

  TextEditingController etnamaperusahan_data_lengkap =
      new TextEditingController();
  TextEditingController ettelepon_data_lengkap = new TextEditingController();

  TextEditingController etfax_data_lengkap = new TextEditingController();
  TextEditingController etwebsite_data_lengkap = new TextEditingController();

  TextEditingController etlowongandibuka_lengkap = new TextEditingController();
  TextEditingController etkategorilulusan_lengkap = new TextEditingController();
  TextEditingController hasil_captcha = new TextEditingController();

  var _logoPerusahaan_lengkap;

  bool _fulltime_lengkap = false;
  bool _partime_lengkap = false;
  bool _kontrak_lengkap = false;
  bool _magang_lengkap = false;
  bool _freelance_lengkap = false;

  Widget formSatu(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor1, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Lowongan Lengkap",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tipe Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 1,
              groupValue: _val_tipe_lowongan_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_tipe_lowongan_lengkap = value;
                  _value_tipe_lowongan_lengkap[0] = true;
                  tipe_lowongan_value = "Full Time";
                });
              },
              title: Text(
                "Full Time",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_tipe_lowongan_lengkap[0],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 2,
              groupValue: _val_tipe_lowongan_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_tipe_lowongan_lengkap = value;
                  _value_tipe_lowongan_lengkap[1] = true;
                  tipe_lowongan_value = "Part Time";
                });
              },
              title: Text(
                "Part Time",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_tipe_lowongan_lengkap[1],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 3,
              groupValue: _val_tipe_lowongan_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_tipe_lowongan_lengkap = value;
                  _value_tipe_lowongan_lengkap[2] = true;
                  tipe_lowongan_value = "Kontrak";
                });
              },
              title: Text(
                "Kontrak",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_tipe_lowongan_lengkap[2],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 4,
              groupValue: _val_tipe_lowongan_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_tipe_lowongan_lengkap = value;
                  _value_tipe_lowongan_lengkap[3] = true;
                  tipe_lowongan_value = "Magang";
                });
              },
              title: Text(
                "Magang",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_tipe_lowongan_lengkap[3],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 5,
              groupValue: _val_tipe_lowongan_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_tipe_lowongan_lengkap = value;
                  _value_tipe_lowongan_lengkap[4] = true;
                  tipe_lowongan_value = "Freelance";
                });
              },
              title: Text(
                "Freelance",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_tipe_lowongan_lengkap[4],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamaperusahaan_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    filled: false,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "PT. Nama Perusahaan"),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Lowongan yang dibuka ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: TextFormField(
                controller: etlowongandibuka_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Lowongan yang dibuka",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey, width: 1),
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: ListTile(
            //     onTap: () {
            //       if (dataposisi.length != 0) modalBottomposisi(context);
            //     },
            //     // leading: Text("Provinsi",
            //     //     style: blackFontStyle1.copyWith(fontSize: 16)),
            //     leading: Text(
            //       dataposisi.length != 0
            //           ? hintposisi == null
            //               ? 'Pilih Lowongan'
            //               : hintposisi
            //           : 'Mohon tunggu..',
            //       // "Pilih Wilayah",
            //       style: TextStyle(color: Colors.black, fontSize: 16),
            //     ),
            //     trailing: Icon(
            //       Icons.navigate_next,
            //       color: blackColor,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Lokasi/Tempat Kerja ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (datawilayah.length != 0) modalBottomWilayah(context);
                },
                // leading: Text("Provinsi",
                //     style: blackFontStyle1.copyWith(fontSize: 16)),
                leading: Text(
                  datawilayah.length != 0
                      ? hintwilayah == null
                          ? 'Pilih Lokasi'
                          : hintwilayah
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
                  text: "Deskripsi Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etdeskripsi_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(dibawah ini hanya contoh)\nPerusahaan ini bergerak di bidang .....\nAlamat : .....\nTelp./HP : .....",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Persyaratan (Kualifikasi, Pendidikan, Pengalaman, dsb) ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etpersyaratan_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\n1. Manager Service (MS)\n- Pria/Wanita, pengalaman minimal 2 tahun\n- Pendidikan minimal S1 semua jurusan\n\n2. Staf Administrasi (SA)\n- Pendidikan minimal SLTA (D3 lebih diutamakan), fresh graduate, pria/wanita\n",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 7,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Alamat Surat Lamaran ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etalamatsuratlamaran_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\nKirimkan lamaran dan CV lengkap via POS ke : HRD PT. XXXX Jl. .... (cantumkan kode lamaran dst... dsb) Atau via email ke : .... atau hubungi .... dsb",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Kategori Lulusan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: TextFormField(
                controller: etkategorilulusan_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Lowongan yang dibuka",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey, width: 1),
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: ListTile(
            //     onTap: () {
            //       if (dataJurusan.length != 0) modalBottomjurusan(context);
            //     },
            //     leading: Text(
            //       dataJurusan.length != 0
            //           ? hintjurusan == ""
            //               ? 'Pilih Lulusan (multiple)'
            //               : hintjurusan
            //           : 'Mohon tunggu..',
            //       style: TextStyle(color: Colors.black, fontSize: 16),
            //     ),
            //     trailing: Icon(
            //       Icons.navigate_next,
            //       color: blackColor,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal mulai ditampilkan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglmulai_lengkap == "" ? "YYYY/MM/DD" : _tglmulai_lengkap,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_mulai_lengkap(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal penutupan lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglpenutupan_lengkap == ""
                      ? "YYYY/MM/DD"
                      : _tglpenutupan_lengkap,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_penutupan_lengkap(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "SEO Link Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etseolink_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "lowongan-kerja-it support-ptxyz-bogor",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Data Perusahaan",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      text: "Logo ",
                      style: blueFontStyleBold,
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: widget.xkarir != null
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ShowContent(
                                      onTap1: () {
                                        accessGallerylogo_lengkap();
                                      },
                                      onTap2: () {
                                        accessCameralogo_lengkap();
                                      },
                                    ));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            height: 56,
                            width: 56,
                            child: Image(
                              image: AssetImage("assets/uploadlogo.png"),
                            ),
                          ),
                        )
                      : image_logo_lengkap == null
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowContent(
                                          onTap1: () {
                                            accessGallerylogo_lengkap();
                                          },
                                          onTap2: () {
                                            accessCameralogo_lengkap();
                                          },
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                height: 56,
                                width: 56,
                                child: Image(
                                  image: AssetImage("assets/uploadlogo.png"),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowContent(
                                          onTap1: () {
                                            accessGallerylogo_lengkap();
                                          },
                                          onTap2: () {
                                            accessCameralogo_lengkap();
                                          },
                                        ));
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  height: 56,
                                  width: 56,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.file(
                                      image_logo_lengkap,
                                      height: 56,
                                      width: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Skala Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 1,
              groupValue: _val_skala_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_skala_lengkap = value;
                  _value_skala_lengkap[0] = true;
                  skala_value = "Lokal";
                });
              },
              title: Text(
                "Lokal",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_skala_lengkap[0],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 2,
              groupValue: _val_skala_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_skala_lengkap = value;
                  _value_skala_lengkap[1] = true;
                  skala_value = "Nasional";
                });
              },
              title: Text(
                "Nasional",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_skala_lengkap[1],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 3,
              groupValue: _val_skala_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_skala_lengkap = value;
                  _value_skala_lengkap[2] = true;
                  skala_value = "Internasional";
                });
              },
              title: Text(
                "Internasional",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_skala_lengkap[2],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Apakah perusahaan ini Recruit Agency ? ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 1,
              groupValue: _val_agency_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_agency_lengkap = value;
                  _value_agency_lengkap[0] = true;
                  agency_value = "Ya";
                });
              },
              title: Text(
                "Ya",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_agency_lengkap[0],
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: 2,
              groupValue: _val_agency_lengkap,
              onChanged: (value) {
                setState(() {
                  _val_agency_lengkap = value;
                  _value_agency_lengkap[1] = true;
                  agency_value = "Bukan";
                });
              },
              title: Text(
                "Bukan",
                style: blackFontStyle1.copyWith(
                  fontSize: 16,
                ),
              ),
              selected: _value_agency_lengkap[1],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamaperusahan_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "PT. Nama Perusahaan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Industri ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (dataindustri.length != 0) modalBottomindustri(context);
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
                  text: "Email Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "perusahaan@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Telepon Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: ettelepon_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Fax Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etfax_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Website Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etwebsite_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "www.perusahaan.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Alamat",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Provinsi ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (dataprovinsi.length != 0) modalBottomProv(context);
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
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Kabupaten/Kota ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (datakabkota.length != 0) modalBottomkabkota(context);
                },
                // leading: Text("Provinsi",
                //     style: blackFontStyle1.copyWith(fontSize: 16)),
                leading: Text(
                  widget.xkarir == null
                      ? datakabkota.length != 0
                          ? hintkabkota == null
                              ? 'Pilih Kabupaten/Kota'
                              : hintkabkota
                          : 'Mohon tunggu..'
                      : hintkabkota == null
                          ? 'Mohon tunggu..'
                          : hintkabkota,
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
                  text: "Kecamatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (datakecamatan.length != 0) modalBottomKec(context);
                },
                // leading: Text("Provinsi",
                //     style: blackFontStyle1.copyWith(fontSize: 16)),
                leading: Text(
                  widget.xkarir == null
                      ? datakecamatan.length != 0
                          ? hintkec == null
                              ? 'Pilih Kecamatan'
                              : hintkec
                          : 'Mohon tunggu..'
                      : hintkec == null
                          ? 'Mohon tunggu..'
                          : hintkec,
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
                  text: "Desa/Kelurahan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (datadesa.length != 0) modalBottomDesa(context);
                },
                // leading: Text("Provinsi",
                //     style: blackFontStyle1.copyWith(fontSize: 16)),
                leading: Text(
                  widget.xkarir == null
                      ? datadesa.length != 0
                          ? hintdesa == null
                              ? 'Pilih Desa/Kelurahan'
                              : hintdesa
                          : 'Mohon tunggu..'
                      : hintdesa == null
                          ? 'Mohon tunggu..'
                          : hintdesa,
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
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etalamat_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Jalan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
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
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etkodepos_data_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
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
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamalengkap_pj_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Lengkap",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Jabatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etjabatan_pj_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Jabatan Contact Person",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Email ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_pj_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "nama@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "No Telepon / HP ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnotlpn_pj_lengkap,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                  style: blueFontStyleBold.copyWith(fontSize: 10),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "${captcha_satu} + ${captcha_dua} =",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.phone,
                controller: hasil_captcha,
                // initialValue: "0",
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            !_loading
                ? Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: EduButton(
                    buttonText: "Submit",
                    onPressed: () {
                      setState(() {
                        _loading = true;
                        _loadingClose();
                        check_lengkap();
                      });
                    }))
                : Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: SpinKitFadingCircle(color: orenColor))
          ],
        ),
      ),
    );
  }

  TextEditingController etnamaperusahaan_singkat = new TextEditingController();
  TextEditingController etlowongandibuka_singkat = new TextEditingController();
  TextEditingController etpersyaratan_singkat = new TextEditingController();
  TextEditingController etalamat_singkat = new TextEditingController();
  TextEditingController etseolink_singkat = new TextEditingController();
  TextEditingController etnamalengkap_pj_singkat = new TextEditingController();
  TextEditingController etjabatan_pj_singkat = new TextEditingController();
  TextEditingController etemail_pj_singkat = new TextEditingController();
  TextEditingController etnotlpn_pj_singkat = new TextEditingController();
  TextEditingController hasil_captcha_singkat = new TextEditingController();

  Widget formDua(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor1, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Lowongan Singkat",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamaperusahaan_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "PT. Nama Perusahaan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal mulai ditampilkan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglmulai_singkat == "" ? "YYYY/MM/DD" : _tglmulai_singkat,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_mulai_singkat(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal penutupan lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglpenutupan_singkat == ""
                      ? "YYYY/MM/DD"
                      : _tglpenutupan_singkat,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_penutupan_singkat(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Lowongan yang dibuka ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etlowongandibuka_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Lokasi/Tempat Kerja ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                onTap: () {
                  if (datawilayah.length != 0) modalBottomWilayah(context);
                },
                // leading: Text("Provinsi",
                //     style: blackFontStyle1.copyWith(fontSize: 16)),
                leading: Text(
                  datawilayah.length != 0
                      ? hintwilayah == null
                          ? 'Pilih Lokasi'
                          : hintwilayah
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
                  text:
                      "Persyaratan (Kualifikasi, Pendidikan, Pengalaman, dsb) ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etpersyaratan_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\n1. Manager Service (MS)\n- Pria/Wanita, pengalaman minimal 2 tahun\n- Pendidikan minimal S1 semua jurusan\n\n2. Staf Administrasi (SA)\n- Pendidikan minimal SLTA (D3 lebih diutamakan), fresh graduate, pria/wanita\n",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 7,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Alamat Surat Lamaran ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etalamat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\nKirimkan lamaran dan CV lengkap via POS ke : HRD PT. XXXX Jl. .... (cantumkan kode lamaran dst... dsb) Atau via email ke : .... atau hubungi .... dsb",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "SEO Link Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etseolink_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "lowongan-kerja-it support-ptxyz-bogor",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
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
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamalengkap_pj_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Lengkap",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Jabatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etjabatan_pj_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Jabatan Contact Person",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Email ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_pj_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "nama@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "No Telepon / HP ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnotlpn_pj_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                  style: blueFontStyleBold.copyWith(fontSize: 10),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "${captcha_satu} + ${captcha_dua} =",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: hasil_captcha_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            !_loading
                ? Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: EduButton(
                    buttonText: "Submit",
                    onPressed: () {
                      setState(() {
                        _loading = true;
                        _loadingClose();
                        check_singkat();
                      });
                    }))
                : Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: SpinKitFadingCircle(color: orenColor,))
          ],
        ),
      ),
    );
  }

  TextEditingController etnamaperusahaan_sangat_singkat =
      new TextEditingController();
  TextEditingController etdeskripsi_sangat_singkat =
      new TextEditingController();
  TextEditingController etalamat_sangat_singkat = new TextEditingController();
  TextEditingController etseolink_sangat_singkat = new TextEditingController();
  TextEditingController etnamalengkap_pj_sangat_singkat =
      new TextEditingController();
  TextEditingController etjabatan_pj_sangat_singkat =
      new TextEditingController();
  TextEditingController etemail_pj_sangat_singkat = new TextEditingController();
  TextEditingController etnotlpn_pj_sangat_singkat =
      new TextEditingController();

  TextEditingController hasil_captcha_sangat_singkat =
      new TextEditingController();

  Widget formTiga(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor1, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Lowongan Sangat Singkat",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Perusahaan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamaperusahaan_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "PT. Nama Perusahaan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal mulai ditampilkan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglmulai_sangat_singkat == ""
                      ? "YYYY/MM/DD"
                      : _tglmulai_sangat_singkat,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_mulai_sangat_singkat(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal penutupan lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglpenutupan_sangat_singkat == ""
                      ? "YYYY/MM/DD"
                      : _tglpenutupan_sangat_singkat,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_penutupan_sangat_singkat(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "SEO Link Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etseolink_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "lowongan-kerja-it support-ptxyz-bogor",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Deskripsi ( Singkat Saja ) ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etdeskripsi_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\nDicari Lowongan untuk\n1. Manager Service (MS)\n2. Staf Administrasi (SA)\n3. .........",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
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
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamalengkap_pj_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Lengkap",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Jabatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etjabatan_pj_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Jabatan Contact Person",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Email ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_pj_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "nama@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "No Telepon / HP ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnotlpn_pj_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                  style: blueFontStyleBold.copyWith(fontSize: 10),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "${captcha_satu} + ${captcha_dua} =",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: hasil_captcha_sangat_singkat,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            !_loading
                ? Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: EduButton(
                    buttonText: "Submit",
                    onPressed: () {
                      setState(() {
                        _loading = true;
                        _loadingClose();
                        check_sangat_singkat();
                      });
                    }))
                : Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: SpinKitFadingCircle(color: orenColor,))
          ],
        ),
      ),
    );
  }

  TextEditingController etnamapemberikerja_gambar = new TextEditingController();
  TextEditingController etkatakunci_gambar = new TextEditingController();
  TextEditingController etalamat_gambar = new TextEditingController();
  TextEditingController etseolink_gambar = new TextEditingController();
  TextEditingController etnamalengkap_pj_gambar = new TextEditingController();
  TextEditingController etjabatan_pj_gambar = new TextEditingController();
  TextEditingController etemail_pj_gambar = new TextEditingController();
  TextEditingController etnotlpn_pj_gambar = new TextEditingController();
  TextEditingController hasil_captcha_gambar = new TextEditingController();

  Widget formEmpat(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor1, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Lowongan Gambar",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Pemberi Kerja ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamapemberikerja_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "PT. Nama Pemberi Kerja / Perusahaan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal mulai ditampilkan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglmulai_gambar == "" ? "YYYY/MM/DD" : _tglmulai_gambar,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_mulai_gambar(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal penutupan lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglpenutupan_gambar == ""
                      ? "YYYY/MM/DD"
                      : _tglpenutupan_gambar,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_penutupan_gambar(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Kata Kunci (Tag) ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etkatakunci_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\nHuman Resources Support Staff, Tasikmalaya/Ciamis",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "SEO Link Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etseolink_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "lowongan-kerja-it support-ptxyz-bogor",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Upload Gambar Lowongan",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      text: "Poster",
                      style: blueFontStyleBold,
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) => ShowContent(
                    //               onTap1: () {
                    //                 accessGallery_jobgambar1();
                    //               },
                    //               onTap2: () {
                    //                 accessCamera_jobgambar1();
                    //               },
                    //             ));
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(vertical: 4),
                    //     height: 56,
                    //     width: 56,
                    //     child: Image(
                    //       image: AssetImage("assets/uploadlogo.png"),
                    //     ),
                    //   ),
                    // ),

                    Container(
                      child: widget.xkarir != null
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowContent(
                                          onTap1: () {
                                            accessGallery_jobgambar1();
                                          },
                                          onTap2: () {
                                            accessCamera_jobgambar1();
                                          },
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                height: 56,
                                width: 56,
                                child: Image(
                                  image: edit_gambar1 == "nulle"
                                      ? AssetImage("assets/uploadlogo.png")
                                      : NetworkImage(edit_gambar1),
                                ),
                              ),
                            )
                          : image_jobgambar1 == null
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar1();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar1();
                                              },
                                            ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 56,
                                    width: 56,
                                    child: Image(
                                      image:
                                          AssetImage("assets/uploadlogo.png"),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar1();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar1();
                                              },
                                            ));
                                  },
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      height: 56,
                                      width: 56,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.file(
                                          image_jobgambar1,
                                          height: 56,
                                          width: 56,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                    ), //gambar 2
                    Container(
                      child: widget.xkarir != null
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowContent(
                                          onTap1: () {
                                            accessGallery_jobgambar2();
                                          },
                                          onTap2: () {
                                            accessCamera_jobgambar2();
                                          },
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                height: 56,
                                width: 56,
                                child: Image(
                                  image: edit_gambar2 == "nulle"
                                      ? AssetImage("assets/uploadlogo.png")
                                      : NetworkImage(edit_gambar2),
                                ),
                              ),
                            )
                          : image_jobgambar2 == null
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar2();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar2();
                                              },
                                            ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 56,
                                    width: 56,
                                    child: Image(
                                      image:
                                          AssetImage("assets/uploadlogo.png"),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar2();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar2();
                                              },
                                            ));
                                  },
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      height: 56,
                                      width: 56,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.file(
                                          image_jobgambar2,
                                          height: 56,
                                          width: 56,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                    ), //gambar 3
                    Container(
                      child: widget.xkarir != null
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ShowContent(
                                          onTap1: () {
                                            accessGallery_jobgambar3();
                                          },
                                          onTap2: () {
                                            accessCamera_jobgambar3();
                                          },
                                        ));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                height: 56,
                                width: 56,
                                child: Image(
                                  image: edit_gambar3 == "nulle"
                                      ? AssetImage("assets/uploadlogo.png")
                                      : NetworkImage(edit_gambar3),
                                ),
                              ),
                            )
                          : image_jobgambar3 == null
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar3();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar3();
                                              },
                                            ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 56,
                                    width: 56,
                                    child: Image(
                                      image:
                                          AssetImage("assets/uploadlogo.png"),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGallery_jobgambar3();
                                              },
                                              onTap2: () {
                                                accessCamera_jobgambar3();
                                              },
                                            ));
                                  },
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      height: 56,
                                      width: 56,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.file(
                                          image_jobgambar3,
                                          height: 56,
                                          width: 56,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  ],
                ),
              ],
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
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamalengkap_pj_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Lengkap",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Jabatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etjabatan_pj_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Jabatan Contact Person",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Email ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_pj_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "nama@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "No Telepon / HP ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnotlpn_pj_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                  style: blueFontStyleBold.copyWith(fontSize: 10),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "${captcha_satu} + ${captcha_dua} =",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: hasil_captcha_gambar,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            !_loading
                ? Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: EduButton(
                    buttonText: "Submit",
                    onPressed: () {
                      setState(() {
                        _loading = true;
                        _loadingClose();
                        check_gambar();
                      });
                    }))
                : Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: SpinKitFadingCircle(color: orenColor,))
          ],
        ),
      ),
    );
  }

  TextEditingController etkatakunci_pdf = new TextEditingController();
  TextEditingController etnamaperusahaan_pdf = new TextEditingController();
  TextEditingController etalamat_pdf = new TextEditingController();
  TextEditingController etseolink_pdf = new TextEditingController();
  TextEditingController etuploadpdf_pdf = new TextEditingController();
  TextEditingController etnamalengkap_pj_pdf = new TextEditingController();
  TextEditingController etjabatan_pj_pdf = new TextEditingController();
  TextEditingController etemail_pj_pdf = new TextEditingController();
  TextEditingController etnotlpn_pj_pdf = new TextEditingController();
  TextEditingController hasil_captcha_pdf = new TextEditingController();

  Widget formLima(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor1, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Data Lowongan PDF",
              style: blackFontStyle1Bold.copyWith(fontSize: 14),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "SEO Link Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etseolink_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "lowongan-kerja-it support-ptxyz-bogor",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Upload File PDF Lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: etuploadpdf_pdf,
                      enabled: false,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      //keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        filled: false,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: "",
                      ),
                      //validator: emailValidator,
                      onSaved: (value) {},
                      onTap: () {},
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  child: EduButtonSecond(
                    buttonText: "Upload",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => ShowContentPDF(
                                onTap: () {},
                              ));
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Nama Pemberi Kerja ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamaperusahaan_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "PT. Nama Pemberi Kerja / Perusahaan",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal mulai ditampilkan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglmulai_pdf == "" ? "YYYY/MM/DD" : _tglmulai_pdf,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_mulai_pdf(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Tanggal penutupan lowongan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
                  _tglpenutupan_pdf == "" ? "YYYY/MM/DD" : _tglpenutupan_pdf,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                onTap: () {
                  selectDueDate_penutupan_pdf(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Kata Kunci (Tag) ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etkatakunci_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText:
                      "(di bawah ini sekedar contoh)\nHuman Resources Support Staff, Tasikmalaya/Ciamis",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
                maxLines: 4,
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
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnamalengkap_pj_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Nama Lengkap",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Jabatan ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etjabatan_pj_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Jabatan Contact Person",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Email ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etemail_pj_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "nama@email.com",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "No Telepon / HP ",
                  style: blueFontStyleBold,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: etnotlpn_pj_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "+62xxxxxxxxxx",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text:
                      "Silahkan proses verifikasi CAPTCHA ini dengan memasukan jawaban yang benar di dalam kotak",
                  style: blueFontStyleBold.copyWith(fontSize: 10),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "${captcha_satu} + ${captcha_dua} =",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: hasil_captcha_pdf,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                //keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  filled: false,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "",
                ),
                //validator: emailValidator,
                onSaved: (value) {},
              ),
            ),
            !_loading
                ? Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: EduButton(
                    buttonText: "Submit",
                    onPressed: () {
                      setState(() {
                        _loading = true;
                        _loadingClose();
                        check_pdf();
                      });
                    }))
                : Container(
                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: SpinKitFadingCircle(color: orenColor,))
          ],
        ),
      ),
    );
  }

  String getJenisLowongan_edit() {
    if (edit_jenis_lowongan == "lengkap") {
      return "lengkap";
    } else if (edit_jenis_lowongan == "gambar") {
      return "gambar";
    } else if (edit_jenis_lowongan == "pdf") {
      return "pdf";
    } else if (edit_jenis_lowongan == "singkat") {
      return "singkat";
    } else if (edit_jenis_lowongan == "sangatsingkat") {
      return "sangatsingkat";
    }
  }

  void getPilihan(context) {
    if (formTerpilih == "lengkap") {
      widgetFormHolder = formSatu(context);
    } else if (formTerpilih == "singkat") {
      widgetFormHolder = formDua(context);
    } else if (formTerpilih == "sangat-singkat") {
      widgetFormHolder = formTiga(context);
    } else if (formTerpilih == "gambar") {
      widgetFormHolder = formEmpat(context);
    } else if (formTerpilih == "pdf") {
      widgetFormHolder = formLima(context);
    } else {
      widgetFormHolder = formSatu(context);
    }
  }

  //sudut edit
  //func unique ability each form

  //FORM_LENGKAP

  void getTipeLowongan_lengkap() {
    var _tipelowongan = edit_tipe_lowongan == null
        ? "Full Time"
        : edit_tipe_lowongan.toString();
    if (_tipelowongan == "Full Time") {
      _value_tipe_lowongan_lengkap[0] = true;
      tipe_lowongan_value = "Full Time";
      _val_tipe_lowongan_lengkap = 1;
    } else if (_tipelowongan == "Part Time") {
      _value_tipe_lowongan_lengkap[1] = true;
      tipe_lowongan_value = "Part Time";
      _val_tipe_lowongan_lengkap = 2;
    } else if (_tipelowongan == "Kontrak") {
      _value_tipe_lowongan_lengkap[2] = true;
      tipe_lowongan_value = "Kontrak";
      _val_tipe_lowongan_lengkap = 3;
    } else if (_tipelowongan == "Magang") {
      _value_tipe_lowongan_lengkap[3] = true;
      tipe_lowongan_value = "Magang";
      _val_tipe_lowongan_lengkap = 4;
    } else if (_tipelowongan == "Freelance") {
      _value_tipe_lowongan_lengkap[4] = true;
      tipe_lowongan_value = "Freelance";
      _val_tipe_lowongan_lengkap = 5;
    } else {
      _value_tipe_lowongan_lengkap[0] = true;
      tipe_lowongan_value = "Full Time";
      _val_tipe_lowongan_lengkap = 1;
    }
  }

  void getSkala_lengkap() {
    var _tipeskala = edit_skala == null ? "Lokal" : edit_skala.toString();
    if (_tipeskala == "Lokal") {
      _value_skala_lengkap[0] = true;
      skala_value = "Lokal";
      _val_skala_lengkap = 1;
    } else if (_tipeskala == "Nasional") {
      _value_skala_lengkap[1] = true;
      skala_value = "Nasional";
      _val_skala_lengkap = 2;
    } else if (_tipeskala == "Internasional") {
      _value_skala_lengkap[2] = true;
      skala_value = "Internasional";
      _val_skala_lengkap = 3;
    } else {
      _value_skala_lengkap[0] = true;
      skala_value = "Lokal";
      _val_skala_lengkap = 1;
    }
  }

  void getAgensi_lengkap() {
    var _tipeagensi = edit_agency == null ? "Ya" : edit_agency.toString();
    if (_tipeagensi == "Ya") {
      _value_agency_lengkap[0] = true;
      agency_value = "Ya";
      _val_agency_lengkap = 1;
    } else if (_tipeagensi == "Bukan") {
      _value_agency_lengkap[1] = true;
      agency_value = "Bukan";
      _val_agency_lengkap = 2;
    } else {
      _value_agency_lengkap[0] = true;
      agency_value = "Ya";
      _val_agency_lengkap = 1;
    }
  }

  void isiFormEdit_lengkap() {
    if (widget.xkarir != null) {
      //lengkap
      etnamaperusahaan_lengkap.text = edit_nama_perusahaan;
      etlowongandibuka_lengkap.text = edit_lowongan;
      etpersyaratan_lengkap.text = edit_persyaratan;
      etdeskripsi_lengkap.text = edit_keterangan;
      etalamatsuratlamaran_lengkap.text = edit_alamat;
      etkategorilulusan_lengkap.text = edit_pendidikan;
      _tglmulai_lengkap = edit_dari.toString();
      _tglpenutupan_lengkap = edit_hingga.toString();
      etseolink_lengkap.text = edit_seolink;
      etnamaperusahan_data_lengkap.text = edit_nama_perusahaan2;
      hintindustri = edit_bidang;
      etemail_data_lengkap.text = edit_email;
      ettelepon_data_lengkap.text = edit_notlp;
      etfax_data_lengkap.text = edit_nofax.toString();
      etwebsite_data_lengkap.text = edit_website;
      hintwilayah = edit_lokasi_kerja;
      hintprov = edit_provinsi;
      hintkabkota = edit_kota;
      hintkec = edit_kecamatan;
      hintdesa = edit_desa;
      etalamat_data_lengkap.text = edit_alamat;
      etkodepos_data_lengkap.text = edit_kodepos;
      etnamalengkap_pj_lengkap.text = edit_cpnama;
      etjabatan_pj_lengkap.text = edit_cpjabatan;
      etemail_pj_lengkap.text = edit_cpemail;
      etnotlpn_pj_lengkap.text = edit_cpnotlp;

      hasil_captcha.text = "0";

      _logoPerusahaan_lengkap = edit_gambar.toString();
    }
  }

  //FORM_GAMBAR

  void isiFormEdit_gambar() {
    etnamapemberikerja_gambar.text = edit_nama_perusahaan;
    _tglmulai_gambar = edit_dari;
    _tglpenutupan_gambar = edit_hingga;
    etkatakunci_gambar.text = edit_kata_kunci;
    etseolink_gambar.text = edit_seolink;
    etnamalengkap_pj_gambar.text = edit_cpnama;
    etjabatan_pj_gambar.text = edit_cpjabatan;
    etemail_pj_gambar.text = edit_cpemail;
    etnotlpn_pj_gambar.text = edit_cpnotlp;
  }

  //FORM_SINGKAT

  void isiFormEdit_singkat() {
    etnamaperusahaan_singkat.text = edit_nama_perusahaan;
    _tglmulai_singkat = edit_dari;
    _tglpenutupan_singkat = edit_hingga;
    etlowongandibuka_singkat.text = edit_lowongan;
    hintwilayah = edit_lokasi_kerja;
    etpersyaratan_singkat.text = edit_persyaratan;
    etalamat_singkat.text = edit_alamat;
    etseolink_singkat.text = edit_seolink;
    etnamalengkap_pj_singkat.text = edit_cpnama;
    etjabatan_pj_singkat.text = edit_cpjabatan;
    etemail_pj_singkat.text = edit_cpemail;
    etnotlpn_pj_singkat.text = edit_cpnotlp;
  }

  //FORM_SANGAT_SINGKAT

  void isiFormEdit_sangatsingkat() {
    etnamaperusahaan_sangat_singkat.text = edit_nama_perusahaan;
    _tglmulai_sangat_singkat = edit_dari;
    _tglpenutupan_sangat_singkat = edit_hingga;
    etseolink_sangat_singkat.text = edit_seolink;
    etdeskripsi_sangat_singkat.text = edit_keterangan;
    etnamalengkap_pj_sangat_singkat.text = edit_cpnama;
    etjabatan_pj_sangat_singkat.text = edit_cpjabatan;
    etemail_pj_sangat_singkat.text = edit_cpemail;
    etnotlpn_pj_sangat_singkat.text = edit_cpnotlp;
  }

  void isiFormEdit_pdf() {
    etseolink_pdf.text = edit_seolink;
    etuploadpdf_pdf.text = edit_pdf;
    etnamaperusahaan_pdf.text = edit_nama_perusahaan;
    _tglmulai_pdf = edit_dari;
    _tglpenutupan_pdf = edit_hingga;
    etkatakunci_pdf.text = edit_kata_kunci;
    etnamalengkap_pj_pdf.text = edit_cpnama;
    etjabatan_pj_pdf.text = edit_cpjabatan;
    etemail_pj_pdf.text = edit_cpemail;
    etnotlpn_pj_pdf.text = edit_cpnotlp;
  }

  //func check

  void check_lengkap() {
    // if (_formKey.currentState.validate()) {
    int pertambahan = captcha_satu + captcha_dua;
    String hasil_captcha2 = hasil_captcha.text.toString();
    print("pertambahan${pertambahan.toString()}");
    print("pertambahan${hasil_captcha.text.toString()}");
    bool image_ada = edit_gambar != null ? true : false;

    print("Youyo: \n" +
        etnamaperusahaan_lengkap.text.toString() +
        ",\n" +
        etlowongandibuka_lengkap.text.toString() +
        ",\n" +
        etkategorilulusan_lengkap.text.toString() +
        ",\n" +
        etpersyaratan_lengkap.text.toString() +
        ",\n" +
        etdeskripsi_lengkap.text.toString() +
        ",\n" +
        etalamatsuratlamaran_lengkap.text.toString() +
        ",\n" +
        etseolink_lengkap.text.toString() +
        ",\n" +
        etemail_data_lengkap.text.toString() +
        ",\n" +
        etalamat_data_lengkap.text.toString() +
        ",\n" +
        etkodepos_data_lengkap.text.toString() +
        ",\n" +
        etnamalengkap_pj_lengkap.text.toString() +
        ",\n" +
        etemail_pj_lengkap.text.toString() +
        ",\n" +
        etnotlpn_pj_lengkap.text.toString() +
        ",\n" +
        etnamaperusahan_data_lengkap.text.toString() +
        ",\n" +
        ettelepon_data_lengkap.text.toString() +
        ",\n" +
        etfax_data_lengkap.text.toString() +
        ",\n" +
        etwebsite_data_lengkap.text.toString() +
        ",\n");

    if (hasil_captcha2 != "0") {
      if (hasil_captcha2 == pertambahan.toString()) {
        if (etnamaperusahaan_lengkap.text.toString().isEmpty ||
            etlowongandibuka_lengkap.text.toString().isEmpty ||
            etkategorilulusan_lengkap.text.toString().isEmpty ||
            etpersyaratan_lengkap.text.toString().isEmpty ||
            etdeskripsi_lengkap.text.toString().isEmpty ||
            etalamatsuratlamaran_lengkap.text.toString().isEmpty ||
            etseolink_lengkap.text.toString().isEmpty ||
            etemail_data_lengkap.text.toString().isEmpty ||
            etalamat_data_lengkap.text.toString().isEmpty ||
            etkodepos_data_lengkap.text.toString().isEmpty ||
            etnamalengkap_pj_lengkap.text.toString().isEmpty ||
            etemail_pj_lengkap.text.toString().isEmpty ||
            etnotlpn_pj_lengkap.text.toString().isEmpty ||
            etnamaperusahan_data_lengkap.text.toString().isEmpty ||
            ettelepon_data_lengkap.text.toString().isEmpty ||
            etfax_data_lengkap.text.toString().isEmpty ||
            etwebsite_data_lengkap.text.toString().isEmpty) {
          setState(() {
            _loading = false;
          });
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
          if (image_ada == true || logo_lengkap_save != null) {
            // lengkap

            String _email_edit = "", _cid_edit = "";
            if (widget.xkarir != null) {
              setState(() {
                _email_edit = edit_cpemail;
                _cid_edit = edit_cid;
              });
            }

            KarirViewModel()
                .simpan_postin_loker(
              _email_edit,
              _cid_edit,
              tipe_lowongan_value.toString(),
              etnamaperusahaan_lengkap.text.toString(),
              etlowongandibuka_lengkap.text.toString(),
              hintwilayah.toString(),
              etdeskripsi_lengkap.text.toString(),
              etpersyaratan_lengkap.text.toString(),
              etalamatsuratlamaran_lengkap.text.toString(),
              etkategorilulusan_lengkap.text.toString(),
              _tglmulai_lengkap.toString(),
              _tglpenutupan_lengkap.toString(),
              etseolink_lengkap.text.toString(),
              logo_lengkap_save,
              skala_value.toString(),
              agency_value.toString(),
              etnamaperusahan_data_lengkap.text.toString(),
              hintindustri.toString(),
              etemail_data_lengkap.text.toString(),
              ettelepon_data_lengkap.text.toString(),
              etfax_data_lengkap.text.toString(),
              etwebsite_data_lengkap.text.toString(),
              hintprov.toString() == null ? "" : hintprov.toString(),
              hintkabkota.toString() == null ? "" : hintkabkota.toString(),
              hintkec.toString() == null ? "" : hintkec.toString(),
              hintdesa.toString() == null ? "" : hintdesa.toString(),
              etalamat_data_lengkap.text.toString(),
              etkodepos_data_lengkap.text.toString(),
              etnamalengkap_pj_lengkap.text.toString(),
              etjabatan_pj_lengkap.text.toString(),
              etemail_pj_lengkap.text.toString(),
              etnotlpn_pj_lengkap.text.toString(),
              "",
              "",
              "lengkap",
              edit_cid == "" ? "" : edit_cid,
              context,
            )
                .then((value) {//handled
              print("tell_me_what_happen: " + value.toString());
               StatusResponseKarirModel data = value;

            setState(() {
              _loading = false;

              data.listdata.password;
              data.listdata.codereff;
              data.listdata.email;
              data.listdata.userbaru;

              print("data_lenk: " + data.listdata.password);
              print("data_lenk: " + data.listdata.codereff);
              print("data_lenk: " + data.listdata.email);
              print("data_lenk: " + data.listdata.userbaru);
              print("data_lenk: " + data.listdata.nama);
            });

            print("tell_me_what happen: " + value.toString());

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (KarirEndPosting(
                          email: globalEmail.toString() == null
                              ? ""
                              : globalEmail.toString(),
                          keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString(),

                          password_temp :    data.listdata.password.toString() == null
                              ? ""
                              :  data.listdata.password.toString() ,
                          codereff_temp :  data.listdata.codereff.toString() == null
                              ? ""
                              : data.listdata.codereff.toString() ,
                          email_temp :    data.listdata.email.toString() == null
                              ? ""
                              : data.listdata.email.toString() ,
                          userbaru_temp : data.listdata.userbaru.toString() == null
                              ? ""
                              : data.listdata.userbaru.toString(),
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
            }).catchError((erro){
              _loading = false;
              onErrHandling(erro);
            });
          } else {
            setState(() {
              _loading = false;
            });
            Flushbar(
              title: "Maaf !!",
              message: "Mohon isi Logo",
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
        }
      } else {
        setState(() {
          _loading = false;
        });
        Flushbar(
          title: "Maaf !!",
          message: "CAPTCHA Anda Salah",
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
    } else {
      setState(() {
        _loading = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "Mohon isi CAPTCHA",
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

    // }
  }

  void check_singkat() {
    int pertambahan = captcha_satu + captcha_dua;
    String hasil_captcha2 = hasil_captcha_singkat.text.toString();
    print("pertambahan${pertambahan.toString()}");
    print("pertambahan${hasil_captcha_singkat.text.toString()}");

    if (hasil_captcha2 != "0") {
      if (hasil_captcha2 == pertambahan.toString()) {
        if (etnamaperusahaan_singkat.text.toString().isEmpty ||
            etlowongandibuka_singkat.text.toString().isEmpty ||
            etpersyaratan_singkat.text.toString().isEmpty ||
            etalamat_singkat.text.toString().isEmpty ||
            etseolink_singkat.text.toString().isEmpty ||
            etnamalengkap_pj_singkat.text.toString().isEmpty ||
            etjabatan_pj_singkat.text.toString().isEmpty ||
            etemail_pj_singkat.text.toString().isEmpty ||
            etnotlpn_pj_singkat.text.toString().isEmpty) {
          setState(() {
            _loading = false;
          });
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
          // lengkap

          KarirViewModel()
              .simpan_postin_loker_singkat(
            edit_cpemail == "" ? "" : edit_cpemail,
            edit_cid == "" ? "" : edit_cid,
            "",
            etnamaperusahaan_singkat.text.toString(),
            etlowongandibuka_singkat.text.toString(),
            hintwilayah.toString(),
            "",
            etpersyaratan_singkat.text.toString(),
            etalamat_singkat.text.toString(),
            "",
            _tglmulai_singkat.toString(),
            _tglpenutupan_singkat.toString(),
            etseolink_singkat.text.toString(),
            logo_lengkap_save, //abaikan
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            etnamalengkap_pj_singkat.text.toString(),
            etjabatan_pj_singkat.text.toString(),
            etemail_pj_singkat.text.toString(),
            etnotlpn_pj_singkat.text.toString(),
            "",
            "",
            "singkat",
            edit_cid == "" ? "" : edit_cid,
            context,
          )
              .then((value) {//handled
            print("tell_me_what_happen: " + value.toString());
                StatusResponseKarirModel data = value;

            setState(() {
              _loading = false;

              data.listdata.password;
              data.listdata.codereff;
              data.listdata.email;
              data.listdata.userbaru;

              print("data" + data.listdata.password);
              print("data" + data.listdata.codereff);
              print("data" + data.listdata.email);
              print("data" + data.listdata.userbaru);
              print("data" + data.listdata.nama);
            });


            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (KarirEndPosting(
                          email: globalEmail.toString() == null
                              ? ""
                              : globalEmail.toString(),
                          keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString(),

                          password_temp :    data.listdata.password.toString() == null
                              ? ""
                              :  data.listdata.password.toString() ,
                          codereff_temp :  data.listdata.codereff.toString() == null
                              ? ""
                              : data.listdata.codereff.toString() ,
                          email_temp :    data.listdata.email.toString() == null
                              ? ""
                              : data.listdata.email.toString() ,
                          userbaru_temp : data.listdata.userbaru.toString() == null
                              ? ""
                              : data.listdata.userbaru.toString(),
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
          }).catchError((erro){
            _loading = false;
            onErrHandling(erro);
          });
        }
      } else {
        setState(() {
          _loading = false;
        });
        Flushbar(
          title: "Maaf !!",
          message: "CAPTCHA Anda Salah",
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
    } else {
      setState(() {
        _loading = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "Mohon isi CAPTCHA",
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

  void check_sangat_singkat() {
    int pertambahan = captcha_satu + captcha_dua;
    int hasil_captcha2 =
        int.parse(hasil_captcha_sangat_singkat.text.toString());
    // print("pertambahan${pertambahan.toString()}");
    // print("pertambahan${hasil_captcha2.toString()}");
    if (hasil_captcha2 == pertambahan) {
      if (etnamaperusahaan_sangat_singkat.text.toString().isEmpty ||
          etdeskripsi_sangat_singkat.text.toString().isEmpty ||
          etseolink_sangat_singkat.text.toString().isEmpty ||
          etnamalengkap_pj_sangat_singkat.text.toString().isEmpty ||
          etjabatan_pj_sangat_singkat.text.toString().isEmpty ||
          etemail_pj_sangat_singkat.text.toString().isEmpty ||
          etnotlpn_pj_sangat_singkat.text.toString().isEmpty) {
        setState(() {
          _loading = false;
        });
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
        // lengkap

        KarirViewModel()
            .simpan_postin_loker_sangat_singkat(
          edit_cpemail == "" ? "" : edit_cpemail,
          edit_cid == "" ? "" : edit_cid,
          "",
          etnamaperusahaan_sangat_singkat.text.toString(),
          "",
          "",
          etdeskripsi_sangat_singkat.text.toString(),
          "",
          etalamat_sangat_singkat.text.toString(),
          "",
          _tglmulai_sangat_singkat.toString(),
          _tglpenutupan_sangat_singkat.toString(),
          etseolink_sangat_singkat.text.toString(),
          logo_lengkap_save, //abaikan
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          etnamalengkap_pj_sangat_singkat.text.toString(),
          etjabatan_pj_sangat_singkat.text.toString(),
          etemail_pj_sangat_singkat.text.toString(),
          etnotlpn_pj_sangat_singkat.text.toString(),
          "",
          "",
          "sangat-singkat",
          edit_cid == "" ? "" : edit_cid,
          context,
        )
            .then((value) {//handled
          if (value == 200) {
            StatusResponseKarirModel data = value;

            setState(() {
              _loading = false;

              data.listdata.password;
              data.listdata.codereff;
              data.listdata.email;
              data.listdata.userbaru;

              print("data" + data.listdata.password);
              print("data" + data.listdata.codereff);
              print("data" + data.listdata.email);
              print("data" + data.listdata.userbaru);
              print("data" + data.listdata.nama);
            });


            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (KarirEndPosting(
                          email: globalEmail.toString() == null
                              ? ""
                              : globalEmail.toString(),
                          keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString(),

                          password_temp :    data.listdata.password.toString() == null
                              ? ""
                              :  data.listdata.password.toString() ,
                          codereff_temp :  data.listdata.codereff.toString() == null
                              ? ""
                              : data.listdata.codereff.toString() ,
                          email_temp :    data.listdata.email.toString() == null
                              ? ""
                              : data.listdata.email.toString() ,
                          userbaru_temp : data.listdata.userbaru.toString() == null
                              ? ""
                              : data.listdata.userbaru.toString(),
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
          }
        }).catchError((erro){
          _loading = false;
          onErrHandling(erro);
        });
      }
    } else {
      setState(() {
        _loading = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "CAPTCHA Anda Salah",
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

  void check_gambar() {
    //  jobgambar1_save,
    //     jobgambar2_save, //abaikan
    //     jobgambar3_save,
    //print("jobgambar1_save" + jobgambar1_save);
    int pertambahan = captcha_satu + captcha_dua;
    int hasil_captcha2 = int.parse(hasil_captcha_gambar.text.toString());
    // print("pertambahan${pertambahan.toString()}");
    // print("pertambahan${hasil_captcha2.toString()}");
    if (hasil_captcha2 == pertambahan) {
      if (etnamapemberikerja_gambar.text.toString().isEmpty ||
          etkatakunci_gambar.text.toString().isEmpty ||
          //etalamat_gambar.text.toString().isEmpty ||
          etseolink_gambar.text.toString().isEmpty ||
          etnamalengkap_pj_gambar.text.toString().isEmpty ||
          etjabatan_pj_gambar.text.toString().isEmpty ||
          etnotlpn_pj_gambar.text.toString().isEmpty ||
          etemail_pj_gambar.text.toString().isEmpty ||
          jobgambar1_save == null ||
          jobgambar1_save == "null") {
        setState(() {
          _loading = false;
        });
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
        // lengkap

        KarirViewModel()
            .simpan_postin_loker_gambar(
          edit_cpemail == "" ? "" : edit_cpemail,
          edit_cid == "" ? "" : edit_cid,
          "",
          etnamapemberikerja_gambar.text.toString(),
          "",
          "",
          "",
          "",
          "",
          "",
          _tglmulai_gambar.toString(),
          _tglpenutupan_gambar.toString(),
          etseolink_gambar.text.toString(),
          jobgambar1_save,
          jobgambar2_save, //abaikan
          jobgambar3_save,
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          etnamalengkap_pj_gambar.text.toString(),
          etjabatan_pj_gambar.text.toString(),
          etemail_pj_gambar.text.toString(),
          etnotlpn_pj_gambar.text.toString(),
          "",
          "",
          "gambar",
          edit_cid == "" ? "" : edit_cid,
          etkatakunci_gambar.text.toString(),
          context,
        )
            .then((value) {//handled
          StatusResponseKarirModel data = value;

            setState(() {
              _loading = false;

              data.listdata.password;
              data.listdata.codereff;
              data.listdata.email;
              data.listdata.userbaru;

              print("data" + data.listdata.password);
              print("data" + data.listdata.codereff);
              print("data" + data.listdata.email);
              print("data" + data.listdata.userbaru);
              print("data" + data.listdata.nama);
            });


            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (KarirEndPosting(
                          email: globalEmail.toString() == null
                              ? ""
                              : globalEmail.toString(),
                          keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString(),

                          password_temp :    data.listdata.password.toString() == null
                              ? ""
                              :  data.listdata.password.toString() ,
                          codereff_temp :  data.listdata.codereff.toString() == null
                              ? ""
                              : data.listdata.codereff.toString() ,
                          email_temp :    data.listdata.email.toString() == null
                              ? ""
                              : data.listdata.email.toString() ,
                          userbaru_temp : data.listdata.userbaru.toString() == null
                              ? ""
                              : data.listdata.userbaru.toString(),
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
        }).catchError((erro){
          _loading = false;
          onErrHandling(erro);
        });
      }
    } else {
      setState(() {
        _loading = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "CAPTCHA Anda Salah",
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

  void check_pdf() {
    int pertambahan = captcha_satu + captcha_dua;
    int hasil_captcha2 = int.parse(hasil_captcha_pdf.text.toString());
    // print("pertambahan${pertambahan.toString()}");
    // print("pertambahan${hasil_captcha2.toString()}");
    if (hasil_captcha2 == pertambahan) {
      if (etnamaperusahaan_pdf.text.toString().isEmpty ||
          etkatakunci_pdf.text.toString().isEmpty ||
          etalamat_pdf.text.toString().isEmpty ||
          etseolink_pdf.text.toString().isEmpty ||
          etnamalengkap_pj_pdf.text.toString().isEmpty ||
          etjabatan_pj_pdf.text.toString().isEmpty ||
          etemail_pj_pdf.text.toString().isEmpty ||
          etnotlpn_pj_pdf.text.toString().isEmpty ||
          pdf_save == null ||
          pdf_save == "null") {
        setState(() {
          _loading = false;
        });
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
        // lengkap

        KarirViewModel()
            .simpan_postin_loker_pdf(
          edit_cpemail == "" ? "" : edit_cpemail,
          edit_cid == "" ? "" : edit_cid,
          "",
          etnamaperusahaan_pdf.text.toString(),
          "",
          "",
          "",
          "",
          etalamat_pdf.text.toString(),
          "",
          _tglmulai_pdf.toString(),
          _tglpenutupan_pdf.toString(),
          etseolink_pdf.text.toString(),
          pdf_save,
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          etnamalengkap_pj_pdf.text.toString(),
          etjabatan_pj_pdf.text.toString(),
          etemail_pj_pdf.text.toString(),
          etnotlpn_pj_pdf.text.toString(),
          "",
          "",
          "pdf",
          edit_cid == "" ? "" : edit_cid,
          etkatakunci_pdf.text.toString(),
          context,
        )
            .then((value) {//handled
          StatusResponseKarirModel data = value;

            setState(() {
              _loading = false;

              data.listdata.password;
              data.listdata.codereff;
              data.listdata.email;
              data.listdata.userbaru;

              print("data" + data.listdata.password);
              print("data" + data.listdata.codereff);
              print("data" + data.listdata.email);
              print("data" + data.listdata.userbaru);
              print("data" + data.listdata.nama);
            });

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (KarirEndPosting(
                          email: globalEmail.toString() == null
                              ? ""
                              : globalEmail.toString(),
                          keycode: globalkey.toString() == null
                              ? ""
                              : globalkey.toString(),

                          password_temp :    data.listdata.password.toString() == null
                              ? ""
                              :  data.listdata.password.toString() ,
                          codereff_temp :  data.listdata.codereff.toString() == null
                              ? ""
                              : data.listdata.codereff.toString() ,
                          email_temp :    data.listdata.email.toString() == null
                              ? ""
                              : data.listdata.email.toString() ,
                          userbaru_temp : data.listdata.userbaru.toString() == null
                              ? ""
                              : data.listdata.userbaru.toString(),
                              
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
        }).catchError((erro){
          _loading = false;
          onErrHandling(erro);
        });
      }
    } else {
      setState(() {
        _loading = false;
      });
      Flushbar(
        title: "Maaf !!",
        message: "CAPTCHA Anda Salah",
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

  @override
  Widget build(BuildContext context) {
    getPilihan(context);
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        title: Text("Pasang Iklan Lowongan Kerja",
            style: whiteFontStyle.copyWith(fontSize: 14)),
        backgroundColor: mainColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue[50],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text:
                            'Untuk membantu masyarakat, seluruh iklan lowongan kerja ',
                        style: blueFontStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' GRATIS',
                            style: blackFontStyle2.copyWith(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Silakan mengisi form di bawah ini, terima kasih.',
                    style: blackFontStyle1.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: mainColor1, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Silakan pilih template form lowongan yang tersedia sesuai dengan kebutuhan, diantaranya :",
                    style: blueFontStyle,
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: _listTemplateTitle.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Text(
                                  _listTemplateTitle[index],
                                  style: blackFontStyle1Bold.copyWith(
                                      fontSize: 12),
                                ),
                              );
                            }),
                      ),
                      EduButton(
                          buttonText: "Pilih Template",
                          onPressed: () {
                            bottomModal(context);
                          })
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 24, color: Colors.grey),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Template Terpilih",
                style: blueFontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(child: widgetFormHolder),
          ],
        ),
      ),
    );
  }

  Future bottomModal(BuildContext context) async {
    final result = await showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return MemilihForm();
        });
    setState(() {
      print("okok: " + result.toString());
      formTerpilih = result.toString();
      getPilihan(context);
    });
  }

  void _loadingClose() {
    Future.delayed(const Duration(seconds: 6), () {
      if (_loading){
        setState(() {
          _loading = false;
        });
      }
    });
  }
}

class MemilihForm extends StatefulWidget {
  @override
  MemilihFormState createState() => MemilihFormState();
}

class MemilihFormState extends State<MemilihForm> {
  var pilihan;
  Widget widgetHolder;

  void initState() {
    widgetHolder = satuWidget();
    super.initState();
  }

  Widget satuWidget() {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage("assets/previewlengkap.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget duaWidget() {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage("assets/previewsingkat.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget tigaWidget() {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage("assets/previewsangatsingkat.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget empatWidget() {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage("assets/previewimage.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget limaWidget() {
    return Container(
      child: Center(
        child: Image(
          image: AssetImage("assets/previewpdf.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  List<String> _options = [
    'Lengkap',
    'Singkat',
    'Sangat Singkat',
    'Hanya Gamabar',
    'Hanya PDF'
  ];
  List<String> _selectedItem = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(16),
                child: Icon(
                  Icons.cancel_outlined,
                  color: mainColor1,
                ),
              ),
            ),
          ),
          ChoiseCumb(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: EduButton(
              buttonText: "Gunakan Template",
              onPressed: () {
                //FormTerpilih(terpilih: "singkat");
                Navigator.pop(context, pilihan);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ChoiseCumb() {
    return Column(
      children: [
        Container(
          height: 48,
          child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomRadioButton(
                    width: 140,
                    enableShape: true,
                    elevation: 1,
                    padding: 0,
                    spacing: 0.0,
                    autoWidth: false,
                    enableButtonWrap: true,
                    wrapAlignment: WrapAlignment.start,
                    horizontal: false,
                    absoluteZeroSpacing: false,
                    unSelectedColor: whiteColor,
                    buttonLables: _options,
                    buttonValues: _selectedItem,
                    defaultSelected: '1',
                    radioButtonValue: (value) {
                      setState(() {
                        if (value == '1') {
                          widgetHolder = satuWidget();
                          pilihan = "lengkap";
                        } else if (value == '2') {
                          widgetHolder = duaWidget();
                          pilihan = "singkat";
                        } else if (value == '3') {
                          widgetHolder = tigaWidget();
                          pilihan = "sangat-singkat";
                        } else if (value == '4') {
                          widgetHolder = empatWidget();
                          pilihan = "gambar";
                        } else {
                          widgetHolder = limaWidget();
                          pilihan = "pdf";
                        }
                      });
                    },
                    buttonTextStyle: ButtonTextStyle(
                      selectedColor: Colors.white,
                      unSelectedColor: mainColor1,
                      textStyle: blackFontStyle3.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selectedColor: mainColor1,
                  ),
                );
              }),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: mainColor1, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height - 300,
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: widgetHolder,
          ),
        ),
      ],
    );
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

class ShowContentPDF extends StatelessWidget {
  final GestureTapCallback onTap;

  const ShowContentPDF({
    @required this.onTap,
  });

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
                      onTap: onTap,
                      leading: Icon(
                        Icons.collections_outlined,
                      ),
                      title: Text(
                        'Pilih File',
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
