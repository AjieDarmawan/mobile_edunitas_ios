part of 'widget_home.dart';

class Search_Kampus_Hasil extends StatefulWidget {
  // Home_detail({Key key}) : super(key: key);
  final String nilaiunitarea, nilaikelas, nilaijurusan, nilai, keywordSearch;
  final int key_enter;

  Search_Kampus_Hasil(
      {this.nilaijurusan,
      this.nilaikelas,
      this.nilaiunitarea,
      this.nilai,
      this.keywordSearch,
      this.key_enter});

  @override
  _Search_Kampus_HasilState createState() => _Search_Kampus_HasilState();
}

class _Search_Kampus_HasilState extends State<Search_Kampus_Hasil>
    with SingleTickerProviderStateMixin {
  Future bottomModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            padding: MediaQuery.of(context).viewInsets,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    padding: EdgeInsets.only(top: 16),
                    height: 100,
                    child: TabBar(
                        labelColor: blueColor,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Cari Kampus"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Cari Prodi"),
                            ),
                          ),
                        ]),
                  ),
                  backgroundColor: blueColor,
                  elevation: 0,
                ),
                body: TabBarView(
                  children: <Widget>[
                    SearchKampus(),
                    SearchProdi(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Color colorPrimary = Colors.blue[900];
  TabController _controller;

  //search
  var dataSearchKampus = new List();
  void searchgetListKampus() {
    Kampusview_model()
        .SearchgetKampus(
            widget.nilaiunitarea, widget.nilaijurusan, widget.nilaikelas)
        .then((value1) {//handled
      print("SearchgetKampus= $value1");
      setState(() {
        dataSearchKampus = value1;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void searchgetKampusFront() {
    Kampusview_model()
        .SearchgetKampusFront(widget.keywordSearch)
        .then((value1) {//handled
      print(value1);
      print("SearchgetKampus= $value1");
      setState(() {
        dataSearchKampus = value1;
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
                init();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Photo> _photos;
  final int _nextPageThreshold = 5;

  int _keyEnter;

  void init() {
    if (widget.nilai == "1") {
      //searchgetListKampus();
      _hasMore = true;
      _pageNumber = 1;
      _error = false;
      _loading = true;
      _photos = [];
      //fetchPhotos();
    } else {
      // searchgetListKampus();
      _hasMore = true;
      _pageNumber = 1;
      _error = false;
      _loading = true;
      _photos = [];
      //fetchPhotos();
    }
    _keyEnter = widget.key_enter;
    if (widget.keywordSearch == '')
      searchgetKampusFront();
    else
      searchgetListKampus();
  }

  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    init();
  }

  @override
  Widget build(BuildContext context) {
    print("Searchprintunitarea${widget.nilaiunitarea}");
    print("Searchprintnilai${widget.nilai}");

    if (_keyEnter == 1) {
      return WillPopScope(
        onWillPop: _backPressed,
        child: Scaffold(
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: mainColor1,
              statusBarIconBrightness: Brightness.light,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: _backPressed,
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {
                    bottomModal(context);
                  }),
            ],
            title: Text(
              "Hasil Pencarian Kampus",
              style: whiteFontStyle,
            ),
            backgroundColor: mainColor1,
          ),
          body: dataSearchKampus.length == 0
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: shimmerLoading(),
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: _photos.isNotEmpty
                            ? Row(
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(_photos[0].perpage.toString() + " / "),
                                  Text(_photos[0].total.toString())
                                  // Text("1/"),
                                  // Text("10")
                                ],
                              )
                            : Text(""),
                      ),
                      Container(
                        child: Container(
                          //api kampus search
                          child: ListView.builder(
                            itemCount: dataSearchKampus.length == 0
                                ? 0
                                : dataSearchKampus.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              final Photo xkampus = dataSearchKampus[i];
                              print('wwkk' + xkampus.nama);
                              if (xkampus.nama != 'zzz') {
                                return ListKampusCard(
                                  campus: xkampus,
                                  routef: 'SearchKampusHasil',
                                  nilaiunitarea: widget.nilaiunitarea,
                                  nilaikelas: widget.nilaikelas,
                                  nilaijurusan: widget.nilaijurusan == null
                                      ? ''
                                      : widget.nilaijurusan,
                                  nilai: "1",
                                  key_enter: 1,
                                );
                              } else {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 1.2,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      'Kampus yang kamu cari tidak ditemukan',
                                      style: blackFontStyle2,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: _backPressed,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: _backPressed,
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {
                    bottomModal(context);
                  }),
            ],
            title: Text(
              "eduCampus",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            backgroundColor: mainColor1,
          ),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Kampus yang kamu cari tidak ditemukan',
              style: blackFontStyle2,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      );
    }
  }

  /*Widget getCampus() {
    if (_photos.isEmpty) {
      if (_loading) {
        return Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ));
      } else if (_error) {
        return Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchPhotos();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error while loading photos, tap to try agin"),
              ),
            ));
      }
    } else {
      return ListView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          // physics: ClampingScrollPhysics(),
          physics: ScrollPhysics(),
          itemCount: _photos.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _photos.length - _nextPageThreshold) {
              fetchPhotos();
            }
            if (index == _photos.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _loading = true;
                          _error = false;
                          fetchPhotos();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("Error while loading photos, tap to try agin"),
                      ),
                    ));
              } else {
                return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    ));
              }
            }
            final Photo photo = _photos[index];
            return ListKampusCard(
              campus: photo,
            );
          });
    }
    return Container();
  }*/

  Future<bool> _backPressed() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
  }

  Widget shimmerLoading() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350],
          highlightColor: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
            ],
          ),
        ),
      ),
    ));
  }
}
