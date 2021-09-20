part of 'widget_home.dart';

class SearchProdiHasil extends StatefulWidget {
  final String nilaiunitarea, valLokasi;
  SearchProdiHasil({
    this.nilaiunitarea,
    this.valLokasi
  });

  @override
  _SearchProdiHasilState createState() => _SearchProdiHasilState();
}

class _SearchProdiHasilState extends State<SearchProdiHasil> {
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  List<SearchProdiModel> datasearchprodi = [];
  // List<SearchProdiModel> prodicampus = [];
  List prodicampus = [];
  void dataSerachProdi() async {
    Kampusview_model().search_prodi(widget.nilaiunitarea).then((value) {//handled
      setState(() {
        datasearchprodi = value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var dataSearchKampus2 = new List();

  void searchgetListKampus() {
    Kampusview_model()
        .search_prodi_listcampus(widget.nilaiunitarea, "S1AK").then((value1) {//handled
      setState(() {
        dataSearchKampus2 = value1;
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
                dataSerachProdi();
                _loadingView();
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
    dataSerachProdi();
    _loadingView();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    //searchgetListKampus();
  }

  Timer _timerinfo;
  var _loading=true;
  void _loadingView() {
    if (_loading == true) {
      _timerinfo = Timer(Duration(seconds: 4), () {
        setState(() {
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _datasearchprodiLenght = datasearchprodi==null?0:datasearchprodi.length;
    print("datasearchprodi${_datasearchprodiLenght}");
    print("prodicampus${prodicampus.length}");
    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        appBar: AppBar(
          title: Text("Hasil Pencarian Prodi", style: whiteFontStyle),
          backgroundColor: mainColor1,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: mainColor1,
            statusBarIconBrightness: Brightness.light,
          ),
          leading: IconButton(
              onPressed: () {
                _backPressed();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: _loading
            ? SpinKitThreeBounce(color: mainColor1)
            : _datasearchprodiLenght == 0
        ? Container(
          child: Center(
            child: Text('Kampus tidak ditemukan', style: blackFontStyle2,),
          ),
        )
        : ListView.builder(
            itemCount: _datasearchprodiLenght,
            itemBuilder: (context, i) {
              final xdatasearchprodi = datasearchprodi[i];
              // searchgetListKampus(xdatasearchprodi.kode);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (SearchCampusJurusan(
                            nama: xdatasearchprodi.data.nama == null
                                ? ""
                                : xdatasearchprodi.data.nama,
                            unitarea: widget.nilaiunitarea == null
                                ? ""
                                : widget.nilaiunitarea,
                            kodejurusan: xdatasearchprodi.data.kode == null
                                ? ""
                                : xdatasearchprodi.data.kode,
                            karir: xdatasearchprodi.data.karir == null
                                ? ""
                                : xdatasearchprodi.data.karir,
                            valLokasi: widget.valLokasi,
                          ))));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey[350]),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          xdatasearchprodi.data.nama,
                          style: blueFontStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: mainColor1,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.school_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: Text(
                              "Gelar lulusan :\n${xdatasearchprodi.data.gelar}",
                              style: blackFontStyle3,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home_detail(key_enter: 1,)),
    );
  }
}
