part of 'widget_home.dart';

class SearchProdi extends StatefulWidget {
  SearchProdi({Key key}) : super(key: key);

  @override
  _SearchProdiState createState() => _SearchProdiState();
}

class _SearchProdiState extends State<SearchProdi> {
  String valLokasi;
  var InSignIn = false;

  List dataunitarea = [];
  void getunitrea() async {
    Masterview_model().unitarea().then((value) {//handled
      setState(() {
        dataunitarea = value == null ? [] : value;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  void onErrHandling(erro){
    print("do_login_err: "+erro.toString());
    if(erro.toString().contains("SocketException")){
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
                getunitrea();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  var hintlokasi;
  void modalBottomSearchProdi(context, datalist) async{
    final result = await showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return ContentModalSearchProdi(datalist: datalist,);
        });
    setState(() {
      valLokasi = result[0].toString();
      hintlokasi = result[1].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getunitrea();
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
                        modalBottomSearchProdi(context, dataunitarea);
                    },
                    // leading: Text("Provinsi",
                    //     style: blackFontStyle1.copyWith(fontSize: 16)),
                    leading: Text(
                      dataunitarea.length != 0
                          ? hintlokasi == null
                          ? 'Pilih Wilayah'
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 48),
            child: dataunitarea.length != 0
                ? Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 48,
                    child: InSignIn
                        ? SpinKitFadingCircle(color: orenColor)
                        : EduButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SearchProdiHasil(
                                            nilaiunitarea: valLokasi == null
                                                ? ''
                                                : valLokasi,

                                            // nilai:"1",
                                          ))));
                            },
                            buttonText: "Cari",
                          ))
                : Container(),
          ),
        ],
      ),
    );
  }
}

class ContentModalSearchProdi extends StatefulWidget{
  var datalist;
  ContentModalSearchProdi({Key key, @required this.datalist}): super(key : key);

  @override
  ContentModalSearchProdiState createState() => new ContentModalSearchProdiState();

}

class ContentModalSearchProdiState extends State<ContentModalSearchProdi>{

  TextEditingController etsearchlokasi = new TextEditingController();
  List<UnitAreaModel> fdataListLokasi;
  List<UnitAreaModel> dataListLokasi;
  List<String> result = ["", ""];
  int listLenght = 0;

  @override
  initState(){
    super.initState();
    fdataListLokasi = widget.datalist;
    dataListLokasi = widget.datalist;
    listLenght = fdataListLokasi.length;
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
                controller: etsearchlokasi,
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
                    hintText: "Cari Wilayah"),
                onChanged: (string) {
                  setState(() {
                    fdataListLokasi = dataListLokasi
                        .where((u) => (u.nama
                        .toLowerCase()
                        .contains(string.toLowerCase())))
                        .toList();
                    listLenght = fdataListLokasi.length;
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
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Shimmer.fromColors(
                    //     baseColor: Colors.grey[350],
                    //     highlightColor: Colors.white,
                    //     child: Container(
                    //         height: 48,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //             BorderRadius.circular(10),
                    //             color: Colors.grey[350])),
                    //   ),
                    // ),
                  ],
                )
                    : ListView.builder(
                  itemCount: listLenght,
                  itemBuilder: (BuildContext context, int index) {
                    var lastDataLokasi;
                    lastDataLokasi = fdataListLokasi[index];

                    return InkWell(
                      onTap: () {
                        setState(() {
                          result[0]= lastDataLokasi.id.toString();
                          result[1]= lastDataLokasi.nama.toString();
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
                            Text(lastDataLokasi.nama,
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
