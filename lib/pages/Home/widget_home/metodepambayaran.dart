part of 'widget_home.dart';

class MetodePembayran extends StatefulWidget {
  final String kodekampus, keycode, no_virtual;

  MetodePembayran({this.kodekampus, this.keycode, this.no_virtual});

  @override
  _MetodePembayranState createState() => _MetodePembayranState();
}

class _MetodePembayranState extends State<MetodePembayran> {
  List<MetodePembayaranModel> datametodepembayran = new List();
  void getmetodepembayaran() async {
    Masterview_model()
        .metodepembayaran(
            widget.kodekampus.toString(), widget.no_virtual.toString()).then((value2) {//handled
      setState(() {
        datametodepembayran = value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro){
    print("do_login_err: "+erro.toString());
    if(erro.toString().contains("SocketException")){
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
                getmetodepembayaran();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    getmetodepembayaran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: mainColor1,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: mainColor1,
          title: Text("Pilih Metode Pembayaran", style: whiteFontStyle)),
      body: SingleChildScrollView(
        child: datametodepembayran.length == 0
            ? LinearProgressIndicator()
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: datametodepembayran.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final xmp = datametodepembayran[i];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    borderOnForeground: true,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 72,
                                height: 36,
                                child: xmp.logo == null
                                    ? Text("")
                                    : FittedBox(
                                        child: Image.network(xmp.logo,
                                            fit: BoxFit.cover)),
                              ),
                              Container(
                                // height: 60,
                                child: Text(xmp.metode,
                                    style: blackFontStyle1.copyWith(
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (DetailMetodePemabyaran(
                                              no_virtual:
                                                  widget.no_virtual == null
                                                      ? ""
                                                      : widget.no_virtual,
                                              cara: xmp.cara == null
                                                  ? ""
                                                  : xmp.cara,
                                              kelompok: xmp.kelompok == null
                                                  ? ""
                                                  : xmp.kelompok,
                                            ))));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
