part of 'widget_donasi.dart';

class SearchDonasi extends StatefulWidget {
  //SearchDonasi({Key key}) : super(key: key);
  final Function changeZero;
  SearchDonasi({this.changeZero});

  @override
  _SearchLowonganState createState() => _SearchLowonganState();
}

class _SearchLowonganState extends State<SearchDonasi> {
  String  valkendala, valkategori;

  var InSignIn = false;

  List<SmbModel> datakendala = new List();
  void getKendalaDonasi() async {
    Donasiview_model().search_semua_kendala().then((value1) {
      setState(() {
        datakendala = value1 == null ? [] : value1;
      });
    });
  }

  List<SmbModel> semua_kategori = new List();
  void getKategoriDonasi() async {
    Donasiview_model().search_semua_kategori().then((value1) {
      setState(() {

        semua_kategori = value1 == null ? [] : value1;
      
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getKategoriDonasi();
    getKendalaDonasi();
  }

  var jurusan_id;
  var jurusan_kode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    child: semua_kategori.length != 0
                        ? DropdownButton(
                            isExpanded: true,
                            value: valkategori,
                            hint: Text(
                              "Semua Kategori",
                            ),
                            items: semua_kategori.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item.name,
                                ),
                                value: item.initial.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valkategori = value;
                              });
                            },
                          )
                        : Container(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                  height: 48,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[350])),
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    child: datakendala.length != 0
                        ? DropdownButton(
                            isExpanded: true,
                            value: valkendala,
                            hint: Text(
                              "Semua Kendala",
                            ),
                            items: datakendala.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item.name,
                                ),
                                value: item.initial.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valkendala = value;
                              });
                            },
                          )
                        : Container(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[350],
                              highlightColor: Colors.white,
                              child: Container(
                                  height: 48,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[350])),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: datakendala.length != 0
                  ? Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 38,
                      child: InSignIn
                          ? SpinKitFadingCircle(color: orenColor)
                          : EduButton(
                              onPressed: () {
                               
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (MainDonasi(
                                              kendala: valkendala.toString() == null ? "" : valkendala.toString(),
                                              kategori: valkategori.toString() == null ? "" : valkategori.toString(),
                                              key_enter: 1,
                                            ))));
                              },
                              buttonText: "Cari",
                            ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
