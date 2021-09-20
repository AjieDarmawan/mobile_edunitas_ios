part of 'me_donasi.dart';

class PencairanDanaDonasi extends StatefulWidget {
  final String keycode, seolink;

  PencairanDanaDonasi({this.keycode, this.seolink});

  @override
  _PencairanDanaDonasiState createState() => _PencairanDanaDonasiState();
}

class _PencairanDanaDonasiState extends State<PencairanDanaDonasi> {
  TextEditingController sa_nominal_pencairan = new TextEditingController();
  // TextEditingController du_nama_bank = new TextEditingController();
  // TextEditingController ti_nomor_rekening = new TextEditingController();
  // TextEditingController em_nama_rekening = new TextEditingController();
  TextEditingController li_dana_untuk = new TextEditingController();

  bool check_biaya_tiga_persen = false;

  final loading = false;

  DonasiDetailModel datadonasi;
  String _cid = "", _mbank = "", _norek, _namarek = "";
  void getdonasidetail() {
    Donasiview_model().getDetail(widget.seolink).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
        _cid = datadonasi.cid;
        _mbank = datadonasi.bank;
        _namarek = datadonasi.namarek;
        _norek = datadonasi.norek;
      });
    }).catchError((erro) {
      setState(() {});
    });
  }

  var du_nama_bank, ti_nomor_rekening, em_nama_rekening;
  @override
  void initState() {
    super.initState();
    getdonasidetail();
    du_nama_bank = TextEditingController(text: _mbank);
    ti_nomor_rekening = TextEditingController(text: _norek);
    em_nama_rekening = TextEditingController(text: _namarek);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Formulir Pencairan Dana',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Nominal Pencairan
              Container(
                child: RichText(
                  text: TextSpan(
                    text:
                        "Nominal Pencairan Dana (Ketik untuk tulis nominal lain) ",
                    style: blueFontStyleBold,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  cursorColor: mainColor1,
                  controller: sa_nominal_pencairan,
                  validator: noZeroNumberValidator,
                  keyboardType: TextInputType.number,
                  //enabled: false,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: "Pencairan min 50rb max 60jt",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Nama Bank Pencairan
              Container(
                child: RichText(
                  text: TextSpan(
                    text: "Nama Bank Pencairan ",
                    style: blueFontStyleBold,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  enabled: false,
                  cursorColor: mainColor1,
                  controller: du_nama_bank,
                  // validator: nameValidator,
                  keyboardType: TextInputType.name,
                  //enabled: false,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: _mbank == null ? "tes" : _mbank.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Nomor rekening Pencairan
              Container(
                child: RichText(
                  text: TextSpan(
                    text: "Nomor rekening Pencairan ",
                    style: blueFontStyleBold,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  enabled: false,
                  cursorColor: mainColor1,
                  controller: ti_nomor_rekening,
                  // validator: noZeroNumberValidator,
                  keyboardType: TextInputType.number,
                  //enabled: false,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: _norek == null ? "" : _norek.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Nama Rekening Pencairan
              Container(
                child: RichText(
                  text: TextSpan(
                    text: "Nama Rekening Pencairan ",
                    style: blueFontStyleBold,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  enabled: false,
                  cursorColor: mainColor1,
                  controller: em_nama_rekening,
                  // validator: nameValidator,
                  keyboardType: TextInputType.name,
                  //enabled: false,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: _namarek == null ? "" : _namarek.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Dana akan digunakan untuk ?
              Container(
                child: RichText(
                  text: TextSpan(
                    text: "Dana akan digunakan untuk ? ",
                    style: blueFontStyleBold,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  cursorColor: mainColor1,
                  controller: li_dana_untuk,
                  validator: nameValidator,
                  keyboardType: TextInputType.text,
                  //enabled: false,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: " ",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //check biaya 3 persn
              CheckboxListTile(
                title: Text(
                  "Dengan Checklist Setuju Anda bersedia dikenakan biaya 3% untuk eduDonation",
                  style: blueFontStyle,
                ),
                value: check_biaya_tiga_persen,
                onChanged: (bool value) {
                  setState(() {
                    check_biaya_tiga_persen = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Mohon dokumentasikan penggunaan dana anda, dan upload pada menu posting kabar sebagai syarat untuk pencairan berikutnya.",
                  style: blueFontStyle.copyWith(color: Colors.redAccent),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Center(
                child: InSignIn
                    ? SpinKitFadingCircle(
                        color: orenColor,
                      )
                    : EduButton(
                        buttonText: "Simpan",
                        onPressed: () {
                          submit();
                        },
                      ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }

  var InSignIn = false;
  void submit() {
    setState(() {
      InSignIn = true;
    });

    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save();

      if (sa_nominal_pencairan.text.toString().isEmpty ||
          // du_nama_bank.text.toString().isEmpty ||
          // ti_nomor_rekening.text.toString().isEmpty ||
          // em_nama_rekening.text.toString().isEmpty ||
          li_dana_untuk.text.toString().isEmpty) {
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
            .pengajuanPencairanDana(
                sa_nominal_pencairan.text.toString(),
                _mbank.toString(),
                _norek.toString(),
                _namarek.toString(),
                li_dana_untuk.text.toString(),
                'on',
                widget.keycode,
                'post-data',
                'me',
                _cid.toString(), //todo cid
                'pencairan')
            .then((value) {
          StatusModel statusCode = value;

          //String data = value;

          //if (data.response == 'OK') {
          if (statusCode.status == 200) {
            setState(() {
              InSignIn = false;
            });

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (Navigation_bottom())));
          } else if (statusCode.status == 402) {
            setState(() {
              InSignIn = false;
            });
            Flushbar(
              title: "Maaf",
              message: statusCode.message,
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
              var InSignIn = false;
            });
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
          print('PencairanDanaDonasi_send_err: ' + onErro);
        });
      }
    }
  }
}
