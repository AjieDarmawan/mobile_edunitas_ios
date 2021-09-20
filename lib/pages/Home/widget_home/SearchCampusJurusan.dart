part of 'widget_home.dart';

class SearchCampusJurusan extends StatefulWidget {
//  SearchCampusJurusan({Key key}) : super(key: key);
  final String nama, unitarea, kodejurusan, karir, valLokasi;

  SearchCampusJurusan(
      {this.nama, this.unitarea, this.kodejurusan, this.karir, this.valLokasi});
  @override
  _SearchCampusJurusanState createState() => _SearchCampusJurusanState();
}

class _SearchCampusJurusanState extends State<SearchCampusJurusan> {
  List dataCampus = [];
  void getDataJurusanCampus() async {
    Kampusview_model()
        .searchCampusjurusan(
            widget.unitarea.toString(), widget.kodejurusan.toString())
        .then((value) {//handled
      setState(() {
        dataCampus = value;
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
                _loadingView();
                getDataJurusanCampus();
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
    _loadingView();
    getDataJurusanCampus();

  }

  Future<bool> _backPressed() {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (SearchProdiHasil(
                  nilaiunitarea: widget.unitarea,
                  valLokasi: widget.valLokasi,
                ))));
  }

  Timer _timerinfo;
  var _loading=true;
  void _loadingView() {
    if (_loading == true) {
      _timerinfo = Timer(Duration(seconds: 2), () {
        setState(() {
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _dataCampusLenght = dataCampus == null ? 0 : dataCampus.length;
    print('karir: '+widget.karir.toString());
    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: mainColor1,
              statusBarIconBrightness: Brightness.light,
            ),
            title: Text(
              widget.nama,
              style: whiteFontStyle,
            ),
            backgroundColor: mainColor1,
          ),
          body: _loading
              ? SpinKitThreeBounce(color: mainColor1)
              : _dataCampusLenght == 0
              ? Container(
                  child: Center(
                    child: Text(
                      'Tidak ada kampus yang sesuai',
                      style: blackFontStyle2,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
                        child: Text(
                          "Kampus Penyelenggara",
                          style: blueFontStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _dataCampusLenght,
                            itemBuilder: (context, i) {
                              final xcampus = dataCampus[i];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (HomeDetailPage(
                                                campus: xcampus,
                                                routef: 'SearchCampusJurusan',
                                                nama: widget.nama,
                                                unitarea: widget.unitarea,
                                                kodejurusan: widget.kodejurusan,
                                                karir: widget.karir,
                                              ))));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(width: 16),
                                    Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        Container(
                                          padding: EdgeInsets.only(right: 16),
                                          margin: EdgeInsets.symmetric(horizontal: 14),
                                          width: 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 3.0)
                                            ],
                                            image: DecorationImage(
                                                image:
                                                    NetworkImage(xcampus.logo),
                                                fit: BoxFit.fill),
                                          ),
                                          // child: Image.network(
                                          //   widget.campus.logo,
                                          //   height: MediaQuery.of(context).size.height / 9,
                                          //   width: MediaQuery.of(context).size.width / 3,
                                          // ),
                                        ),
                                        SizedBox(height: 10,),
                                        Center(
                                          child: Text( xcampus.singkatan.toString().length>10
                                              ? xcampus.singkatan.toString().substring(0,9)+'..'
                                              : xcampus.singkatan.toString(),
                                            style: blackFontStyle3,),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 16, 0, 0),
                        child: Text(
                          "Jenjang Karir",
                          style: blueFontStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Html(
                          data: widget.karir.toString(),
                          defaultTextStyle: blackFontStyle3,
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  void errorImage() {}
}
