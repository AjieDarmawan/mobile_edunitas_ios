part of 'widget_donasi.dart';

class BuktiBayarDonasi extends StatefulWidget {
  String trx_id, donaturname,metode;

  BuktiBayarDonasi({
    this.trx_id,
    this.donaturname,
    this.metode,
  });

  @override
  _BuktiBayarDonasiState createState() => _BuktiBayarDonasiState();
}

class _BuktiBayarDonasiState extends State<BuktiBayarDonasi> {
  TextEditingController nomor_rekening_cont = new TextEditingController();

  DateTime _dueDate = DateTime.now();
  String timeHourText = "Waktu Transaksi";
  String dateText = "Tanggal Transaksi";
  String fdateText = "";

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

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Upload Bukti Pembayaran',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //bank yang digunakan
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: RichText(
                  text: TextSpan(
                    text: "Bank yang digunakan saat membayar ",
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
                child: GestureDetector(
                  onTap: () {
                    bottomModal3(context);
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            bank_value,
                            style: blackFontStyle3.copyWith(fontSize: 14),
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
                height: 16,
              ),
              //nomer rekening
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: RichText(
                  text: TextSpan(
                    text: "Nomor rekening ",
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
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                    child: TextFormField(
                      cursorColor: mainColor1,
                      controller: nomor_rekening_cont,
                      validator: noZeroNumberValidator,
                      keyboardType: TextInputType.number,
                      //enabled: false,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        hintText: "Nomer Rekening",
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),
              //tanggal transaksi
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: RichText(
                  text: TextSpan(
                    text: "Tanggal transaksi ",
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
                child: GestureDetector(
                  onTap: () {
                    selectDueDate(context);
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            dateText,
                            style: blackFontStyle3.copyWith(fontSize: 14),
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
                height: 16,
              ),

              //waktu transaksi
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: RichText(
                  text: TextSpan(
                    text: "Waktu transaksi ",
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
                child: GestureDetector(
                  onTap: () {
                    _selectTime(context);
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            timeHourText,
                            style: blackFontStyle3.copyWith(fontSize: 14),
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
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: RichText(
                  text: TextSpan(
                    text: "Bukti transaksi (ukuran maksimal image 800 Kb)",
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
                child: Container(
                  child: imagefoto == null
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ShowContent(
                                      onTap1: () {
                                        accessGalleryAktivitas();
                                      },
                                      onTap2: () {
                                        accessCameraAktivitas();
                                      },
                                    ));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            height: 200,
                            width: 200,
                            child: Image(
                              image: AssetImage("assets/aktifitas.png"),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ShowContent(
                                      onTap1: () {
                                        accessGalleryAktivitas();
                                      },
                                      onTap2: () {
                                        accessCameraAktivitas();
                                      },
                                    ));
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.file(
                                  imagefoto,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),

              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Column(
                  children: [
                    EduButton(
                      buttonText: "Submit",
                      onPressed: () {
                        submit();
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    EduButtonSecond(
                      buttonText: "Kembali",
                      onPressed: () {
                        Navigator.of(context).pop;
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var bank_list = ["BCA", "BRI", "BSI"];
  var bank_list_value = ["014", "014", "014"];
  var bank_value = "Pilih Bank";
  var bank_value_s = "Pilih Bank";

  Future bottomModal3(BuildContext context) {
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
                    child: bank_list.length == 0
                        ? Center(
                            child: SpinKitThreeBounce(
                            color: Colors.white,
                          ))
                        : ListView.builder(
                            itemCount: bank_list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    bank_value = bank_list[index];
                                    bank_value_s = bank_list_value[index];
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(bank_list[index],
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                                style: whiteFontStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
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
              ],
            ),
          );
        });
  }

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
        dateText = "${picked.day}/${picked.month}/${picked.year}";
        fdateText = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  TimeOfDay timeText;
  _selectTime(BuildContext context) async {
    timeText = TimeOfDay.fromDateTime(_dueDate);
    final picked =
        await showTimePicker(context: context, initialTime: timeText);

    if (picked != null) {
      setState(() {
        timeText = picked;
        var _hour = picked.hour < 10 ? "0${picked.hour}" : "${picked.hour}";
        var _minutes =
            picked.minute < 10 ? "0${picked.minute}" : "${picked.minute}";
        timeHourText = "${_hour}:${_minutes}:00";
        //timeHourText = "${picked.hour.toString()}:${picked.minute.toString()}:00";
      });
    }
  }

  // ambil foto bukti
  File imagefoto, foto_save;
  TextEditingController ctitlefoto = new TextEditingController();
  accessCameraAktivitas() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitlefoto.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
    //   ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     imagefoto = img;
    //     foto_save = compressImg;
    //     Navigator.pop(context);
    //     //uploadLogo();

    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  accessGalleryAktivitas() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // print("accessGalleryAktivitas: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg = new File("$path/image_${globalkey}${globalkey}.jpg")
    //   ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     imagefoto = img;
    //     foto_save = compressImg;
    //     Navigator.pop(context);
    //     // uploadLogo();
    //     //  uploadimg();
    //     // uploadktp();
    //   });
    // }
  }

  final _formKey = GlobalKey<FormState>();
  void submit() {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save();

      if (nomor_rekening_cont.text.toString().isEmpty ||
          bank_value == "Pilih Bank" ||
          dateText == "Tanggal Transaksi" ||
          timeHourText == "Waktu Transaksi" ||
          foto_save == null ||
          foto_save == "null") {
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
            .sendBuktiBayar(
                widget.metode == null ? "trf" : widget.metode,
                bank_value_s,
                nomor_rekening_cont.text.toString(),
                fdateText,
                dateText,
                timeHourText,
                "put-data",
                "buktibayar",
                "list",
                globalkey,
                widget.donaturname,
                widget.trx_id,
                foto_save)
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
          } else {
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
