part of 'widgetkarir.dart';

class SearchLowonganHasil extends StatefulWidget {
  final String valwilayah, valtipe, valpendidikan, valspesialisasi, nilai;
  int key_enter;
  SearchLowonganHasil(
      {this.valwilayah,
      this.valpendidikan,
      this.valspesialisasi,
      this.valtipe,
      this.key_enter,
      this.nilai});
  @override
  _SearchLowonganHasilState createState() => _SearchLowonganHasilState();
}

class _SearchLowonganHasilState extends State<SearchLowonganHasil> {
  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultkarirsPerPageCount = 10;
  List<ListKarirModel> karirs;
  final int _nextPageThreshold = 5;
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
                body: TabBarView(
                  children: <Widget>[
                    SearchLowongan(),
                    // SearchProdi(),
                  ],
                ),
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
    print("widget${_pageNumber}");
    print("widget${widget.valtipe}");
    print("widget${widget.valwilayah}");
    print("widget${widget.valpendidikan}");
    print("widget${widget.valspesialisasi}");
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
                // child: Container(
                //     padding: EdgeInsets.only(right: 15), child: Icon(Icons.search)),
              )
            ]),
        body: SingleChildScrollView(
            child: Column(
          children: [
            getBody(),
            SizedBox(
              height: 16,
            )
          ],
        )),
      ),
    );
  }

  Widget getBody() {
    if (karirs.isEmpty) {
      if (_loading) {
        return Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SpinKitThreeBounce(
              color: mainColor1,
            ),
          )),
        );
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              fetchKarir();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Error while loading Lowongan Kerja, tap to try agin"),
          ),
        ));
      } else {
        return Center(
          child: Text(
            "Lowongan Kerja tidak ditemukan",
            style: blackFontStyle1,
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
              fetchKarir();
            }
            if (index == karirs.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      fetchKarir();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                        "Error while loading Lowongan Kerja, tap to try agin"),
                  ),
                ));
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SpinKitThreeBounce(
                    color: mainColor1,
                  ),
                ));
              }
            }
            final ListKarirModel karir = karirs[index];
            // return Card(
            //   child: Column(
            //     children: <Widget>[
            //       Text(karir.namaPerusahaan),
            //       Padding(
            //         padding: const EdgeInsets.all(16),
            //         child: Text(karir.lowongan,
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 16)),
            //       ),
            //     ],
            //   ),
            // );
            return CardKarir(xkarir: karir);
          });
    }
    return Container(
      child: Center(
        child: Text(
          "Lowongan Kerja tidak ditemukan",
          style: abuFontStyle,
        ),
      ),
    );
  }

  Future<void> fetchKarir() async {
    try {
      final response = await http.get(
          "https://dev-api.edunitas.com/SearchKarir?type=${widget.valtipe}&wilayah=${widget.valwilayah}&pendidikan=${widget.valpendidikan}&spesialisasi=${widget.valspesialisasi}&page=${_pageNumber}&sort=terlama");
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
}
