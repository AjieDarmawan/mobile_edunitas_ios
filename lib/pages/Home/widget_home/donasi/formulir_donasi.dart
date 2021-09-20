part of 'widget_donasi.dart';

class FormulirDonasi extends StatefulWidget {
  final String cid;
  FormulirDonasi({
    this.cid,
  });
  @override
  _FormulirDonasiState createState() => _FormulirDonasiState();
}

class _FormulirDonasiState extends State<FormulirDonasi> {
  bool _anonim;
  TextEditingController nama_donatur_cont = new TextEditingController();
  TextEditingController email_donatur_cont = new TextEditingController();
  TextEditingController notlp_donatur_cont = new TextEditingController();
  TextEditingController nowa_donatur_cont = new TextEditingController();
  TextEditingController nominal_donatur_cont = new TextEditingController();
  TextEditingController doa_donatur_cont = new TextEditingController();

  List<String> bank_e = [
    "Bank BCA",
    "Bank BRI",
    "Bank BSI",
    "Bank Mandiri",
    "Virtual Account Bank BNI",
  ];
  List<String> logoImage = [
    'https://edunitas.com/assets/edu-img/channel/bca.png',
    'https://edunitas.com/assets/edu-img/channel/bri.png',
    'https://edunitas.com/assets/edu-img/channel/bsi.png',
    'https://edunitas.com/assets/edu-img/channel/mandiri.png',
    'https://edunitas.com/assets/edu-img/channel/bni.png'
  ];
  List<String> bank_ekode = ["bca", "bri", "bsm", "mandiri", "bni"];
  String med_bank_dipilih;
  int index_terpilih;

  @override
  void initState() {
    super.initState();
    _anonim = false;
    med_bank_dipilih = "BCA";
    index_terpilih = 0;

    nominal_donatur_cont.addListener(() {
      //here you have the changes of your textfield

      //use setState to rebuild the widget
      setState(() {
        print("value: ${nominal_donatur_cont.text}");
      });
    });
  }

  var InSignIn = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backwardsCompatibility: false,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.light,
      //     statusBarColor: Colors.transparent,
      //   ),
      //   backgroundColor: mainColor1,
      //   title: Text(
      //     'Formulir Donasi',
      //     style: whiteFontStyle,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            automaticallyImplyLeading: false,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: mainColor1,
            expandedHeight: 90.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Formulir Donasi',
                style: whiteFontStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 70),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sedikit bantuan dari kamu sangat berarti bagi mereka",
                    style: blackFontStyle3,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    child: Row(
                      children: [
                        Text(
                          "Donasi Mulai Donasi: ",
                          style: blueFontStyle,
                        ),
                        Text(
                          "Rp. 10.000",
                          style: blueFontStyle.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 24, thickness: 1),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //nama donatur
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Nama Donatur ",
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
                                controller: nama_donatur_cont,
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
                                  hintText: "Nama Lengkap",
                                ),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                title: Text(
                                  'Sembunyikan nama saya (Anonim)',
                                  style: blackFontStyle1.copyWith(fontSize: 12),
                                ),
                                value: _anonim,
                                onChanged: (bool value) {
                                  setState(() {
                                    _anonim = value;
                                  });
                                },
                              ),
                              // child: Row(
                              //   children: [
                              //     Text("Sembunyikan nama saya ( Anonim )", style: blackFontStyle4,),
                              //
                              //   ],
                              // ),
                            ),
                            SizedBox(height: 10),

                            //email
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Email ",
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
                                controller: email_donatur_cont,
                                validator: emailValidator,
                                keyboardType: TextInputType.emailAddress,
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
                                  hintText: "Email",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            //no tlp
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Nomer Telepon ",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 9,
                                  child: Center(
                                    child: Text(
                                      "+62",
                                      style: blueFontStyleBold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: TextFormField(
                                      cursorColor: mainColor1,
                                      controller: notlp_donatur_cont,
                                      validator: teleponValidator,
                                      keyboardType: TextInputType.phone,
                                      //enabled: false,
                                      decoration: new InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        // focusedBorder: InputBorder.none,
                                        // enabledBorder: InputBorder.none,
                                        // errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        hintText: "Nomer telepon",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            // //no wasap
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Nomer Whatsapp ",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 9,
                                  child: Center(
                                    child: Text(
                                      "+62",
                                      style: blueFontStyleBold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: TextFormField(
                                      cursorColor: mainColor1,
                                      controller: nowa_donatur_cont,
                                      validator: teleponValidator,
                                      keyboardType: TextInputType.phone,
                                      //enabled: false,
                                      decoration: new InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        // focusedBorder: InputBorder.none,
                                        // enabledBorder: InputBorder.none,
                                        // errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        hintText: "Nomer Whatsapp",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            //no nominal
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "Nominal (ketik untuk menulis nominal lain) ",
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
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    child: Center(
                                      child: Text(
                                        "Rp. ",
                                        style: blueFontStyleBold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    child: TextFormField(
                                      cursorColor: mainColor1,
                                      controller: nominal_donatur_cont,
                                      validator: noZeroNumberValidator,
                                      keyboardType: TextInputType.number,
                                      //enabled: false,
                                      decoration: new InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        // focusedBorder: InputBorder.none,
                                        // enabledBorder: InputBorder.none,
                                        // errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        hintText: "",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),

                            //doa
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Tulis pesan semangat dan Doa ",
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
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                cursorColor: mainColor1,
                                controller: doa_donatur_cont,
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
                                  hintText:
                                      "Semoga bisa membantu dan bermanfaat",
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            //media transfer
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: "Pilih Media Pembayaran Donasi ",
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
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        index_terpilih = index;
                                        med_bank_dipilih = bank_ekode[index];
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: index_terpilih == index
                                                ? mainColor1.withOpacity(0.2)
                                                : Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    child: Text(
                                                      bank_e[index],
                                                      style: whiteFontStyle.copyWith(
                                                          fontSize: 14,
                                                          color:
                                                              index_terpilih ==
                                                                      index
                                                                  ? mainColor1
                                                                  : Colors
                                                                      .black87),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(4.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white,
                                                  ),
                                                  child: Image.network(
                                                    logoImage[index],
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                  width: 64,
                                                )
                                                // Flexible(
                                                //   child: Container(
                                                //     child: Text(
                                                //       "Transfer Bank " + bank_e[index],
                                                //       style: whiteFontStyle.copyWith(
                                                //           fontSize: 14,
                                                //           color: index_terpilih == index
                                                //               ? Colors.white
                                                //               : mainColor1),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),

                                            // Text(
                                            //     "Hallo Sipema Angsur${datSipemaByIndex.itembayar.itembayar}"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16.0),

                            //total
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: mainColor1, width: 2),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: blackFontStyle3,
                                        ),
                                        Text(
                                          "Rp.${nominal_donatur_cont.text}",
                                          style: blueFontStyleBold,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
      bottomSheet: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 3.0)
            ],
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 64, vertical: 14),
            child: InSignIn
                ? SpinKitFadingCircle(color: orenColor)
                : EduButton(
                    buttonText: "Lanjutkan",
                    textColor: mainColor1,
                    onPressed: () {
                      kirim_donasi();
                    },
                  ),
          )),
    );
  }

  void kirim_donasi() {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save();

      if (nama_donatur_cont.text.toString().isEmpty ||
          email_donatur_cont.text.toString().isEmpty ||
          notlp_donatur_cont.text.toString().isEmpty ||
          nowa_donatur_cont.text.toString().isEmpty ||
          nominal_donatur_cont.text.toString().isEmpty ||
          doa_donatur_cont.text.toString().isEmpty) {
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
            .sendDonasi(
                nama_donatur_cont.text.toString(),
                _anonim == false ? '0' : '1',
                email_donatur_cont.text.toString(),
                notlp_donatur_cont.text.toString(),
                nowa_donatur_cont.text.toString(),
                nominal_donatur_cont.text.toString(),
                doa_donatur_cont.text.toString(),
                med_bank_dipilih.toString() == "bni" ? "va" : 'trf',
                med_bank_dipilih.toString(),
                email_donatur_cont.text.toString(),
                'post-data',
                'list',
                widget.cid.toString(),
                'donaturna')
            .then((value) {
          DonasiKirimModel datarespon = value;

          //String data = value;

          //if (data.response == 'OK') {
          if (datarespon.donaturname.length != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (InvoiceDonasi(
                          trx_id: datarespon.trxId.toString() == null
                              ? ""
                              : datarespon.trxId.toString(),
                          nopembayaran:
                              datarespon.nopembayaran.toString() == null
                                  ? ""
                                  : datarespon.nopembayaran.toString(),
                          donaturname: datarespon.donaturname.toString() == null
                              ? ""
                              : datarespon.donaturname.toString(),
                          isanonim: datarespon.isanonim.toString() == null
                              ? ""
                              : datarespon.isanonim.toString(),
                          nowa: datarespon.nowa.toString() == null
                              ? ""
                              : datarespon.nowa.toString(),
                          notlp: datarespon.notlp.toString() == null
                              ? ""
                              : datarespon.notlp.toString(),
                          nominal: datarespon.nominal.toString() == null
                              ? ""
                              : datarespon.nominal.toString(),
                          champaigner: datarespon.champaigner.toString() == null
                              ? ""
                              : datarespon.champaigner.toString(),
                          judul: datarespon.judul.toString() == null
                              ? ""
                              : datarespon.judul.toString(),
                          seolink: datarespon.seolink.toString() == null
                              ? ""
                              : datarespon.seolink.toString(),
                          novirtual_bni:
                              datarespon.novirtualBni.toString() == null
                                  ? ""
                                  : datarespon.novirtualBni.toString(),
                          channel: datarespon.channel.toString() == null
                              ? ""
                              : datarespon.channel.toString(),
                          method: med_bank_dipilih.toString() == "bni"
                              ? "va"
                              : 'trf',
                          label_an: datarespon.labelAn.toString() == null
                              ? ""
                              : datarespon.labelAn.toString(),
                          label_rek: datarespon.labelRek.toString() == null
                              ? ""
                              : datarespon.labelRek.toString(),
                          label_bank: datarespon.labelBank.toString() == null
                              ? ""
                              : datarespon.labelBank.toString(),
                          loopitem: datarespon.loopitem.toString() == null
                              ? ""
                              : datarespon.loopitem.toString(),
                          nominaltrf: datarespon.nominaltrf.toString() == null
                              ? ""
                              : datarespon.nominaltrf.toString(),
                        ))));
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
