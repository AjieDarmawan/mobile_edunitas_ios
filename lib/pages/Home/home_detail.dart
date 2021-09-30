part of 'home.dart';

class Home_detail extends StatefulWidget {
  // Home_detail({Key key}) : super(key: key);
  final List<String> list = List.generate(10, (index) => "Text $index");
  final String nilaiunitarea, nilaikelas, nilaijurusan, nilai;
  final int key_enter;

  Home_detail(
      {this.nilaijurusan,
      this.nilaikelas,
      this.nilaiunitarea,
      this.nilai,
      this.key_enter});

  @override
  _Home_detailState createState() => _Home_detailState();
}

class _Home_detailState extends State<Home_detail>
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
  TextEditingController etkampussearch = new TextEditingController();
  final _debouncer = Debouncer(milliseconds: 2000);

  //search
  var dataSearchKampus = new List();
  void searchgetListKampus() {
    Kampusview_model()
        .SearchgetKampus(
            widget.nilaiunitarea, widget.nilaijurusan, widget.nilaikelas)
        .then((value1) {
      setState(() {
        dataSearchKampus = value1;
      });
    }).catchError((_error) {
      setState(() {
        //_stillhandling=_stillhandling+1;
        onErrHandling(_error);
      });
    });
  }

  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Photo> _photos;
  final int _nextPageThreshold = 9;

  int _keyEnter;
  bool isConn;

  Future<void> fetchPhotos() async {
    try {
      final response = await http
          .get("https://dev-api.edunitas.com/list_campus?page=$_pageNumber");
      List<Photo> fetchedPhotos = Photo.parseList(json.decode(response.body));
      //final fetchedPhotos = PhotoModel(response.body);

      setState(() {
        _hasMore = fetchedPhotos.length == _defaultPhotosPerPageCount;
        isConn = true;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _photos.addAll(fetchedPhotos);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
        //_stillhandling=_stillhandling+1;
        onErrHandling(e);
      });
    }
  }

  List<Photo> getSearchkampus(String query) {
    List<Photo> dataSearchKampus = new List();

    Kampusview_model().SearchgetKampusFront(query).then((value1) {
      print(value1);
      print("SearchgetKampusq= $query");
      print("SearchgetKampus=" + value1.length.toString());
      dataSearchKampus = value1;
      setState(() {
        _hasMore = dataSearchKampus.length == _defaultPhotosPerPageCount;
        isConn = true;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _photos.addAll(dataSearchKampus);
      });
      return dataSearchKampus = value1;
    });

    return dataSearchKampus;
  }

  void getData() {
    // searchgetListKampus();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    _photos = [];
    fetchPhotos();
    _controller = TabController(vsync: this, length: 2);
    _keyEnter = widget.key_enter;
  }

  var _stillhandling = false;
  void onErrHandling(erro) {
    print("do_home_det_err: " + erro.toString());
    if (_stillhandling == false) {
      setState(() {
        _stillhandling = true;
      });
      if (erro.toString().contains("SocketException")) {
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
                  setState(() {
                    _stillhandling = false;
                    isConn = true;
                    _loading = true;
                    _error = false;
                    Navigator.of(context).pop();
                    fetchPhotos();
                  });
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  //conn has been updated 1 August 2021
  var connectivityResult;
  Future<void> conn() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    Future.delayed(const Duration(seconds: 1), () {
      var check_conn;
      setState(() {
        if (connectivityResult == ConnectivityResult.mobile) {
          isConn = true;
          check_conn = "I am connected to a mobile network.";
          print("cek_internet: $check_conn");
          getData();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          isConn = true;
          check_conn = "I am connected to a wifi network.";
          print("cek_internet: $check_conn");
          getData();
        } else {
          isConn = false;
          check_conn = "No network";
          print("cek_internet: $check_conn");
        }
      });
    });
  }

  void initState() {
    super.initState();
    //conn();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("dataSearchKampus${dataSearchKampus.length}");
    print("printunitarea${widget.nilaiunitarea}");
    print("printnilai${widget.nilai}");

    print("_keyenter ${widget.key_enter}, latapi ${_keyEnter}");

    return WillPopScope(
      onWillPop: _backPressed,
      child: Scaffold(
          appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: _backPressed,
            ),
            actions: [
              isConn == false
                  ? Container(
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey[350],
                          highlightColor: Colors.white,
                          child: Icon(Icons.filter_alt)),
                    )
                  : IconButton(
                      icon: isConn == true
                          ? Icon(Icons.filter_alt)
                          : Container(
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Icon(Icons.filter_alt)),
                            ),
                      onPressed: () {
                        //isConn=false;
                        //conn();
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (isConn == true) {
                            //_changeZero();
                            bottomModal(context);
                          }
                        });
                      }),
            ],
            title: Text("Cari Kampus"),
            // Container(
            //     height: 24,
            //     //width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/2.5),
            //
            //     child: Builder(
            //       builder: (context) => GestureDetector(
            //         onTap: () async {
            //           await showSearch(
            //               context: context, delegate: SearchHome(widget.list));
            //         },
            //         child: Container(
            //           height: 40,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8.0),
            //             color: Colors.white,
            //           ),
            //           child: Container(
            //             padding: EdgeInsets.only(left: 6),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.search,
            //                   color: Colors.grey,
            //                   size: 15,
            //                 ),
            //                 SizedBox(
            //                   width: 5,
            //                 ),
            //                 Text(
            //                   "Pencarian Kampus",
            //                   style:
            //                       TextStyle(color: Colors.grey, fontSize: 13),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     )),
            backgroundColor: mainColor1,
          ),
          body: isConn == false
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: shimmerLoading()))
              : _keyEnter == 1
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF060E5C),
                                    const Color(0xFF0E3C83),
                                  ],
                                  begin: const FractionalOffset(0.0, 1.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        padding:
                                            EdgeInsets.only(left: 16, top: 10),
                                        child: Text(
                                          'Program Perkuliahan Karyawan',
                                          textAlign: TextAlign.left,
                                          style: whiteFontStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        padding:
                                            EdgeInsets.only(left: 16, top: 8),
                                        child: Text(
                                          'Program kuliah dengan waktu yang fleksibel dengan biaya terjangkau diperuntukan bagi karyawan atau wirausaha (Kalangan Profesional)',
                                          textAlign: TextAlign.left,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: whiteFontStyle.copyWith(
                                              fontSize: 10),
                                        ),
                                      )
                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Image.asset(
                                          'assets/bannerkampus.png'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Row(children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.search_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        cursorColor: mainColor1,
                                        controller: etkampussearch,
                                        keyboardType: TextInputType.text,
                                        //enabled: false,
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 8, bottom: 5, top: 5, right: 10),
                                            hintText: "Cari kampus"),
                                        onChanged: (string) {
                                          setState(() {
                                            _hasMore = true;
                                            _pageNumber = 1;
                                            _error = false;
                                            _loading = true;
                                            _photos = [];
                                            _debouncer.run(() => string != ""
                                                ? getSearchkampus(string)
                                                : fetchPhotos());
                                          });
                                        },
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: _photos.isNotEmpty
                                ? Row(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(_photos[0].perpage.toString() +
                                          " / "),
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
                              child: dataSearchKampus.length == 0 ||
                                      dataSearchKampus == null
                                  ? Center(
                                      child: getCampus(),
                                    )
                                  : ListView.builder(
                                      itemCount: dataSearchKampus.length == 0
                                          ? 0
                                          : dataSearchKampus.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, i) {
                                        final Photo xkampus =
                                            dataSearchKampus[i];
                                        return ListKampusCard(
                                          campus: xkampus,
                                          routef: 'HomeDetail',
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: shimmerLoading(),
                    ))),
    );
  }

  Widget getCampus() {
    if (_photos.isEmpty) {
      if (_loading) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: shimmerLoading(),
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
                  child: shimmerLoading(),
                ));
              }
            }
            final Photo photo = _photos[index];
            return ListKampusCard(
              campus: photo,
              routef: 'HomeDetail',
            );
          });
    }
    return Container();
  }

  void _changeZero() {
    print("_changeZero active");
    setState(() {
      _keyEnter = 0;
    });
  }

  Future<bool> _backPressed() {
    setState(() {
      _keyEnter = 0;
    });
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

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
