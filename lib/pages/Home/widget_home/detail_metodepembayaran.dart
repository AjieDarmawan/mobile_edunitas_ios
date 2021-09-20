part of 'widget_home.dart';

class DetailMetodePemabyaran extends StatefulWidget {
  final String cara, kelompok, no_virtual;

  DetailMetodePemabyaran({this.cara, this.kelompok, this.no_virtual});

  @override
  _DetailMetodePemabyaranState createState() => _DetailMetodePemabyaranState();
}

class _DetailMetodePemabyaranState extends State<DetailMetodePemabyaran> {
  Future<void> _launched;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: mainColor1,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor1,
        title: Text(widget.kelompok, style: whiteFontStyle),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24.0),
                child: Html(data: widget.cara),
              ),
              Container(
                  child: widget.kelompok != "doku"
                      ? Text("")
                      : Container(
                          margin: EdgeInsets.only(top: 24),
                          height: 48,
                          width: 250,
                          child: EduButton(
                            onPressed: () => setState(() {
                              //_launched = _launchInBrowser(
                                //  'https://dev-api.edunitas.com/generate_doku?key=${widget.no_virtual}');
                            }),
                            buttonText: "Generate Kode",
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
