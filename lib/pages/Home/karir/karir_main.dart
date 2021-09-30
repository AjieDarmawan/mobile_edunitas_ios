part of 'karir.dart';

class KarirMain extends StatefulWidget {
  KarirMain({Key key}) : super(key: key);
  @override
  _KarirMainState createState() => _KarirMainState();
}

class _KarirMainState extends State<KarirMain> {
  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultkarirsPerPageCount = 10;
  List<ListKarirModel> karirs;
  final int _nextPageThreshold = 5;
  final _debouncer = Debouncer(milliseconds: 2000);
  TextEditingController etkarirsearch = new TextEditingController();
  String _valSearch = "";

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    karirs = [];
    fetchKarir();
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer._timer.cancel();
  }

  var logo = [1, 0, 0, 0];
  var smallImg = [0, 0, 0, 1];
  var bigImg = [0, 0, 1, 0];

  Future bottomModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        builder: (context) {
          return Container(
            height: 420,
            padding: MediaQuery.of(context).viewInsets,
            child: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(
                    "Filter Lowongan Kerja",
                    style: whiteFontStyle,
                  ),
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  automaticallyImplyLeading: false,
                  backgroundColor: blueColor,
                  elevation: 0,
                ),
                body: SearchLowongan(),
              ),
            ),
          );
        });
  }

  Widget TopBanner() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 80,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        color: mainColor1,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Future<bool> _onWillpop() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Scaffold(
        appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            title: Text(
              "Lowongan Kerja",
              style: whiteFontStyle,
            ),
            backgroundColor: mainColor1,
            actions: [
              IconButton(
                icon: Icon(Icons.filter_alt),
                onPressed: () {
                  bottomModal(context);
                },
              )
            ]),
        body: SingleChildScrollView(
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
                        const Color(0xFF453B89),
                        const Color(0xFF6051A4),
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
                              'Pencarian Lowongan Kerja',
                              textAlign: TextAlign.left,
                              style: whiteFontStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            padding: EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              'Informasi mengenai Lowongan pekerjaan di berbagai wilayah Indonesia dengan Perusahaan terkemuka.',
                              textAlign: TextAlign.left,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: whiteFontStyle.copyWith(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.asset('assets/bannerkarir.png'),
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
                            controller: etkarirsearch,
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
                                hintText: "Cari lowongan"),
                            onChanged: (string) {
                              setState(() {
                                _hasMore = true;
                                _pageNumber = 1;
                                _error = false;
                                _loading = true;
                                karirs = [];
                                _debouncer.run(() => string != ""
                                    ? fetchKarirChange(string)
                                    : fetchKarir());
                              });
                            },
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Container(child: getBody()),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (karirs.isEmpty) {
      if (_loading) {
        return shimmerLoading();
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              if (_valSearch == "")
                fetchKarir();
              else
                fetchKarirChange(_valSearch);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Error while loading Lowongan Kerja, tap to try again"),
          ),
        ));
      } else {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
                "Mohon maaf, lowongan kerja yang anda cari tidak tersedia"),
          ),
        );
      }
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: karirs.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == karirs.length - _nextPageThreshold) {
              if (_valSearch == "")
                fetchKarir();
              else
                fetchKarirChange(_valSearch);
            }
            if (index == karirs.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      if (_valSearch == "")
                        fetchKarir();
                      else
                        fetchKarirChange(_valSearch);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                        "Error while loading Lowongan Kerja, tap to try again"),
                  ),
                ));
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SpinKitThreeBounce(color: mainColor1),
                ));
              }
            }
            final ListKarirModel karir = karirs[index];

            return CardKarir(xkarir: karir);
          });
    }
    return Container();
  }

  Future<void> fetchKarir() async {
    try {
      final response = await http
          .get(Uri.parse("https://dev-api.edunitas.com/list_karir?page=$_pageNumber"));
      List<ListKarirModel> fetchedkarirs =
          listKarirModelFromJson(response.body);
      //
      setState(() {
        _hasMore = fetchedkarirs.length == _defaultkarirsPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        karirs.addAll(fetchedkarirs);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  Future<void> fetchKarirChange(String value) async {
    try {
      final response = await http.get(
          Uri.parse("https://dev-api.edunitas.com/SearchKarir_freetext?search=$value&page=$_pageNumber&sort=terbaru"));
      List<ListKarirModel> fetchedkarirs =
          listKarirModelFromJson(response.body);

      setState(() {
        _valSearch = value;
        _hasMore = fetchedkarirs.length == _defaultkarirsPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        karirs.addAll(fetchedkarirs);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  Widget shimmerLoading() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
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
