part of 'widget_agensi.dart';

class FormulirMitraAgensi extends StatefulWidget {
  final String keycode;
  final CheckRekeningAgentModel rekinfo;
  final UsersDetailModel userInfo;
  final bool edit;

  FormulirMitraAgensi({
    this.keycode,
    this.rekinfo,
    this.userInfo,
    this.edit,
  });
  @override
  _FormulirMitraAgensiState createState() => _FormulirMitraAgensiState();
}

class _FormulirMitraAgensiState extends State<FormulirMitraAgensi> {
  TextEditingController etnama = new TextEditingController();
  TextEditingController etemail = new TextEditingController();
  TextEditingController etnohp = new TextEditingController();

  TextEditingController etnorek = new TextEditingController();
  TextEditingController etpemilikrek = new TextEditingController();

  var random_name_brek = 0;
  var InSignIn = false;

  var valbank;
  var hintbank;
  void modalBottomBank(context) async {
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentBankModal(bankList:listBank,);
        });
    setState(() {
      valbank = result[1].toString();
      hintbank = result[0].toString();
    });
  }

  File image_brek, image_brek_save; //ktp
  TextEditingController ctitleimage_brek = new TextEditingController();
  accessGallery() async {
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitleimage_brek.text;

    // Img.Image _image = Img.decodeImage(img.readAsBytesSync());
    // print("accessGalleryGedung: " + _image.toString());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg =
    //     new File("$path/image_${random_name_brek}${random_name_brek}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (img == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_brek = img;
    //     image_brek_save = compressImg;
    //     Navigator.pop(context);
    //   });
    // }
  }

  File image_brekgambar1, brekgambar1_save; //ktp
  TextEditingController ctitle_brekgambar1 = new TextEditingController();
  accessCamera() async {
    // File imgjob_gambar1 =
    //     await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;

    // final title = ctitle_brekgambar1.text;

    // Img.Image _image = Img.decodeImage(imgjob_gambar1.readAsBytesSync());
    // Img.Image _smallerimg = Img.copyResize(_image,
    //     width: 300, height: 300, interpolation: Img.Interpolation.linear);

    // var compressImg_job1 =
    //     new File("$path/image1_${random_name_brek}${random_name_brek}.jpg")
    //       ..writeAsBytesSync(Img.encodeJpg(_smallerimg, quality: 70));

    // if (imgjob_gambar1 == null) {
    //   print('null');
    // } else {
    //   setState(() {
    //     image_brekgambar1 = imgjob_gambar1;
    //     brekgambar1_save = compressImg_job1;
    //     Navigator.pop(context);
    //   });
    // }
  }

  @override
  initState() {
    super.initState();
    getbank();
    if(widget.edit){
      etnorek.text = widget.rekinfo.norekening;
      etpemilikrek.text = widget.rekinfo.namarekening;
      valbank = widget.rekinfo.kodebank;
      hintbank = widget.rekinfo.label_bank;
    }else if(widget.rekinfo!=null){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (AgensiMe(
                keycode: widget.keycode,
              ))));
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
          widget.edit ? 'Edit Rekening' : 'Join Mitra eduAgent',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //profil rekomend
            widget.edit
                ? Container()
                : Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Untuk menjadi mitra kami, dimohon untuk melengkapi data rekening",
                            style: blueFontStyleBold.copyWith(fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Harap pengisian nomor rekening jangan sampai salah !",
                            style: blackFontStyle1Bold.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profil Perekomendasi",
                    style: blackFontStyle1Bold.copyWith(fontSize: 14),
                  ),
                  Divider(height: 24, color: Colors.grey),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: "Nama ",
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
                      cursorColor: mainColor1,
                      controller: etnama,
                      validator: nameValidator,
                      enabled: false,
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
                        hintText: widget.userInfo.nama,
                      ),
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
                      cursorColor: mainColor1,
                      controller: etemail,
                      validator: emailValidator,
                      enabled: false,
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
                        hintText: widget.userInfo.email,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: "No. Handphone ",
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
                      cursorColor: mainColor1,
                      controller: etnohp,
                      validator: teleponValidator,
                      enabled: false,
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
                        hintText:
                            widget.userInfo.noHp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //rekening rekomendasi
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rekening Rekomendasi",
                    style: blackFontStyle1Bold.copyWith(fontSize: 14),
                  ),
                  Divider(height: 24, color: Colors.grey),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: "No Rekening ",
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
                      cursorColor: mainColor1,
                      controller: etnorek,
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
                        hintText: widget.edit
                            ? widget.rekinfo.norekening
                            : "No. Rekening",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: "Bank ",
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      onTap: () {
                        modalBottomBank(context);
                      },
                      // leading: Text("Provinsi",
                      //     style: blackFontStyle1.copyWith(fontSize: 16)),
                      leading: Text(
                        hintbank == null
                            ? 'Pilih Bank'
                            : hintbank,
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
                        text: "Nama Pemilik Rekening ",
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
                      cursorColor: mainColor1,
                      controller: etpemilikrek,
                      validator: teleponValidator,
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
                        hintText: widget.edit
                            ? widget.rekinfo.namarekening
                            : "Nama Pemilik Rekening",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        text: "Upload No Rekening pada Buku Rekening ",
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
                        showDialog(
                            context: context,
                            builder: (context) => ShowContent(
                                  onTap1: () {
                                    accessGallery();
                                  },
                                  onTap2: () {
                                    accessCamera();
                                  },
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 56,
                        width: 56,
                        child: Stack(
                          children: [
                            image_brek != null
                                ? Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 56,
                                    width: 56,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.file(
                                        image_brek,
                                        height: 56,
                                        width: 56,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Image(
                                    image: AssetImage("assets/uploadlogo.png"),
                                  ),
                            image_brek == null?
                            Center(
                              child: Container(
                                  height: 32, width: 32, color: Colors.white),
                            ):Container(),
                            image_brek != null
                                ? Container()
                                : Center(
                              child: Icon(
                                Icons.credit_card_outlined,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 48,
                      width: 250,
                      child: InSignIn
                          ? SpinKitFadingCircle(color: orenColor)
                          : widget.edit
                              ? EduButton(
                                  onPressed: () {
                                    InSignIn = true;
                                    handleRek(widget.keycode, 'edit', context);
                                  },
                                  buttonText: "Edit Rekening",
                                )
                              : EduButton(
                                  onPressed: () {
                                    handleRek(widget.keycode, 'new', context);
                                  },
                                  buttonText: "Join as Partner",
                                ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataBankModel> listBank;
  void getbank() async{
    try{
      final response = await http.get("https://dev-api.edunitas.com/mbank");
      setState(() {
        listBank = DataBankModel.parseList(json.decode(response.body));
      });
    }catch(e){
      print(e);
    }
  }

  void handleRek(keycode, cat, context) {
    bool image_ada = image_brek_save != null ? true : false;
    if (image_ada == true) {
      if (cat=='new'){
        Agentview_model()
            .newRekening(
            etnorek.text,
            valbank,
            etpemilikrek.text,
            image_brek_save,
            keycode,
            //widget.rekinfo.cid,
            //widget.rekinfo.ccid,
            context)
            .then((value) {
          if (value == 200) {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (AgensiMe(
                        keycode: widget.keycode,
                      ))));
            });
          }
        });
      }else{
        Agentview_model()
            .editRekening(
            etnorek.text,
            valbank,
            etpemilikrek.text,
            image_brek_save,
            keycode,
            widget.rekinfo.cid,
            widget.rekinfo.ccid,
            context)
            .then((value) {
          if (value == 200) {
            setState(() {
              Navigator.pop(context, 'edited');
            });
          }
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

class ContentBankModal extends StatefulWidget {
  List<DataBankModel> bankList;
  ContentBankModal({this.bankList});

  @override
  ContentBankModalState createState() => new ContentBankModalState();
}

class ContentBankModalState extends State<ContentBankModal> {
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
