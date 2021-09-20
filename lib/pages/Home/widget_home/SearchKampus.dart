part of 'widget_home.dart';

class SearchKampus extends StatefulWidget {
  //SearchKampus({Key key}) : super(key: key);
  final Function changeZero;
  SearchKampus({this.changeZero});

  @override
  _SearchKampusState createState() => _SearchKampusState();
}

class _SearchKampusState extends State<SearchKampus> {
  String valKelas, valJurusan, valLokasi;

  var InSignIn = false;

  List dataProvinsi = [];
  void provinsi() async {
    Masterview_model().provinsi().then((value) {
      setState(() {
        dataProvinsi = value;
      });
    });
  }

  List dataunitarea = [];
  void getunitrea() async {
    Masterview_model().unitarea().then((value) {
      setState(() {
        dataunitarea = value == null ? [] : value;
        print('apasih: '+dataunitarea[0].nama.toString());
      });
    });
  }

  List<MasterJurusanModel> dataJurusan = new List();
  void jurusan() async {
    Masterview_model().jurusan().then((value1) {
      setState(() {
        dataJurusan = value1 == null ? [] : value1;
      });
    });
  }

  List<KelasModel> datakelas = new List();
  void getkelas() async {
    Masterview_model().masterkelas().then((value2) {
      setState(() {
        datakelas = value2 == null ? [] : value2;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    provinsi();
    //spesialisasiminatpekerjaan();
    jurusan();
    getkelas();
    getunitrea();
  }

  var jurusan_id;
  var jurusan_kode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  child: dataunitarea.length != 0
                      ? DropdownButton(
                          isExpanded: true,
                          value: valLokasi,
                          hint: Text(
                            "Pilih Lokasi",
                          ),
                          items: dataunitarea.map((item) {
                            return DropdownMenuItem(
                              child: Text(
                                item.nama,
                              ),
                              value: item.id.toString(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valLokasi = value;
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
                  child: datakelas.length != 0
                      ? DropdownButton(
                          isExpanded: true,
                          value: valKelas,
                          hint: Text(
                            "Pilih Kelas",
                          ),
                          items: datakelas.map((item) {
                            return DropdownMenuItem(
                              child: Text(
                                item.nama,
                              ),
                              value: item.singkatan,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valKelas = value;
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
                  child: dataJurusan.length != 0
                      ? DropdownButton(
                          isExpanded: true,
                          value: valJurusan,
                          hint: Text(
                            "Pilih Program Studi",
                          ),
                          items: dataJurusan.map((item) {
                            return DropdownMenuItem(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.jenjang,
                                  ),
                                  Text(" - "),
                                  Flexible(
                                    child: Text(
                                      item.nama,
                                    ),
                                  ),
                                ],
                              ),
                              value: item.id.toString() +
                                  "X" +
                                  item.kode.toString(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valJurusan = value;

                              print("valjurusan${jurusan_kode.toString()}");
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
            padding: EdgeInsets.only(bottom: 48),
            child: dataJurusan.length != 0
                ? Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 48,
                    child: InSignIn
                        ? SpinKitFadingCircle(color: orenColor)
                        : EduButton(
                            onPressed: () {
                              // checkEmailAndPassowrd();
                              var arr = valJurusan != null
                                  ? valJurusan.split('X')
                                  : ["", ""];
                              jurusan_id = arr[0];
                              jurusan_kode = arr[1];
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (Search_Kampus_Hasil(
                                            nilaiunitarea: valLokasi == null
                                                ? ''
                                                : valLokasi,
                                            nilaikelas: valKelas == null
                                                ? ''
                                                : valKelas,
                                            nilaijurusan: jurusan_kode == null
                                                ? ''
                                                : jurusan_kode,
                                            nilai: "1",
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
    );
  }
}
