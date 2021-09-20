part of 'me_donasi.dart';

class MePostKabar extends StatefulWidget {
  //BeritatTab({Key key}) : super(key: key);
  final String keycode, cid;

  MePostKabar({this.keycode, this.cid});

  @override
  _MePostKabarState createState() => _MePostKabarState();
}

class _MePostKabarState extends State<MePostKabar> {
  TextEditingController sa_judul_kabar = new TextEditingController();
  TextEditingController du_ceritakan = new TextEditingController();

  bool _loading = false;

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
            'Posting Kabar Penerima Manfaat',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Judul Kabar
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: "Judul Kabar ",
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
                          controller: sa_judul_kabar,
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
                            hintText:
                                "co: Saat ini penerima manfaat sudah bisa lanjut kuliah",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Tanggal berapa kabar ini ?
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text: "Tanggal berapa kabar ini ? ",
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
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              selectDueDate(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                                      dateText,
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
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Ceritakan mengenai kabar penerima manfaat saat ini
                      Container(
                        child: RichText(
                          text: TextSpan(
                            text:
                                "Ceritakan mengenai kabar penerima manfaat saat ini ",
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
                          controller: du_ceritakan,
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
                            hintText:
                                "Deskripsikan mengenai kabar penerima manfaat disertai dengan ucapan terimakasih untuk para donatur",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //upload foto bukti
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
                          child: imagefoto == null
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ShowContent(
                                              onTap1: () {
                                                accessGalleryBukti();
                                              },
                                              onTap2: () {
                                                accessCameraBukti();
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
                                                accessGalleryBukti();
                                              },
                                              onTap2: () {
                                                accessCameraBukti();
                                              },
                                            ));
                                  },
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      height: 200,
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                        height: 20,
                      ),

                      Center(
                        child: _loading
                            ? SpinKitFadingCircle(color: orenColor,)
                            : EduButton(
                          buttonText: "Posting",
                          onPressed: () {
                            setState(() {
                              _loading = true;
                              submit();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]))));
  }

  DateTime _dueDate = DateTime.now();
  String dateText = "Tanggal Transaksi";
  String fdateText = "";

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

  // ambil foto Bukti
  File imagefoto, foto_save;
  accessCameraBukti() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    Img.Image _smallerimg = Img.copyResize(_image,
        width: 300, height: 300, interpolation: Img.Interpolation.linear);

    var compressImg =
        new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
          ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    if (img == null) {
      print('null');
    } else {
      setState(() {
        imagefoto = img;
        foto_save = compressImg;
        Navigator.pop(context);
        //uploadLogo();

        //  uploadimg();
        // uploadktp();
      });
    }
  }

  accessGalleryBukti() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    print("accessGalleryAktivitas: " + _image.toString());
    Img.Image _smallerimg = Img.copyResize(_image,
        width: 300, height: 300, interpolation: Img.Interpolation.linear);

    var compressImg =
        new File("$path/image_${widget.keycode}${widget.keycode}.jpg")
          ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    if (img == null) {
      print('null');
    } else {
      setState(() {
        imagefoto = img;
        foto_save = compressImg;
        Navigator.pop(context);
        // uploadLogo();
        //  uploadimg();
        // uploadktp();
      });
    }
  }

  //final _formKey = GlobalKey<FormState>();
  void submit() {
    if (sa_judul_kabar.text.toString().isEmpty ||
        du_ceritakan.text.toString().isEmpty ||
        fdateText == "" ||
        foto_save == null) {
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
    }
    else {
      Donasiview_model()
          .sendKabar(
          sa_judul_kabar.text.toString(),
          du_ceritakan.text.toString(),
          fdateText,
          widget.keycode,
          "post-data",
          "me",
          widget.cid,
          '',
          'kabar',
          foto_save)
          .then((value) {
        int datarespon = value;

        //String data = value;

        //if (data.response == 'OK') {
        if (datarespon == 200) {
          setState(() {
            _loading = false;
            Navigator.of(context).pop();
          });
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
        print('MePostKabar_err: ' + onErro);
        setState(() {
          _loading = false;
        });
      });
    }
  }
}
