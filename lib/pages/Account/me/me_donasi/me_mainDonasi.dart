part of 'me_donasi.dart';

class MeDonasi extends StatefulWidget {
  final String keycode;
  MeDonasi({
    this.keycode,
  });

  @override
  _MeDonasiState createState() => _MeDonasiState();
}

class _MeDonasiState extends State<MeDonasi> {
  List<DonasiMydesk> datadonasi = new List();
  void getDonasiMydesk2() async {
    Donasiview_model().getDonasiMydesk(widget.keycode).then((value1) {
      setState(() {
        datadonasi = value1 == null ? [] : value1;
      });
    });
  }

  @override
  void initState() {
    getDonasiMydesk2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Donasi Saya',
          style: whiteFontStyle,
        ),
      ),
      body: datadonasi.length == 0
          ? Center(
              child: SpinKitThreeBounce(color: mainColor1),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 16.0),
              itemCount: datadonasi.length,
              itemBuilder: (context, index) {
                final xdatadonasi = datadonasi[index];
                return xdatadonasi.donaturname.toString() == "hendler_null"
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 250,
                              child:
                                  Image.asset("assets/noTransactionxhdpi.png"),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                              "Tidak Ada Donasi",
                              style: blueFontStyle2Bold,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Anda belum memiliki daftar donasi",
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 3.0)
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  xdatadonasi.judul.toString(),
                                  style: blueFontStyleBold,
                                ),
                                Divider(
                                  height: 24,
                                  thickness: 1,
                                ),
                                Text(
                                  xdatadonasi.textmessage.toString(),
                                  style: blackFontStyle1.copyWith(fontSize: 14),
                                ),
                                Divider(
                                  height: 24,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Donatur :',
                                            style: blackFontStyle1.copyWith(
                                                fontSize: 12),
                                          ),
                                          Text(
                                            xdatadonasi.donaturname.toString(),
                                            style: blueFontStyle.copyWith(
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Rp.${xdatadonasi.price.toString()}',
                                        style: whiteFontStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[600]),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                color: yellowColor,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text(
                                xdatadonasi.crdt.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: blueFontStyleBold.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
    );
  }
}
