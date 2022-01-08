part of 'home.dart';

class SearchHome extends SearchDelegate {
  String selectedResult = "";

  @override
  String get searchFieldLabel => 'Ketik nama kampus..';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: mainColor1,
      brightness: Brightness.dark,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(fontSize: 18, color: Colors.white.withOpacity(0.8)),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
          selectedResult = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  List<Photo> datakampus1(String query) {
    List<Photo> dataSearchKampus = new List();

    Kampusview_model().SearchgetKampusFront(query).then((value1) {
      print(value1);
      print("SearchgetKampusq= $query");
      print("SearchgetKampus=" + value1.length.toString());
      return dataSearchKampus = value1;
    });

    return dataSearchKampus;
  }

  Future<List<Photo>> getSearch() async {
    List<Photo> data;
    final response =
        await http.post(ConstanUrl().baseUrl + "search_campus_home", body: {
      'search': selectedResult != "" ? selectedResult : query,
    });
    data = Photo.parseList(json.decode(response.body));
    return data;
  }

  Future<List<Photo>> getPopuler() async {
    List<Photo> data;
    final response =
        await http.get("https://dev-api.edunitas.com/list_campus_logo");
    data = Photo.parseList(json.decode(response.body));
    return data;
  }

  Widget _hasilKosong(var context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Kampus yang kamu cari tidak ditemukan',
        style: blackFontStyle2,
        textAlign: TextAlign.center,
      ),
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getSearch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.hasError);
            List<Photo> results = snapshot.data;
            var resleng = results == null ? 0 : results.length;
            if (resleng == 0) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.2,
                child: _hasilKosong(context),
              );
            } else {
              Photo dongs = results[0];
              print("Dangs=" + dongs.singkatan);
              return SingleChildScrollView(
                child: Container(
                  //api kampus search
                  child: ListView.builder(
                    itemCount: results.length == 0 ? 0 : results.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      print("wwwkk " + results[0].toString());
                      final Photo xkampus = results[i];
                      return ListKampusCard(
                        campus: xkampus,
                        routef: 'Home',
                        nilaiunitarea: "",
                        nilaikelas: "",
                        nilaijurusan: "",
                        nilai: "1",
                        key_enter: 1,
                      );
                    },
                  ),
                ),
              );
            }
          }),
    );
  }

  final List<String> listExample;
  SearchHome(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context) {
    //List<String> suggestionList = [];
    if (query == '') {
      return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: getPopuler(),
          builder: (context, pop) {
            if (pop.hasError) print(pop.hasError);
            List<Photo> results = pop.data;
            var popleng = results == null ? 0 : results.length;
            if (popleng == 0) {
              return Center(
                child: SpinKitThreeBounce(
                  color: mainColor1,
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Kampus populer',
                      style: blackFontStyle2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          itemCount: popleng < 6 ? popleng : 6,
                          itemBuilder: (context, index) {
                            final xdatakampus = results[index];
                            return GestureDetector(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Image.network(
                                            xdatakampus.logo,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          xdatakampus.singkatan,
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: blackFontStyle3,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (HomeDetailPage(
                                              campus: xdatakampus,
                                              routef: 'HomeMain',
                                            ))));
                              },
                            );
                          }),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: getSearch(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.hasError);
              List<Photo> results = snapshot.data;
              var resleng = results == null ? 0 : results.length;
              if (resleng == 0) {
                return Center(
                  child: _hasilKosong(context),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: resleng,
                    itemBuilder: (context, index) {
                      if (index < 6) {
                        print('results[index].nama' + results[index].singkatan);
                        return ListTile(
                          title: Text(
                            results[index].singkatan,
                            style: TextStyle(color: Colors.grey),
                          ),
                          leading: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            query = results[index].singkatan;
                            showResults(context);
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              }
            }),
      );
    }
  }
}
