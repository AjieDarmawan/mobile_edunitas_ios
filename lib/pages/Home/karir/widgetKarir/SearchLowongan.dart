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

  var hintlokasi;
  var hinttipe;
  void modalBottomSearchKampus(context, datalist, cat) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModalSearchLowongan(datalist: datalist, cat: cat,);
        });
    setState(() {
      if(cat=="lokasi"){
        valLokasi = result[0].toString();
        hintlokasi = result[1].toString();
      }else if(cat=="tipe"){
        valtipe = result[0].toString();
        hinttipe = result[1].toString();
      }
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
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        if (datakarir_tipe.length != 0)
                          modalBottomSearchKampus(context, datakarir_tipe, "tipe");
                      },
                      // leading: Text("Provinsi",
                      //     style: blackFontStyle1.copyWith(fontSize: 16)),
                      leading: Text(
                        datakarir_tipe.length != 0
                            ? hinttipe == null
                            ? 'Semua Tipe'
                            : hinttipe
                            : 'Mohon tunggu..',
                        // "Pilih Wilayah",
                        style: TextStyle(color: mainColor1, fontSize: 16),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: blackColor,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        if (datawilayah.length != 0)
                          modalBottomSearchKampus(context, datawilayah, "lokasi");
                      },
                      // leading: Text("Provinsi",
                      //     style: blackFontStyle1.copyWith(fontSize: 16)),
                      leading: Text(
                        datawilayah.length != 0
                            ? hintlokasi == null
                            ? 'Semua Lokasi'
                            : hintlokasi
                            : 'Mohon tunggu..',
                        // "Pilih Wilayah",
                        style: TextStyle(color: mainColor1, fontSize: 16),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: blackColor,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                      padding: EdgeInsets.only(bottom: 48),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 48,
                        child: InSignIn
                            ? SpinKitFadingCircle(color: orenColor)
                            : EduButton(
                          onPressed: () {
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentModalSearchLowongan extends StatefulWidget{
  var datalist;
  String cat;
  ContentModalSearchLowongan({Key key, @required this.datalist, this.cat}): super(key : key);

  @override
  ContentModalSearchLowonganState createState() => new ContentModalSearchLowonganState();

}

class ContentModalSearchLowonganState extends State<ContentModalSearchLowongan>{

  TextEditingController etsearchlokasi = new TextEditingController();
  TextEditingController etsearchtipe = new TextEditingController();
  List<MasterDaerahModel> fdataListLokasi;
  List<MasterDaerahModel> dataListLokasi;
  List<SmbModel> fdataListTipe;
  List<SmbModel> dataListTipe;
  List<String> result = ["", ""];
  int listLenght = 0;

  @override
  initState(){
    super.initState();
    if(widget.cat=="lokasi"){
      fdataListLokasi = widget.datalist;
      dataListLokasi = widget.datalist;
      listLenght = fdataListLokasi.length;
    }else if(widget.cat=="tipe"){
      fdataListTipe = widget.datalist;
      dataListTipe = widget.datalist;
      listLenght = fdataListTipe.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: Column(
          children: [
            Container(
              height: 48,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  height: 4,
                  width: 32,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: mainColor1, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: mainColor1,
                controller:
                widget.cat=="lokasi"
                    ? etsearchlokasi
                    : etsearchtipe,
                keyboardType: TextInputType.text,
                //enabled: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 10, bottom: 5, top: 5, right: 10),
                    hintText: "Cari "+widget.cat),
                onChanged: (string) {
                  setState(() {
                    if(widget.cat=="lokasi"){
                      fdataListLokasi = dataListLokasi
                          .where((u) => (u.nama
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                      listLenght = fdataListLokasi.length;
                    }else if(widget.cat=="tipe"){
                      fdataListTipe = dataListTipe
                          .where((u) => (u.name
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                      listLenght = fdataListTipe.length;
                    }
                  });
                },
              ),
            ),
            Container(
              child: Expanded(
                child: listLenght == 0
                    ?
                Column(
                  children: [
                    Text("Tidak ditemukan",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: whiteFontStyle.copyWith(
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.white38,
                      thickness: 1,
                    ),
                  ],
                )
                    : ListView.builder(
                  itemCount: listLenght,
                  itemBuilder: (BuildContext context, int index) {
                    var lastDataLokasi;
                    SmbModel lastDataTipe;

                    if(widget.cat=="lokasi"){
                      lastDataLokasi = fdataListLokasi[index];
                    }else if(widget.cat=="tipe"){
                      lastDataTipe = fdataListTipe[index];
                    }

                    return InkWell(
                      onTap: () {
                        setState(() {
                          result[0]= widget.cat=="lokasi"
                              ? lastDataLokasi.id.toString()
                              : lastDataTipe.initial.toString();
                          result[1]= widget.cat=="lokasi"
                              ? lastDataLokasi.nama.toString()
                              : lastDataTipe.name.toString();
                          Navigator.pop(context, result);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 24, top: 15),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(widget.cat=="lokasi"
                                ? lastDataLokasi.nama
                                : lastDataTipe.name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: whiteFontStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Colors.white38,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        )
      ),
    );
  }

}

