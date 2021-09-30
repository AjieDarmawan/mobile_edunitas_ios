part of 'me_donasi.dart';

class DonasiDataCampaigner extends StatefulWidget {
  bool edit;
  String seolink;
  String keyCode;

  DonasiDataCampaigner({this.edit, this.seolink, this.keyCode});

  @override
  _DonasiDataCampaignerState createState() => _DonasiDataCampaignerState();
}

class _DonasiDataCampaignerState extends State<DonasiDataCampaigner> {
  TextEditingController nama_campaigner_cont = new TextEditingController();
  TextEditingController link_medsos_cont = new TextEditingController();
  TextEditingController cerita_diri_cont = new TextEditingController();

  TextEditingController sa_nama_penerima_cont = new TextEditingController();
  TextEditingController du_no_kontak_cont = new TextEditingController();
  TextEditingController ti_judul_penggalangan_cont =
      new TextEditingController();
  TextEditingController em_seo_link_cont = new TextEditingController();
  TextEditingController li_tujuan_penggalangan_cont =
      new TextEditingController();
  TextEditingController en_target_donasi_cont = new TextEditingController();
  TextEditingController tu_rincian_penggunaan_donasi_cont =
      new TextEditingController();
  TextEditingController de_ajakan_donasi_cont = new TextEditingController();

  TextEditingController cid_donasi_cont = new TextEditingController();
  TextEditingController nama_lembaga_cont = new TextEditingController();
  TextEditingController nomor_rekening_cont = new TextEditingController();
  TextEditingController nama_rekening_cont = new TextEditingController();

  var _kategori_galang_dana = ["Kuliah", "Sekolah"];
  var _mengapa = [
    "Daftar Sekolah/kuliah",
    "Putus Sekolah/kuliah",
    "Beasiswa",
    "Biaya Kurang",
    "Musibah",
    "Fasilitas Kurang",
    "Kesejahteraan"
  ];
  var _penerima = ["Diri Sendiri", "Keluarga", "Teman", "Yayasan"];
  var _rekening_tujuan = [
    "Rekening anda sendiri",
    "Rekening a.n penerima manfaat",
    "Rekening yayasan/Organisasi"
  ];
  var _rencana_penyaluran = [
    "Salurkan dan laporkan sendiri",
    "Bekerjasama dengan yayasan atau komunitas",
    "Belum tahu"
  ];
  var _bank_list_dummy = ["Mandiri", "BRI", "BSI"];

  var _val_kategori = "Pilih Kategori";
  var _val_mengapa = "Pilih Permasalahan";
  var _val_penerima = "Pilih Penerima Manfaat";
  var _val_atasnama = "personal";
  var _val_rektujuan = "Pilih rekening tujuan";
  var _val_renpenyaluran = "Pilih rencana penyaluran";
  var _val_bank = "Pilih bank";

  var _foto_ktp_edit;
  var _foto_g_edit;

  bool _valuecheck1 = false;
  bool _valuecheck2 = false;

  final _formKey = GlobalKey<FormState>();

  var globalkey = "";
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {
      //handled
      setState(() {
        globalkey = sessionManager.key;
        print("globalkey${globalkey}");
      });
    });
  }

  List<DataBankModel> listBank;
  void getbank() async {
    try {
      final response = await http.get(Uri.parse("https://dev-api.edunitas.com/mbank"));
      setState(() {
        listBank = DataBankModel.parseList(json.decode(response.body));
      });
    } catch (e) {
      print(e);
    }
  }

  FotoEditCampaignModel fotoFoto;

  void getfoto() {
    Donasiview_model().getFotoCampaign(widget.keyCode).then((value1) {
      //handled
      setState(() {
        fotoFoto = value1 == null ? null : value1;
        _foto_ktp_edit = fotoFoto.ktp;
        _foto_g_edit = fotoFoto.pict;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  var _stillhandling = false;
  void onErrHandling(erro) {
    print("do_home_err: " + erro.toString());
    var _error_val_cather = erro.toString().substring(0, 49);
    if (_stillhandling == false) {
      setState(() {
        _stillhandling = true;
      });
      if (_error_val_cather.contains("SocketException")) {
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
                  _stillhandling = false;
                  getdonasidetail();
                  getfoto();
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  DonasiDetailModel dataEdit;
  void getdonasidetail() {
    Donasiview_model().getDetail(widget.seolink.toString()).then((value1) {
      //handled
      setState(() {
        dataEdit = value1 == null ? null : value1;
        nama_campaigner_cont.text = dataEdit.nama.toString();
        link_medsos_cont.text = dataEdit.medsos.toString();
        cerita_diri_cont.text = dataEdit.cerita.toString();
        sa_nama_penerima_cont.text = dataEdit.namapenerima.toString();
        du_no_kontak_cont.text = dataEdit.nowa.toString();
        ti_judul_penggalangan_cont.text = dataEdit.judul.toString();
        em_seo_link_cont.text = dataEdit.seolink.toString();
        li_tujuan_penggalangan_cont.text = dataEdit.permasalahan.toString();
        en_target_donasi_cont.text = dataEdit.target.toString();
        tu_rincian_penggunaan_donasi_cont.text = dataEdit.rincian.toString();
        cid_donasi_cont.text = dataEdit.cid.toString();
        nama_lembaga_cont.text = dataEdit.instansi_label.toString();
        nomor_rekening_cont.text = dataEdit.norek.toString();
        nama_rekening_cont.text = dataEdit.namarek.toString();
        de_ajakan_donasi_cont.text = dataEdit.ajakan.toString();

        _val_tanggal = dataEdit.crdt.toString().substring(0,10);
        _val_kategori = dataEdit.kategori.toString();
        _val_mengapa = dataEdit.permasalahan_label.toString();
        _val_atasnama =
            dataEdit.atasnama.toString() == "Personal" ? "personal" : "lembaga";
        _val_penerima = dataEdit.penerima.toString();
        _val_rektujuan = _rekening_tujuan[(int.parse(dataEdit.pencairan.toString()))-1];
        _val_renpenyaluran = _rencana_penyaluran[(int.parse(dataEdit.penyaluran.toString()))-1];

        _val_bank = dataEdit.bank.toString();

        var listf = listBank
            .where((u) => (u.code
            .toLowerCase()
            .contains(_val_bank.toLowerCase()))).toList();

        hintbank = listf[0].name;

        //_foto_ktp_edit = dataEdit.
      });
    }).catchError((erro) {
      setState(() {});
    });
  }

  DateTime _dateNow = DateTime.now();
  String _val_tanggal = "";
  selectDate(BuildContext content) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateNow,
      firstDate: DateTime(1955),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _dateNow = picked;
        _val_tanggal = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
    getbank();
    if (widget.edit) {
      getdonasidetail();
      getfoto();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            'Formulir Donasi',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 70),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Data Campaigner ",
                            style: blueFontStyle2Bold,
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
                        Divider(
                          thickness: 2,
                          height: 16,
                        ),

                        //nama campaigner
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Nama Campaigner ",
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
                            controller: nama_campaigner_cont,
                            validator: nameValidator,
                            keyboardType: TextInputType.name,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "Nama Lengkap",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //nama link medsos
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Link Media Sosial ( FB / Instagram ) ",
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
                            controller: link_medsos_cont,
                            validator: nameValidator,
                            keyboardType: TextInputType.name,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "Akun FB/@AkunInstagram",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //cerita diri
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Ceritakan tentang diri Anda ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: cerita_diri_cont,
                            keyboardType: TextInputType.text,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 25.0, top: 8.0),
                              hintText:
                                  "Profesi anda, Komunitas atau Forum, Aktivitasi sehari-hari",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //upload ktp
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Upload Foto KTP",
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
                          child: Container(
                            child: imagefoto_ktp != null
                                ? GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => ShowContent(
                                                onTap1: () {
                                                  //accessGalleryKtp();
                                                },
                                                onTap2: () {
                                                  //accessCameraKtp();
                                                },
                                              ));
                                    },
                                    child: Center(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 200,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            imagefoto_ktp,
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : widget.edit == true
                                    ? GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => ShowContent(
                                                    onTap1: () {
                                                      //accessGalleryKtp();
                                                    },
                                                    onTap2: () {
                                                      //accessCameraKtp();
                                                    },
                                                  ));
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 200,
                                          width: 200,
                                          child: (_foto_ktp_edit == null)
                                              ? Image(
                                                  image: AssetImage(
                                                      "assets/aktifitas.png"),
                                                )
                                              : Image.network(_foto_ktp_edit,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4),
                                                        height: 200,
                                                        width: 200,
                                                        child: Image(
                                                          image: AssetImage(
                                                              "assets/aktifitas.png"),
                                                        ),
                                                      )),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => ShowContent(
                                                    onTap1: () {
                                                      //accessGalleryKtp();
                                                    },
                                                    onTap2: () {
                                                      //accessCameraKtp();
                                                    },
                                                  ));
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 200,
                                          width: 200,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/aktifitas.png"),
                                          ),
                                        ),
                                      ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        RichText(
                          text: TextSpan(
                            text: "Penggalangan Dana ",
                            style: blueFontStyle2Bold,
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
                        Divider(
                          thickness: 2,
                          height: 16,
                        ),

                        //Kategori penggalangan dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Kategori penggalangan dana ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                              bottomModal(
                                  context, _kategori_galang_dana, "kategori");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_kategori,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Kenapa menggalang dana ?
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Kenapa menggalang dana ? ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                              bottomModal(context, _mengapa, "mengapa");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_mengapa,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Atas nama siapa Anda menggalang dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Atas nama siapa Anda menggalang dana ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CustomRadioButton(
                            width: 120,
                            enableShape: true,
                            elevation: 0,
                            padding: 5,
                            spacing: 0.0,
                            autoWidth: false,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.start,
                            horizontal: false,
                            absoluteZeroSpacing: false,
                            selectedColor: mainColor1,
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: ['Personal', 'Lembaga'].toList(),
                            buttonValues: ['personal', 'lembaga'].toList(),
                            defaultSelected: "personal",
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: mainColor1,
                                textStyle: whiteFontStyle),
                            radioButtonValue: (value) {
                              // _loadingView();
                              setState(() {
                                _val_atasnama = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Nama Instansi/Lembaga
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Nama Instansi/Lembaga ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: nama_lembaga_cont,
                            keyboardType: TextInputType.name,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "co: Nama Lembaga",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Siapa Penerima Manfaat ?
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Siapa Penerima Manfaat ? ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                              bottomModal(context, _penerima, "penerima");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_penerima,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //nama penerima
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Nama Penerima Manfaat ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: sa_nama_penerima_cont,
                            keyboardType: TextInputType.name,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "co: Nama Asli",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //no kontak penerima
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "No Kontak Penerima ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: du_no_kontak_cont,
                            keyboardType: TextInputType.number,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "co: Nomor yang dapat dihubungi",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Judul penggalangan dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Judul penggalangan dana ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: ti_judul_penggalangan_cont,
                            keyboardType: TextInputType.text,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "co: Nama Asli",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Shortlink galang dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Shortlink galang dana (tanpa spasi) ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                            controller: em_seo_link_cont,
                            keyboardType: TextInputType.text,
                            validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText:
                                  "co: bantu-aji-dapatkan-beasiswa-kuliah-di-unkris",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Ceritakan tujuan penggalangan dana Anda
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Ceritakan tujuan penggalangan dana Anda",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: li_tujuan_penggalangan_cont,
                            keyboardType: TextInputType.text,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText:
                                  "co: Siapa penerima manfaat? Kenapa membutuhkan dana bantuan? Apa hubungan Anda dengan penerima manfaat? dan lainnya ...",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Target Donasi yang dibutuhkan
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Target Donasi yang dibutuhkan",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                            controller: en_target_donasi_cont,
                            keyboardType: TextInputType.number,
                            validator: noZeroNumberValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "1000000",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Target waktu yang ditentukan
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Target waktu yang ditentukan ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                              selectDate(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_tanggal,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Perincian penggunaan dana donasi
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Perincian penggunaan dana donasi",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: tu_rincian_penggunaan_donasi_cont,
                            keyboardType: TextInputType.text,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText:
                                  "Harap memberikan perincian bagaimana dana tersebut akan dipergunakan ...",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Rekening tujuan pencairan dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Rekening tujuan pencairan dana ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
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
                              bottomModal(
                                  context, _rekening_tujuan, "rek_tujuan");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_rektujuan,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Rencana proses penyaluran dana
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Rencana proses penyaluran dana ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                              bottomModal(context, _rencana_penyaluran,
                                  "ren_penyaluran");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _val_renpenyaluran,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //bank
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Bank ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                              modalBottomBankCampaign(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      hintbank,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  //Flexible(child: Text(programstudilulusan, style: _styleText(2),)),
                                  Icon(
                                    Icons.navigate_next,
                                    color: mainColor1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Nomor rekening
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Nomor rekening ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: nomor_rekening_cont,
                            validator: nameValidator,
                            keyboardType: TextInputType.number,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "Nomor rekening",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Nama Rekening
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Nama Rekening ",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: nama_rekening_cont,
                            validator: nameValidator,
                            keyboardType: TextInputType.name,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText: "Nama rekening",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Tulis ajakan singkat untuk berdonasi
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Tulis ajakan singkat untuk berdonasi",
                              style: blueFontStyleBold,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '',
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
                            controller: de_ajakan_donasi_cont,
                            keyboardType: TextInputType.text,
                            //validator: nameValidator,
                            //enabled: false,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              hintText:
                                  "Ayo bersama-sama kita bisa saling bahu membahu melewati masa pandemi ini. Bantu apapun itu akan berdampak besar bagi yang membutuhkan di luar sana.",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //upload ktp
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "Lampirkan foto yang mencerminkan penggalangan dana. Pastikan foto terlihat dengan jelas.",
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
                          child: Container(
                            child: imagefoto_g != null
                                ? GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => ShowContent(
                                                onTap1: () {
                                                  //accessGalleryG();
                                                },
                                                onTap2: () {
                                                  //accessCameraG();
                                                },
                                              ));
                                    },
                                    child: Center(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        height: 200,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            imagefoto_g,
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : widget.edit == true
                                    ? GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => ShowContent(
                                                    onTap1: () {
                                                      //accessGalleryG();
                                                    },
                                                    onTap2: () {
                                                      //accessCameraG();
                                                    },
                                                  ));
                                        },
                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4),
                                            height: 200,
                                            width: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: (_foto_g_edit == null)
                                                  ? Image(
                                                image: AssetImage(
                                                    "assets/aktifitas.png"),
                                              )
                                                  : Image.network(_foto_g_edit,
                                                  errorBuilder: (context, error,
                                                      stackTrace) =>
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                            vertical: 4),
                                                        height: 200,
                                                        width: 200,
                                                        child: Image(
                                                          image: AssetImage(
                                                              "assets/aktifitas.png"),
                                                        ),
                                                      )),
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => ShowContent(
                                                    onTap1: () {
                                                      //accessGalleryG();
                                                    },
                                                    onTap2: () {
                                                      //accessCameraG();
                                                    },
                                                  ));
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 4),
                                          height: 200,
                                          width: 200,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/aktifitas.png"),
                                          ),
                                        ),
                                      ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //upload ktp
                        CheckboxListTile(
                          title: Text(
                            "Dengan klik Setuju Anda menjamin kebenaran dari informasi yang diberikan dan menyetujui untuk mematuhi segala ketentuan kami. Kami berhak untuk memberikan keputusan terkait penggalangan Anda dan Kami berhak membatalkan penggalangan Anda jika ditemukan adanya penyalahgunaan",
                            style: blueFontStyle,
                          ),
                          value: _valuecheck1,
                          onChanged: (bool value) {
                            setState(() {
                              _valuecheck1 = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Kesuksesan galang dana sangat ditentukan oleh keaktifan dalam menyebarkan halaman galang dananya. diharapkan untuk aktif menyebarkan link melalui jalur pribadi.",
                            style: blueFontStyle,
                          ),
                          value: _valuecheck2,
                          onChanged: (bool value) {
                            setState(() {
                              _valuecheck2 = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        EduButton(
                          buttonText: "Post Campaign",
                          buttonColor: _valuecheck1==true&&_valuecheck2==true?yellowColor:abuColor,
                          onPressed: () {
                            if(_valuecheck1==true&&_valuecheck2==true){
                              submit();
                            }
                          },
                        ),
                      ]),
                ),
              ),
            ],
          ),
        )));
  }

  // ambil foto ktp
  File imagefoto_ktp, foto_save_ktp;
  TextEditingController ctitlefoto = new TextEditingController();
  // accessCameraKtp() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitlefoto.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
  //     ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefoto_ktp = img;
  //       foto_save_ktp = compressImg;
  //       Navigator.pop(context);
  //       //uploadLogo();
  //
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }
  //
  // accessGalleryKtp() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   print("accessGalleryAktivitas: " + _image.toString());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
  //     ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefoto_ktp = img;
  //       foto_save_ktp = compressImg;
  //       Navigator.pop(context);
  //       // uploadLogo();
  //       //  uploadimg();
  //       // uploadktp();
  //     });
  //   }
  // }

  // ambil foto galangan
  File imagefoto_g, foto_save_g;
  TextEditingController ctitlefoto_g = new TextEditingController();
  // accessCameraG() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.camera);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   final title = ctitlefoto_g.text;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
  //     ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefoto_g = img;
  //       foto_save_g = compressImg;
  //       Navigator.pop(context);
  //     });
  //   }
  // }
  //
  // accessGalleryG() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //
  //   Img.Image _image = Img.decodeImage(img.readAsBytesSync());
  //   print("accessGalleryAktivitas: " + _image.toString());
  //   Img.Image _smallerimg = Img.copyResize(_image,
  //       width: 300, height: 300, interpolation: Img.Interpolation.linear);
  //
  //   var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
  //     ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));
  //
  //   if (img == null) {
  //     print('null');
  //   } else {
  //     setState(() {
  //       imagefoto_g = img;
  //       foto_save_g = compressImg;
  //       Navigator.pop(context);
  //     });
  //   }
  // }

  void submit() {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save();

      if (nama_campaigner_cont.text.toString().isEmpty ||
          link_medsos_cont.text.toString().isEmpty ||
          cerita_diri_cont.text.toString().isEmpty ||
          sa_nama_penerima_cont.text.toString().isEmpty ||
          du_no_kontak_cont.text.toString().isEmpty ||
          ti_judul_penggalangan_cont.text.toString().isEmpty ||
          em_seo_link_cont.text.toString().isEmpty ||
          link_medsos_cont.text.toString().isEmpty ||
          en_target_donasi_cont.text.toString().isEmpty ||
          tu_rincian_penggunaan_donasi_cont.text.toString().isEmpty ||
          de_ajakan_donasi_cont.text.toString().isEmpty) {
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
        Donasiview_model()
            .postGalangDana(
                // formdata_donnama: Daniyal Test Daftar
                nama_campaigner_cont.text.toString(),
                // formdata_donmedsos: danilo~@danilo
                link_medsos_cont.text.toString(),
                // formdata_dondesk: Profesi gamers Profesi gamers Profesi gamers Profesi gamers Profesi gamers Profesi gamers
                cerita_diri_cont.text.toString(),
                // formdata_donimgktp: (binary)
                foto_save_ktp,
                // formdata_donkategori: educampus
                _val_kategori,
                // formdata_donpermasalahan: putus
                _val_mengapa,
                // formdata_doninstansi: Lembaga testing
                nama_lembaga_cont.text.toString(),
                // formdata_donatasnama: Personal
                _val_atasnama,
                // formdata_donchampaigner: Daniyal Test Daftar
                nama_campaigner_cont.text.toString(),
                // formdata_donimgnpwp: (binary)
                null,
                // formdata_donpenerima: dirisendiri
                _val_penerima,
                // formdata_donhubpenerima: dirisendiri
                _val_penerima,
                // formdata_donnamapenerima: Daniyal Test Daftar
                sa_nama_penerima_cont.text.toString(),
                // formdata_donidpenerima: 081210297831
                du_no_kontak_cont.text.toString(),
                // formdata_donjudul: bantu testing kuliah
                ti_judul_penggalangan_cont.text.toString(),
                // formdata_donseolink: bantu-tetsing-kuliah
                em_seo_link_cont.text.toString(),
                // formdata_doncerita: bantu-tetsing-kuliahbantu-tetsing-kuliahbantu-tetsing-kuliahbantu-tetsing-kuliahbantu-tetsing-kuliahbantu-tetsing-kuliahbantu-tetsing-kuliah
                li_tujuan_penggalangan_cont.text.toString(),
                // formdata_dontarget: 2000000
                en_target_donasi_cont.text.toString(),
                // formdata_donhingga: 2021-09-11
                _val_tanggal,
                // formdata_donrincian: bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah
                tu_rincian_penggunaan_donasi_cont.text.toString(),
                // formdata_donpencairan: 1
                _val_rektujuan == "Rekening anda sendiri"
                    ? "1"
                    : _val_rektujuan == "Rekening a.n penerima manfaat"
                        ? "2"
                        : "3",
                // formdata_donpenyaluran: 1
                _val_renpenyaluran == "Salurkan dan laporkan sendiri"
                    ? "1"
                    : _val_renpenyaluran ==
                            "Bekerjasama dengan yayasan atau komunitas"
                        ? "2"
                        : "3",
                // formdata_donbank: 002
                _val_bank,
                // formdata_donnorek: 12121212121
                nomor_rekening_cont.text.toString(),
                // formdata_donnamarek: Danilo
                nama_rekening_cont.text.toString(),
                // formdata_donajakan: bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah bantu-tetsing-kuliah
                de_ajakan_donasi_cont.text.toString(),
                // formdata_donimgchampaign: (binary)
                foto_save_g,
                // formdata_apikey: 421fb8edf19461b0eb375da1c4f58332717d0f95
                widget.keyCode,
                // setdata_mod: put-data
                widget.edit==true?"put-data":"post-data",
                // formdata_origin: me
                "me",
                // formdata_seolink: bantu-tetsing-kuliah
                em_seo_link_cont.text.toString(),
                // formdata_cid: en6f25431ce85700114fab11f6c337d2a3c1c21596
                cid_donasi_cont.text.toString(),
                // formdata_putlist: donation
                "donation")
            .then((value) {
          int datarespon = value;

          //String data = value;

          //if (data.response == 'OK') {
          if (datarespon == 200) {
            Flushbar(
              title: "Berhasil",
              message: "Bukti Berhasil Dikirim",
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

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => (Navigation_bottom())));
          }
          else {
            Flushbar(
              title: "Maaf",
              message: "Donasi gagal dikirim",
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
        }).catchError((onErro) {
          print('donasisi: ' + onErro);
        });
      }
    }
  }

  Future bottomModal(BuildContext context, datanya, cat) {
    return showModalBottomSheet(
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
                      child: datanya.length == 0
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: datanya.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (cat == "kategori") {
                                        _val_kategori = datanya[index];
                                      } else if (cat == "mengapa") {
                                        _val_mengapa = datanya[index];
                                      } else if (cat == "penerima") {
                                        _val_penerima = datanya[index];
                                      } else if (cat == "rek_tujuan") {
                                        _val_rektujuan = datanya[index];
                                      } else if (cat == "ren_penyaluran") {
                                        _val_renpenyaluran = datanya[index];
                                      } else if (cat == "bank") {
                                        _val_bank = datanya[index];
                                      }
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 24, top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: Text("${datanya[index]}",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    style:
                                                        whiteFontStyle.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                          ],
                                        ),
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
                            )),
                ),
              ],
            ),
          );
        });
  }

  var hintbank = "Pilih Bank";
  void modalBottomBankCampaign(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentBankModalGalangDana(
            bankList: listBank,
          );
        });
    setState(() {
      _val_bank = result[1].toString();
      hintbank = result[0].toString();
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

class ContentBankModalGalangDana extends StatefulWidget {
  List<DataBankModel> bankList;
  ContentBankModalGalangDana({this.bankList});

  @override
  ContentBankModalGalangDanaState createState() =>
      new ContentBankModalGalangDanaState();
}

class ContentBankModalGalangDanaState
    extends State<ContentBankModalGalangDana> {
  TextEditingController etbank = new TextEditingController();

  //List<MasterDaerahModel> dataListwilayah = [];
  //List bankListDummy = ["Mandiri", "BCA"];

  List<DataBankModel> tempBank = [];
  List<DataBankModel> ftempBank = [];
  List<String> result = ["", ""];

  int lenght = 0;

  @override
  initState() {
    super.initState();
    // fdataListwilayah = widget.datalist;
    // dataListwilayah = widget.datalist;
    // lenght = fdataListwilayah.length;

    tempBank = widget.bankList;
    ftempBank = widget.bankList;
    lenght = widget.bankList.length;
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
                controller: etbank,
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
                    hintText: "Cari bank"),
                onChanged: (string) {
                  setState(() {
                    ftempBank = tempBank
                        .where((u) => (u.name
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                    lenght = ftempBank.length;
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
                          final fdata = ftempBank[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                //print("valpos: "+lastDataSipema.id.toString()+"&&"+lastDataSipema.nama);
                                //valposisi = lastDataSipema.id;
                                //hintposisi = lastDataSipema.nama;
                                result[0] = fdata.name.toString();
                                result[1] = fdata.code.toString();
                                Navigator.pop(context, result);
                              });
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 24, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(fdata.name,
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
