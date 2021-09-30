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

  var hintkat;
  var hintken;
  void modalBottomSearchDonasi(context, datalist, cat) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModalSearchDonasi(datalist: datalist, cat: cat,);
        });
    setState(() {
      if(cat=="kategori"){
        valkategori = result[0].toString();
        hintkat = result[1].toString();
      }else if(cat=="kendala"){
        valkendala = result[0].toString();
        hintken = result[1].toString();
      }

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
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor1, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        if (semua_kategori.length != 0)
                          modalBottomSearchDonasi(context, semua_kategori, "kategori");
                      },
                      leading: Text(
                        semua_kategori.length != 0
                            ? hintkat == null
                            ? 'Semua Kategori'
                            : hintkat
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
                        if (datakendala.length != 0)
                          modalBottomSearchDonasi(context, datakendala, "kendala");
                      },
                      leading: Text(
                        datakendala.length != 0
                            ? hintken == null
                            ? 'Semua Kendala'
                            : hintken
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

class ContentModalSearchDonasi extends StatefulWidget{
  var datalist;
  String cat;
  ContentModalSearchDonasi({Key key, @required this.datalist, this.cat}): super(key : key);

  @override
  ContentModalSearchDonasiState createState() => new ContentModalSearchDonasiState();

}

class ContentModalSearchDonasiState extends State<ContentModalSearchDonasi>{

  TextEditingController etsearchkategori = new TextEditingController();
  TextEditingController etsearchkendala = new TextEditingController();
  List<SmbModel> fdataList;
  List<SmbModel> dataList;
  List<String> result = ["", ""];
  int listLenght = 0;

  @override
  initState(){
    super.initState();
    fdataList = widget.datalist;
    dataList = widget.datalist;
    listLenght = fdataList.length;
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
                  widget.cat=="kategori"
                      ? etsearchkategori
                      : etsearchkendala,
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
                      fdataList = dataList
                          .where((u) => (u.name
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                      listLenght = fdataList.length;
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
                      SmbModel lastData;
                      lastData = fdataList[index];

                      return InkWell(
                        onTap: () {
                          setState(() {
                            result[0]= lastData.initial.toString();
                            result[1]= lastData.name.toString();
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
                              Text(lastData.name.toString(),
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
