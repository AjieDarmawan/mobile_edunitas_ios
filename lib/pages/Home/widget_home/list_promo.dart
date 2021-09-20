part of 'widget_home.dart';

class ListPromo extends StatefulWidget {
  final String kodekampus;
  // final int namaspb, namaspp, totalbiaya, namakonversi;
  ListPromo({this.kodekampus});

  @override
  _ListPromoState createState() => _ListPromoState();
}

class _ListPromoState extends State<ListPromo> {
  int selectedIndex;
  String redeem;
  var datapromosi = new List();
  var valtglhingga;
  void getpromositerbaru() {
    Eduinfoview_model().getPromositerbarudaftar().then((value1) {
      setState(() {
        datapromosi = value1;
        valtglhingga =
            datapromosi[0].hingga == null ? "" : datapromosi[0].hingga;
        print("datapromosi: ${datapromosi.length}");
        print("valtglhingga: " + valtglhingga);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getpromositerbaru();
  }

  void check() {
    print("status");
    Eduinfoview_model()
        .check_promo("${redeem}", widget.kodekampus)
        .then((value) {
      StatusModel data = value;
      print("statuss${data}");
      if (data.status == 200) {
        Fluttertoast.showToast(
            msg: "Kode Promo berhasil digunakan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);

        Navigator.pop(context, '${redeem}#${data.etc}#1');
      } else if (data.status == 404) {
        Fluttertoast.showToast(
            msg: "Kode Promo Tidak ditemukan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        Navigator.pop(context, '${redeem}#${data.etc}#2');
      } else if (data.status == 400) {
        Fluttertoast.showToast(
            msg: "Kode Promo Tidak Bisa gunakan ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        Navigator.pop(context, '${redeem}#${data.etc}#3');
      } else {
        Fluttertoast.showToast(
            msg: "Kode Promo Tidak Bisa gunakann ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        Navigator.pop(context, '${redeem}#${data.etc}#3');
      }

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => DaftarNonLogin(

      //             //session
      //             varpendidikan: widget.varpendidikan == null
      //                 ? ""
      //                 : widget.varpendidikan.toString(),
      //             varnama:
      //                 widget.varnama == null ? "" : widget.varnama.toString(),
      //             varnohp:
      //                 widget.varnohp == null ? "" : widget.varnohp.toString(),
      //             varnowa:
      //                 widget.varnowa == null ? "" : widget.varnowa.toString(),
      //             campus: widget.campus,
      //             angkatan: widget.angkatan,
      //             tahunangkatan: widget.tahunangkatan,
      //             wilayah: widget.wilayah,
      //             namakonversi:
      //                 widget.namakonversi == null ? "" : widget.namakonversi,
      //             kodejurusan: widget.kodejurusan,
      //             kodeprogram: widget.kodeprogram,
      //             namaJurusan: widget.namaJurusan,
      //             namalulusan: widget.namalulusan,
      //             namajaket: widget.namajaket,
      //             namaspb: widget.namaspb,
      //             namaspp: widget.namaspp,
      //             namaformulir: widget.namaformulir,
      //             programperkuliahan: widget.programperkuliahan,
      //             namakelompok: widget.namakelompok,
      //             namakelaswaktu: widget.namakelaswaktu,
      //             namakelassingkatan: widget.namakelassingkatan,
      //             waktuspb: widget.waktuspb.toString() == null
      //                 ? ''
      //                 : widget.waktuspb.toString(),
      //             angsuranspb: widget.angsuranspb.toString() == null
      //                 ? ''
      //                 : widget.angsuranspb.toString(),
      //             waktuspp: widget.waktuspp.toString() == null
      //                 ? ''
      //                 : widget.waktuspb.toString(),
      //             angsuranspp: widget.angsuranspp.toString() == null
      //                 ? ''
      //                 : widget.angsuranspp.toString(),
      //             totalbiaya: widget.totalbiaya,
      //               redeem: "50RegEdu",
      //         diskon_redeem: "0.5",
      //         key_redeem: "1",)));
    });
  }

  @override
  Widget build(BuildContext context) {
    print("redeem${redeem}");

    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Pilih Promo",
          style: whiteFontStyle,
        ),
        backgroundColor: mainColor1,
      ),
      body: Column(
        children: [
          Expanded(
            child: datapromosi.length == 0
                ? Center(child: CircularProgressIndicator())
                : datapromosi[0].cid=="tes" ? Center(child:Text("Sedang Tidak Ada Promo")): ListView.builder(
                    shrinkWrap: true,
                    itemCount: datapromosi.length,
                    itemBuilder: (context, index) {
                      final xdatapromosi = datapromosi[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            redeem = xdatapromosi.poinreedem;
                            //redeem = xdatapromosi.poinreedem;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: mainColor1),
                              color: selectedIndex == index
                                  ? Colors.blue[100]
                                  : null,
                            ),
                            margin: EdgeInsets.all(16),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(xdatapromosi.title,
                                        style: blueFontStyle.copyWith(
                                            fontSize: 16)),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Hingga: ${xdatapromosi.hingga}",
                                          style: blackFontStyle3,
                                        ),
                                        Text(xdatapromosi.poinreedem,
                                            style: orenFontStyle),
                                      ],
                                    ),
                                  ]),
                            )),
                      );
                    }),
          ),
          SizedBox(height: 64)
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 0.0),
                blurRadius: 3.0)
          ],
        ),
        height: 64,
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 40,
          child: EduButton(
            buttonText: "Gunakan Promo",
            onPressed: () {
              check();
            },
          ),
        )),
      ),
    );
  }
}
