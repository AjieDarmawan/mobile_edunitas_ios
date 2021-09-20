part of 'widget_home.dart';

class Prospek extends StatefulWidget {
  final String kodejurusan;

  Prospek({
    this.kodejurusan,
  });

  @override
  _ProspekState createState() => _ProspekState();
}

class _ProspekState extends State<Prospek> {
  String valjurusan;
  var InSignIn = false;

  List<MasterJurusanModel> dataJurusan = new List();
  String nama;
  String karir;
  String gelar;
  String jenjang;
  var komp = '';
  void jurusan_detail() async {
    Masterview_model().jurusan_detail(widget.kodejurusan).then((value1) {//handled
      setState(() {
        dataJurusan = value1;
        nama = value1[0].nama;
        karir = value1[0].karir;
        gelar = value1[0].gelar;
        jenjang = value1[0].jenjang;
        komp = value1[0].komp;
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
                jurusan_detail();
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
    jurusan_detail();
  }

  @override
  Widget build(BuildContext context) {
    print("dataJurusan ${dataJurusan.length}");
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor1,
        title: Text(widget.kodejurusan == null ? 'kosong' : 'Prospek',
            style: whiteFontStyle),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            child: ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        yellowColor,
                        orenColor,
                      ],
                      begin: const FractionalOffset(0.0, 1.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            padding: EdgeInsets.only(left: 16, top: 10),
                            child: Text(
                              'Gelar Lulusan',
                              textAlign: TextAlign.left,
                              style: blueFontStyle.copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            padding: EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              gelar != null ? gelar : '',
                              textAlign: TextAlign.left,
                              style: blueFontStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.asset('assets/bannerprospek.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                child: dataJurusan.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          CardProspek(
                              judul: "Kompetensi Lulusan\n${jenjang} -${nama}",
                              isi: karir.toString()),
                          SizedBox(height: 4),
                          CardProspek(
                              judul:
                                  "Profesi dan Karir Lulusan ${jenjang} -${nama}",
                              isi: komp.toString()),
                          SizedBox(height: 10),
                        ],
                      ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
