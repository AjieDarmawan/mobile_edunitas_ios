part of 'widgetkarir.dart';

class SearchLowongan extends StatefulWidget {
  //SearchLowongan({Key key}) : super(key: key);
  final Function changeZero;
  SearchLowongan({this.changeZero});

  @override
  _SearchLowonganState createState() => _SearchLowonganState();
}

class _SearchLowonganState extends State<SearchLowongan> {
  String valspesialisasi, valJurusan, valLokasi, valtipe;

  var InSignIn = false;

  // List dataProvinsi = [];
  // void provinsi() async {
  //   Masterview_model().provinsi().then((value) {
  //     setState(() {
  //       dataProvinsi = value;
  //     });
  //   });
  // }

  List datawilayah = [];
  void getwilayah() async {
    KarirViewModel().wilayah_karir().then((value) {
      setState(() {
        datawilayah = value == null ? [] : value;
        print('apasih: ' + datawilayah[0].nama.toString());
      });
    });
  }

  List<MasterJurusanModel> dataJurusan = new List();
  void jurusan() async {
    KarirViewModel().karir_pendidikan().then((value1) {
      setState(() {
        dataJurusan = value1 == null ? [] : value1;
      });
    });
  }

  List<SpesialisasiModel> dataSpesialisasi = new List();
  void getSpesialisasi() async {
    KarirViewModel().karir_spesialisasi().then((value1) {
      setState(() {
        dataSpesialisasi = value1 == null ? [] : value1;
      });
    });
  }

  // List<KelasModel> datakelas = new List();
  // void getkelas() async {
  //   Masterview_model().masterkelas().then((value2) {
  //     setState(() {
  //       datakelas = value2 == null ? [] : value2;
  //     });
  //   });
  // }

  List<SmbModel> datakarir_tipe = new List();
  void getKarirTipe() async {
    KarirViewModel().karir_tipe().then((value1) {
      setState(() {
        datakarir_tipe = value1;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //getSpesialisasi();
    //jurusan();
    getKarirTipe();
    getwilayah();
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
                    child: datakarir_tipe.length != 0
                        ? DropdownButton(
                            isExpanded: true,
                            value: valtipe,
                            hint: Text(
                              "Semua Tipe",
                            ),
                            items: datakarir_tipe.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item.name,
                                ),
                                value: item.initial.toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valtipe = value;
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
                    child: datawilayah.length != 0
                        ? DropdownButton(
                            isExpanded: true,
                            value: valLokasi,
                            hint: Text(
                              "Semua Wilayah",
                            ),
                            items: datawilayah.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item.nama,
                                ),
                                value: item.nama.toString(),
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
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: dataJurusan.length != 0
                  //       ? DropdownButton(
                  //           isExpanded: true,
                  //           value: valJurusan,
                  //           hint: Text(
                  //             "Semua Pendidikan",
                  //           ),
                  //           items: dataJurusan.map((item) {
                  //             return DropdownMenuItem(
                  //               child: Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     item.jenjang,
                  //                   ),
                  //                   Text(" - "),
                  //                   Flexible(
                  //                     child: Text(
                  //                       item.nama,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               value: item.id.toString() +
                  //                   "X" +
                  //                   item.kode.toString(),
                  //             );
                  //           }).toList(),
                  //           onChanged: (value) {
                  //             setState(() {
                  //               valJurusan = value;
                  //             });
                  //           },
                  //         )
                  //       : Container(
                  //           child: Shimmer.fromColors(
                  //             baseColor: Colors.grey[350],
                  //             highlightColor: Colors.white,
                  //             child: Container(
                  //                 height: 48,
                  //                 width: double.infinity,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color: Colors.grey[350])),
                  //           ),
                  //         ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: dataSpesialisasi.length != 0
                  //       ? DropdownButton(
                  //           isExpanded: true,
                  //           value: valspesialisasi,
                  //           hint: Text(
                  //             "Semua Spesialisasi",
                  //           ),
                  //           items: dataSpesialisasi.map((item) {
                  //             return DropdownMenuItem(
                  //               child: Text(
                  //                 item.nama,
                  //               ),
                  //               value: item.nama,
                  //             );
                  //           }).toList(),
                  //           onChanged: (value) {
                  //             setState(() {
                  //               valspesialisasi = value;
                  //             });
                  //           },
                  //         )
                  //       : Container(
                  //           child: Shimmer.fromColors(
                  //             baseColor: Colors.grey[350],
                  //             highlightColor: Colors.white,
                  //             child: Container(
                  //                 height: 48,
                  //                 width: double.infinity,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     color: Colors.grey[350])),
                  //           ),
                  //         ),
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: datawilayah.length != 0
                  ? Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 38,
                      child: InSignIn
                          ? SpinKitFadingCircle(color: orenColor)
                          : EduButton(
                              onPressed: () {
                                var arr = valJurusan != null
                                    ? valJurusan.split('X')
                                    : ["", ""];
                                jurusan_id = arr[0];
                                jurusan_kode = arr[1];
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            (SearchLowonganHasil(
                                              valwilayah: valLokasi == null
                                                  ? ''
                                                  : valLokasi,
                                              valpendidikan:
                                                  jurusan_kode == null
                                                      ? ""
                                                      : jurusan_kode,
                                              valspesialisasi:
                                                  valspesialisasi == null
                                                      ? ''
                                                      : valspesialisasi,
                                              valtipe: valtipe == null
                                                  ? ''
                                                  : valtipe,
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
      ),
    );
  }
}
