part of 'karir.dart';

class KarirDetail extends StatefulWidget {
  final ListKarirModel xkarir;
  KarirDetail({this.xkarir});

  @override
  _KarirDetailState createState() => _KarirDetailState();
}

class _KarirDetailState extends State<KarirDetail> {
  String keterangan,
      persyaratan,
      lowongan,
      pendidikan,
      gaji,
      hingga,
      tentang,
      pdf,
      gambar,
      gambar1,
      gambar2,
      gambar3,
      gambar4,
      cid,
      lokasi_kerja;
  void getDetailKarir() {
    KarirViewModel().detailKarir(widget.xkarir.cid).then((value) {
      setState(() {
        DetailKarirModel data = value;
        keterangan = data.keterangan;
        persyaratan = data.persyaratan;
        lowongan = data.lowongan;
        pendidikan = data.pendidikan;
        gaji = data.gaji;
        hingga = data.hingga;
        lokasi_kerja = data.lokasiKerja;
        tentang = data.tentang;
        pdf = data.pdf;
        cid = data.cid;
        gambar = data.gambar;
        gambar1 = data.gambar1;
        gambar2 = data.gambar2;
        gambar3 = data.gambar3;
        gambar4 = data.gambar4;
        //munculvideo();
      });
    });
  }

  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus;
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
      });
    });
  }

  String varnama,
      varemail,
      vargenre,
      varalamat,
      vartgl_lahir,
      vartempat_lahir,
      varpendidikan,
      varnohp,
      varnowa,
      vargender,
      no_virtual,
      campus_me,
      prodi_me,
      logo_me,
      kelas_me,
      nosel,
      singkatan_me,
      kode_campus_me,
      foto_me;
  void datausers() {
    UserViewModel().users_detail(globalEmail.toString()).then((value) {
      UsersDetailModel data = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
          varnowa = data.noWa;
          vargender = data.genre;
          vartempat_lahir = data.tempatLahir;
          vartgl_lahir = data.tanggalLahir.toString();
          no_virtual = data.no_virtual;
          campus_me = data.campus;
          prodi_me = data.prodi;
          logo_me = data.logo;
          kelas_me = data.kelas;
          nosel = data.nosel;
          singkatan_me = data.singkatan;
          kode_campus_me = data.kodecampus;
          foto_me = data.foto;
        });
      }
    });
  }

  Widget _cekDetail() {
    if (widget.xkarir.jenisLowongan.toString() == 'lengkap') {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Persyaratan Melamar",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: persyaratan == null ? "" : persyaratan,
                    // padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    // customTextAlign: (dom.Node node) {
                    //   if (node is dom.Element) {
                    //     switch (node.localName) {
                    //       case "p":
                    //         return TextAlign.left;
                    //     }
                    //   }
                    //   return TextAlign.left;
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Detail Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jabatan / Posisi : ", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                lowongan == null ? "" : lowongan,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Untuk Lulusan", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                pendidikan == null ? "" : pendidikan,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lokasi Kerja", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                lokasi_kerja == null ? "" : lokasi_kerja,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Periode : ", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                hingga == null ? "" : hingga,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Info Perusahaan",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: tentang == null ? "" : tentang,
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else if (widget.xkarir.jenisLowongan.toString() == 'singkat') {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Persyaratan Melamar",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: persyaratan == null ? "" : persyaratan,
                    // padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    // customTextAlign: (dom.Node node) {
                    //   if (node is dom.Element) {
                    //     switch (node.localName) {
                    //       case "p":
                    //         return TextAlign.left;
                    //     }
                    //   }
                    //   return TextAlign.left;
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Detail Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jabatan / Posisi : ", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                lowongan == null ? "" : lowongan,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Untuk Lulusan", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                pendidikan == null ? "" : pendidikan,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lokasi Kerja", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                lokasi_kerja == null ? "" : lokasi_kerja,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Periode : ", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                hingga == null ? "" : hingga,
                                style: blueFontStyleBold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else if (widget.xkarir.jenisLowongan.toString() == 'sangat-singkat') {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Deskripsi Lowongan",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: persyaratan == null ? "" : persyaratan,
                    // padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    // customTextAlign: (dom.Node node) {
                    //   if (node is dom.Element) {
                    //     switch (node.localName) {
                    //       case "p":
                    //         return TextAlign.left;
                    //     }
                    //   }
                    //   return TextAlign.left;
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Detail Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Periode", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  hingga == null ? "" : hingga,
                                  style: blueFontStyleBold,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else if (widget.xkarir.jenisLowongan.toString() == 'pdf') {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Kata Kunci Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: keterangan == null ? "" : keterangan,
                    // padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    // customTextAlign: (dom.Node node) {
                    //   if (node is dom.Element) {
                    //     switch (node.localName) {
                    //       case "p":
                    //         return TextAlign.left;
                    //     }
                    //   }
                    //   return TextAlign.left;
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Lowongan Kerja PDF",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Periode", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  hingga == null ? "" : hingga,
                                  style: blueFontStyleBold,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // PDF.network(
                        //   widget.xkarir.pdf.toString(),
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 560,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else if (widget.xkarir.jenisLowongan.toString() == 'gambar') {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Kata Kunci Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: keterangan == null ? "" : keterangan,
                    // padding: EdgeInsets.all(8.0),
                    backgroundColor: Colors.white70,
                    defaultTextStyle: blackFontStyle3,
                    linkStyle: const TextStyle(
                      color: Colors.redAccent,
                    ),
                    // customTextAlign: (dom.Node node) {
                    //   if (node is dom.Element) {
                    //     switch (node.localName) {
                    //       case "p":
                    //         return TextAlign.left;
                    //     }
                    //   }
                    //   return TextAlign.left;
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Poster Lowongan Kerja",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Periode", style: blackFontStyle3),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  hingga == null ? "" : hingga,
                                  style: blueFontStyleBold,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: gambar1 == null
                              ? Container()
                              : Image.network(
                                  gambar1,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: gambar2 == null
                              ? Container()
                              : Image.network(
                                  gambar2,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: gambar2 == null
                              ? Container()
                              : Image.network(
                                  gambar3,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getDetailKarir();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    datausers();
    print("globalnama${varnama}");
    return Scaffold(
      backgroundColor: abuColor,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.xkarir.namaPerusahaan,
                style: whiteFontStyle.copyWith(fontSize: 16)),
            Text(
              widget.xkarir.lowongan,
              style: whiteFontStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: mainColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: yellowColor,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/warninginfo.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Penting !",
                            style: blackFontStyle2.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Berhati-hatilah terhadap iklan yang mengharuskan Anda mengeluarkan biaya untuk melamar atau memproses lamaran, atau yang terdengar terlalu muluk-muluk",
                          style: blackFontStyle1.copyWith(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //if else lengkap / singkat / sangat singkat / pdf / image
            _cekDetail(),

            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Cara Apply Lamaran",
                        style: blueFontStyleBold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: RichText(
                      text: TextSpan(
                        text:
                            'Lengkapi data diri anda di eduNitas dan kirimkan lamaran digital dengan tap tombol \n',
                        style: blackFontStyle3,
                        children: <TextSpan>[
                          TextSpan(
                              text: '"\"LAMAR SEKARANG\""',
                              style: blackFontStyle3.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.blue[100],
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Ayo tap lamar sekarang juga sebelum lamaran ditutup. Persiapkan CV terbaikmu !!!",
                  style: blueFontStyle,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 48,
                  child: EduButton(
                    onPressed: () {
                      globalkey == null
                          ? nonlogin(context)
                          : lamar(
                              context,
                              cid,
                              globalkey,
                              varnama,
                              vartempat_lahir,
                              vartgl_lahir,
                              varnohp,
                              varnowa,
                              varpendidikan,
                              vargender,
                              varalamat,
                              foto_me);
                    },
                    buttonText: 'Lamar Sekarang ',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void lamar(context, cid, globalkey, varnama, vartempat_lahir, vartgl_lahir,
    varnohp, varnowa, varpendidikan, vargender, varalamat, foto_me) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 290,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //color: Colors.red,
                height: 100,
                child: Image.asset(
                  "assets/dialog/dialogask2xhd.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 32,
                    child: Text(
                      'Lanjut Melamar ?',
                      style: blueFontStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Untuk menarik minat perusahaan, lengkapi profil anda terlebih dahulu',
                    style: blackFontStyle3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 32,
                      child: EduButtonSecond(
                        onPressed: () {
                          //  Navigator.of(context).pop();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (ListDatadiri(
                                        namalengkap:
                                            varnama == null ? "" : varnama,
                                        tempatlahir: vartempat_lahir == null
                                            ? ""
                                            : vartempat_lahir,
                                        tanggallahir: vartgl_lahir == null
                                            ? ""
                                            : vartgl_lahir,
                                        nohp: varnohp == null ? "" : varnohp,
                                        nowa: varnowa == null ? "" : varnowa,
                                        pendidikan: varpendidikan == null
                                            ? ""
                                            : varpendidikan,
                                        gender:
                                            vargender == null ? "" : vargender,
                                        alamat:
                                            varalamat == null ? "" : varalamat,
                                        foto_me: foto_me == null ? "" : foto_me,
                                        keycode: globalkey.toString() == null
                                            ? ""
                                            : globalkey.toString(),
                                      ))));
                        },
                        buttonText: "Lengkapi",
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 32,
                      child: EduButton(
                        onPressed: () {
                          simpan_karir(context, cid, globalkey);
                        },
                        buttonText: "Lanjut",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

void simpan_karir(context, cid, globalkey) {
  KarirViewModel()
      .simpan_karir(cid.toString(), globalkey.toString())
      .then((value) {
    StatusModel data = value;

    print("testes${data.status}");

    if (data.status == 200) {
      //Navigator.of(context).pushNamedAndRemoveUntil(ACTIVASI, (route) => false);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (KarirMain())));

      Flushbar(
        title: "Berhasil !!",
        message: "Anda Berhasil Melamar",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.green[600],
      )..show(context);

      // Navigator.pop(context);

    } else if (data.status == 500) {
      Flushbar(
        title: "Maaf !!",
        message: "Gagal",
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

      // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
    } else if (data.status == 400) {
      Flushbar(
        title: "Maaf !!",
        message: "Anda Sudah Pernah Melamarnya !!",
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
      // Toast.show(data.message, context, duration: 3, gravity: Toast.BOTTOM);
    } else {}
  });
}

void nonlogin(context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 270,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //color: Colors.red,
                height: 100,
                child: Image.asset(
                  "assets/dialog/dialogaskxhd.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 32,
                    child: Text(
                      'Mohon Maaf !',
                      style: blueFontStyle.copyWith(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Untuk lanjut melamar, anda perlu Login terlebih dahulu',
                    style: blackFontStyle3,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 32,
                      child: EduButtonSecond(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonText: "Batal",
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 32,
                      child: EduButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (Register())));
                        },
                        buttonText: "Register",
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 32,
                      child: EduButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => (Login()))),
                        buttonText: "Login",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
