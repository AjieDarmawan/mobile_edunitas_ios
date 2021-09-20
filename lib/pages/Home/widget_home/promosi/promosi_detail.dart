part of 'widget_promosi.dart';

class PromosiDetail extends StatefulWidget {
  final String cid, konten, title, caradapat, poinredeem, link;
  PromosiDetail(
      {this.cid,
      this.konten,
      this.title,
      this.caradapat,
      this.poinredeem,
      this.link});

  @override
  _PromosiDetailState createState() => _PromosiDetailState();
}

class _PromosiDetailState extends State<PromosiDetail> {
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
  // var berita_id;
  // var berita_title;
  // var berita_content;
  // var berita_image;

  Future<void> share() async {
    print("share_helper");
    await FlutterShare.share(
        title: 'Promo Share',
        text: 'Sebarkan promo kampus terbaru sekarang',
        linkUrl: 'https://edunitas.com/edupromotion/detail/' +
            widget.title.replaceAll(" ", "-").toLowerCase(),
        chooserTitle: 'Sebarkan promo dengan');
  }

  @override
  void initState() {
    conn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        title: Text(
          "Promosi Pilihan",
          style: whiteFontStyle,
        ),
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
                    child: Image.network(widget.cid, fit: BoxFit.fill),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        //Text(news, style: TextStyle(fontSize: 18),),
                        Html(
                          data: widget.konten,
                        ),
                        Html(
                          data: widget.caradapat ?? "",
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16.0),
                        child: CustomPaint(
                          size: Size(
                              200,
                              (180 * 0.472197630791282)
                                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      Positioned(
                        top: 24,
                        child: Text(
                          "Ambil kode promosi",
                          style: blueFontStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Positioned(
                        bottom: 28,
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(new ClipboardData(
                                text: widget.poinredeem ?? "77bb77"));
                            Fluttertoast.showToast(
                                msg: "Copied",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                fontSize: 16.0);
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.content_copy_rounded,
                                  color: blackColor,
                                  size: 24.0,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(widget.poinredeem ?? "77bb77",
                                    style: blackFontStyle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
    );
  }

  var news =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n" +
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}

//Apeng Here

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();

    path_0.moveTo(size.width * 0.9512247, size.height * 0.4017498);
    path_0.arcToPoint(Offset(size.width * 1.000000, size.height * 0.2984555),
        radius:
            Radius.elliptical(size.width * 0.04877535, size.height * 0.1032943),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 1.000000, size.height * 0.1071333);
    path_0.arcToPoint(Offset(size.width * 0.9494119, 0),
        radius:
            Radius.elliptical(size.width * 0.05058809, size.height * 0.1071333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.05058809, 0);
    path_0.arcToPoint(Offset(0, size.height * 0.1071333),
        radius:
            Radius.elliptical(size.width * 0.05058809, size.height * 0.1071333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(0, size.height * 0.2983662);
    path_0.arcToPoint(Offset(0, size.height * 0.5049549),
        radius:
            Radius.elliptical(size.width * 0.04877535, size.height * 0.1032943),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(0, size.height * 0.8927774);
    path_0.arcToPoint(Offset(size.width * 0.05058809, size.height * 0.9999107),
        radius:
            Radius.elliptical(size.width * 0.05058809, size.height * 0.1071333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.9494119, size.height * 0.9999107);
    path_0.arcToPoint(Offset(size.width, size.height * 0.8927774),
        radius:
            Radius.elliptical(size.width * 0.05058809, size.height * 0.1071333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width, size.height * 0.5049549);
    path_0.arcToPoint(Offset(size.width * 0.9512247, size.height * 0.4017498),
        radius:
            Radius.elliptical(size.width * 0.04877535, size.height * 0.1032943),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.09755069, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.1131487, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.09755069, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.1646221, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.1802201, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.1646221, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.2316934, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.2472914, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.2318621, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.2988070, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.3143628, size.height * 0.4106776),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.2988070, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.3658783, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.3814342, size.height * 0.4106776),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.3658783, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.4329497, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.4485055, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4329497, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.5000211, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.5155769, size.height * 0.4106776),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5000211, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.5670924, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.5826483, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5670924, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.6341638, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.6497618, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.6341638, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.7012352, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.7166646, size.height * 0.4106776),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.7012352, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.7683066, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.7841153, size.height * 0.4106776),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.7683066, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.8353779, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.8509759, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.8353779, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.9024493, size.height * 0.4432640);
    path_0.arcToPoint(Offset(size.width * 0.9180473, size.height * 0.4102312),
        radius: Radius.elliptical(
            size.width * 0.01559799, size.height * 0.03303276),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.9024493, size.height * 0.4432640),
        radius: Radius.elliptical(
            size.width * 0.01555584, size.height * 0.03294349),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = yellowColor.withOpacity(1.0);
    canvas.drawShadow(path_0, Colors.black54, 2.0, true);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
