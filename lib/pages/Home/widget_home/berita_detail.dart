part of 'widget_home.dart';

class BeritaDetail extends StatefulWidget {
  final String cid, konten, title, link, penulis, tanggal;
  BeritaDetail(
      {this.cid,
      this.konten,
      this.title,
      this.link,
      this.penulis,
      this.tanggal});

  @override
  _BeritaDetailState createState() => _BeritaDetailState();
}

class _BeritaDetailState extends State<BeritaDetail> {
  // var berita_id;
  // var berita_title;
  // var berita_content;
  // var berita_image;

  bool isConn = false;

  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 2), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          //getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          //getData();
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
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
                    conn();
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Ulangi',
                ),
              ))
            ..show(context);
        }
      });
    });
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Info Share',
        text: 'Sebarkan info kampus terbaru sekarang',
        linkUrl: widget.link == null || widget.link == ""
            ? 'https://edunitas.com/edunews#all'
            : 'https://edunitas.com/edunews/detail/' + widget.link,
        chooserTitle: 'Sebarkan info dengan');
  }

  @override
  void initState() {
    conn();
  }

  @override
  Widget build(BuildContext context) {
    print('sumbers: ' + widget.penulis.toString());
    var _penulis = widget.penulis==''?'eduKampus':widget.penulis;
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita Pilihan", style: whiteFontStyle),
        backgroundColor: mainColor1,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                print("share_helper: https://edunitas.com/edunews/detail/" +
                    widget.link);
                share();
              })
        ],
      ),
      body: isConn == false
          ? Center(
              child: Padding(
              padding: const EdgeInsets.all(8),
              child: SpinKitThreeBounce(
                color: mainColor1,
              ),
            ))
          : SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    color: Colors.grey,
                    child: Image.network(widget.cid, fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: blackFontStyle1Bold,
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "By ",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    _penulis,
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Text(widget.tanggal,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        //Text(news, style: TextStyle(fontSize: 18),),
                        Html(
                          data: widget.konten,
                          // padding: EdgeInsets.all(8.0),
                          backgroundColor: Colors.white70,
                          defaultTextStyle: blackFontStyle3,
                          linkStyle: const TextStyle(
                            color: Colors.redAccent,
                          ),
                          customTextAlign: (dom.Node node) {
                            if (node is dom.Element) {
                              switch (node.localName) {
                                case "p":
                                  return TextAlign.left;
                              }
                            }
                            return TextAlign.left;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }

  var news =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n" +
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}
