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
                  padding: EdgeInsets.all(8),
                  child: dataunitarea.length != 0
                      ? DropdownButton(
                          isExpanded: true,
                          value: valLokasi,
                          hint: Text(
                            "Pilih Wilayah",
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
