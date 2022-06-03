part of 'widget_home.dart';

class MenuHome extends StatefulWidget {
  final String keycode;
  MenuHome({
    this.keycode,
  });

  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    //print("keycode${widget.keycode == "null" ? 'abc' : 'dfg'}");
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 4.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/home/edu-intro-campus.png'),
                    iconSize: 48,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (Home_detail(
                                key_enter: 1,
                              ))));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Cari Kampus",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/home/edu-intro-pendaftaran.jpg'),
                    iconSize: 48,
                    // onPressed: () => setState(() {
                    //   _launched = _launchInBrowser(
                    //       'https://edunitas.com/daftar/educampus#form-daftar');
                    // }),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (PendaftaranOnline(
                                // key_enter: 1,
                              ))));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Pendaftaran Online",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-minar.png'),
                      iconSize: 48,
                      onPressed: () => setState(() {
                        // _launched = _launchInBrowser(
                        //     'https://edunitas.com/educampus/partner');

                        widget.keycode == "null"
                            ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                (PartnerKampus_Main())))
                            : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (SingkronPartner(
                                    keycode: widget.keycode))));
                      }),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Partner Kampus",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-learning.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://kuliahonline.edunitas.com/'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Kuliah Online",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-agentlm.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://kuliahkaryawan.edunitas.com/'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Kuliah Karyawan",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/home/edu-intro-agent.png'),
                    iconSize: 48,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (MainAgensi())));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Agensi",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-career.png'),
                      iconSize: 48,
                      onPressed: () => setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (KarirMain())));
                      }),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Lowongan Kerja",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-beasiswa.jpg'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://edunitas.com/educampus/beasiswa'),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Permohonan Beasiswa",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                        icon: Image.asset('assets/home/edu-intro-donation.png'),
                        iconSize: 48,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainDonasi()));
                          //builder: (context) => BuktiBayarDonasi()));
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Pemberi Beasiswa",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-pas.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://edunitas.com/edupas'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Sistem Pembayaran",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/home/edu-intro-promotion.png'),
                    iconSize: 48,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (PromosiTab(
                                key_enter: 1,
                              ))));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Promosi",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/home/edu-intro-news.png'),
                    iconSize: 48,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (BeritatTab(
                                key_enter: 1,
                              ))));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Info",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-forum.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://edunitas.com/eduforum'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Forum",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-bimbel.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://wiki.edunitas.com/ind/114-10/Ensiklopedi-Dunia-Berbahasa-Indonesia_2317__wiki-edunitas.html'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Wiki eduNitas",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon:
                      Image.asset('assets/home/Icon eduNitas Baru-23.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://wiki.edunitas.com/q1a/114-10/Al-Quran-Online-Digital_home_2222221231_eduNitas.html'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Al-Quran Digital",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/home/edu-intro-library.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://wiki.edunitas.com/IT/114-10/Informatika-Komputer_1_eduNitas.html'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Manual\nBook",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 4.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon:
                      Image.asset('assets/home/Icon eduNitas Baru-22.png'),
                      iconSize: 48,
                      onPressed: () => showAlertToBrowser(context, 'https://wiki.edunitas.com/d3/114-10/Tes-Psikologi-Latihan-Soal_home-psikotes_1__eduNitas.html'),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Soal-Jawab Psikotes",
                      textAlign: TextAlign.center,
                      style: blueFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertToBrowser(BuildContext context, link) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Anda akan dialihkan ke aplikasi browser"),
          actions: [
            TextButton(child: Text('Cancel'), onPressed: (){Navigator.pop(context);},),
            TextButton(child: Text('Lanjutkan'), onPressed: () => setState(() {
              _launched = _launchInBrowser(
                  '$link');
            }),
            ),
          ],
        ));
  }
}
