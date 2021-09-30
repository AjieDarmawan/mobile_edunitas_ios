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

  var hintlokasi;
  var hintkelas;
  var hintprodi;
  void modalBottomSearchKampus(context, datalist, cat) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModalSearchKampus(datalist: datalist, cat: cat,);
        });
    setState(() {
      if(cat=="lokasi"){
        valLokasi = result[0].toString();
        hintlokasi = result[1].toString();
      }else if(cat=="kelas"){
        valKelas = result[0].toString();
        hintkelas = result[1].toString();
      }else if(cat=="prodi"){
        hintprodi = result[0].toString();
        valJurusan = result[1].toString();
      }
    });
  }

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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor1, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            if (dataunitarea.length != 0)
                              modalBottomSearchKampus(context, dataunitarea, "lokasi");
                          },
                          // leading: Text("Provinsi",
                          //     style: blackFontStyle1.copyWith(fontSize: 16)),
                          leading: Text(
                            dataunitarea.length != 0
                                ? hintlokasi == null
                                ? 'Pilih Lokasi'
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
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: mainColor1, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      if (datakelas.length != 0)
                        modalBottomSearchKampus(context, datakelas, "kelas");
                    },
                    // leading: Text("Provinsi",
                    //     style: blackFontStyle1.copyWith(fontSize: 16)),
                    leading: Text(
                      datakelas.length != 0
                          ? hintkelas == null
                          ? 'Pilih Kelas'
                          : hintkelas
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
                      if (dataJurusan.length != 0)
                        modalBottomSearchKampus(context, dataJurusan, "prodi");
                    },
                    // leading: Text("Provinsi",
                    //     style: blackFontStyle1.copyWith(fontSize: 16)),
                    leading: Text(
                      dataJurusan.length != 0
                          ? hintprodi == null
                          ? 'Pilih Program Studi'
                          : hintprodi
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


class ContentModalSearchKampus extends StatefulWidget{
  var datalist;
  String cat;
  ContentModalSearchKampus({Key key, @required this.datalist, this.cat}): super(key : key);

  @override
  ContentModalSearchKampusState createState() => new ContentModalSearchKampusState();

}

class ContentModalSearchKampusState extends State<ContentModalSearchKampus>{

  TextEditingController etsearchlokasi = new TextEditingController();
  TextEditingController etsearchkelas = new TextEditingController();
  TextEditingController etsearchprodi = new TextEditingController();
  List<UnitAreaModel> fdataListLokasi;
  List<UnitAreaModel> dataListLokasi;
  List<KelasModel> fdataListKelas;
  List<KelasModel> dataListKelas;
  List<MasterJurusanModel> fdataListProdi;  
  List<MasterJurusanModel> dataListProdi;   
  List<String> result = ["", ""];
  int listLenght = 0;

  @override
  initState(){
    super.initState();
    if(widget.cat=="lokasi"){
      fdataListLokasi = widget.datalist;
      dataListLokasi = widget.datalist;
      listLenght = fdataListLokasi.length;
    }else if(widget.cat=="kelas"){
      fdataListKelas = widget.datalist;
      dataListKelas = widget.datalist;
      listLenght = fdataListKelas.length;
    }else if(widget.cat=="prodi"){
      fdataListProdi = widget.datalist;
      dataListProdi = widget.datalist;
      listLenght = fdataListProdi.length;
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
                    : widget.cat=="kelas"
                    ? etsearchkelas
                    : etsearchprodi,
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
                    }else if(widget.cat=="kelas"){
                      fdataListKelas = dataListKelas
                          .where((u) => (u.nama
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                      listLenght = fdataListKelas.length;
                    }else if(widget.cat=="prodi"){
                      fdataListProdi = dataListProdi
                          .where((u) => (u.nama
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                      listLenght = fdataListProdi.length;
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
                    var lastDataKelas;
                    var lastDataProdi;

                    if(widget.cat=="lokasi"){
                      lastDataLokasi = fdataListLokasi[index];
                    }else if(widget.cat=="kelas"){
                      lastDataKelas = fdataListKelas[index];
                    }else if(widget.cat=="prodi"){
                      lastDataProdi = fdataListProdi[index];
                    }

                    return InkWell(
                      onTap: () {
                        setState(() {
                          result[0]= widget.cat=="lokasi"
                              ? lastDataLokasi.id.toString()
                              : widget.cat=="kelas"
                              ? lastDataKelas.singkatan.toString()
                              : lastDataProdi.jenjang.toString()+" - "+lastDataProdi.nama.toString();
                          result[1]= widget.cat=="lokasi"
                              ? lastDataLokasi.nama.toString()
                              : widget.cat=="kelas"
                              ? lastDataKelas.nama.toString()
                              : lastDataProdi.id.toString()+"X"+lastDataProdi.kode.toString();
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
                                : widget.cat=="kelas"
                                ? lastDataKelas.nama
                                : lastDataProdi.jenjang.toString()+" - "+lastDataProdi.nama.toString(),
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
        ),
      ),
    );
  }

}