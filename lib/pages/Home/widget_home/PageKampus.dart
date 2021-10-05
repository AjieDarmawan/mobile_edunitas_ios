part of 'widget_home.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 4.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class PageKampus extends StatefulWidget {
  @override
  _PageKampusState createState() => _PageKampusState();
}

class _PageKampusState extends State<PageKampus> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  List<Widget> _pages = <Widget>[
    //1

    Pages1(),

    //2

    Pages2(),

    //3

    Pages3(),

    //4

    Pages4(),

    //5

    Pages5()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _controller,
          itemCount: _pages.length,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
        ),
        new Positioned(
          bottom: 0.0,
          left: 0.0,
          child: new Container(
            height: 24,
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
            child: new Center(
              child: new DotsIndicator(
                controller: _controller,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: _kDuration,
                    curve: _kCurve,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Pages1 extends StatefulWidget {
  Pages1({Key key}) : super(key: key);
  @override
  _Pages1State createState() => _Pages1State();
}

class _Pages1State extends State<Pages1> {
  // Future<void> _launched;
  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

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

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pilihpartner.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[900], Colors.blue])),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 48),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingin Kampus Anda Maju & Ramai Mahasiswanya?",
                      style: blueFontStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Kampus Anda akan di Promosikan dan di Marketingkan secara luas (GRATIS).",
                      style: blackFontStyle1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    globalkey == null
                        ? Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            alignment: Alignment.center,
                            child: EduButton(
                              onPressed: () => setState(() {
                                // _launched = _launchInBrowser(
                                //     'https://edunitas.com/educampus/partner');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (PartnerKampus_Main())));
                              }),
                              buttonText: "Join as Partner",
                            ))
                        : Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            alignment: Alignment.center,
                            child: EduButton(
                              onPressed: () => setState(() {
                                // _launched = _launchInBrowser(
                                //     'https://edunitas.com/educampus/partner');

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (SingkronPartner())));
                              }),
                              buttonText: "Join as Partner",
                            ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pages2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pilihkampus.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange[900], Colors.orange])),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 48),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Temukan Kampus Favorit !",
                      style: blueFontStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Sudah menentukan kampus pilihanmu ?\nAyo Daftar Sekarang !",
                      style: blackFontStyle1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        alignment: Alignment.center,
                        child: EduButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (Home_detail(
                                          key_enter: 1,
                                        ))));
                          },
                          buttonText: "Cari Kampus",
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pages3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pilihagen.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.indigo[900], Colors.indigo])),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 48),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pengen punya penghasilan tambahan ?",
                      style: blueFontStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Segera bergabunglah menjadi mitra Agensi Edunitas",
                      style: blackFontStyle1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        alignment: Alignment.center,
                        child: EduButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (MainAgensi())));
                          },
                          buttonText: "Selengkapnya",
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pages4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pilihpromo.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red[900], Colors.red[400]])),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 48),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dapatkan banyak pilihan Promo !",
                      style: blueFontStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Dapatkan banyak promosi dari Merchant kami. Segera cek, sebelum kehabisan !!!",
                      style: blackFontStyle1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        alignment: Alignment.center,
                        child: EduButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (PromosiTab(
                                          key_enter: 1,
                                        ))));
                          },
                          buttonText: "Dapatkan !",
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pages5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pilihkarir.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey[900], Colors.blueGrey[400]])),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 48),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cari SDM atau Pegawai sesuai kualifikasi yang diinginkan ?",
                      style: blueFontStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Ayo bergabung menjadi Partner Karir dan dapatkan banyak sekali keuntungannya",
                      style: blackFontStyle1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        alignment: Alignment.center,
                        child: EduButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (PartnerKarirMain())));
                          },
                          buttonText: "Join as Partner !",
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
