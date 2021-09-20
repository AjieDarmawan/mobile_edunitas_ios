part of 'me_partnerdonasi.dart';

class DonasiListDetail extends StatefulWidget {
  String seolink, keycode;
  DonasiListDetail({this.seolink, this.keycode});
  @override
  _DonasiListDetailState createState() => _DonasiListDetailState();
}

class _DonasiListDetailState extends State<DonasiListDetail> {
  Widget shimmerLoading() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350],
          highlightColor: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
            ],
          ),
        ),
      ),
    ));
  }

  DonasiMePatnerDetail datadonaturdetail;
  List<DonaturListData> listdonatur;
  int datakabar_leng = 0;

  DonasiDetailModel datadonasi;
  double _percent = 0.0;
  String _cid = "";
  void getdonasidetail(seolink) {
    Donasiview_model().getDetail(seolink).then((value1) {
      //handled
      setState(() {
        datadonasi = value1 == null ? null : value1;
        _cid = datadonasi.cid;
        _loading = false;

        getdonaturlist(_cid.toString());
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  var _stillhandling = false;
  void onErrHandling(erro) {
    print("do_home_err: " + erro.toString());
    var _error_val_cather = erro.toString().substring(0, 49);
    if (_stillhandling == false) {
      setState(() {
        _stillhandling = true;
      });
      if (_error_val_cather.contains("SocketException")) {
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
                  _stillhandling = false;
                  getdonasidetail(widget.seolink);
                  Navigator.of(context).pop();
                },
                buttonText: 'Muat Ulang',
              ),
            )).show(context);
      }
    }
  }

  var _loading = false;

  List<DonaturListModel> datadonatur;
  int datadonatur_leng = 0;
  void getdonaturlist(cid) {
    Donasiview_model().getDonaturList(cid.toString()).then((value1) {
      //handled
      setState(() {
        datadonatur = value1 == null ? [] : value1;
        // datadonatur_leng =
        //     datadonatur == null ? 0 : datadonatur.length; //is this even list
        _loading = false;
      });
    }).catchError((erro) {
      setState(() {
        onErrHandling(erro);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getdonasidetail(widget.seolink);

    //getdonasidetail(cid);
  }

  var dummydata = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Judul Detail Galang Dana',
          //
          style: whiteFontStyle.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EduButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (PencairanDanaDonasi(
                                        seolink:
                                            widget.seolink.toString() == null
                                                ? ""
                                                : widget.seolink.toString(),
                                        keycode: widget.keycode,
                                      ))));
                        },
                        buttonText: 'Cairkan Donasi',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      EduButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (MePostKabar(
                                        keycode: widget.keycode, cid: _cid.toString(),
                                      ))));
                        },
                        buttonText: 'Post Kabar',
                      ),
                    ],
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: datadonatur == null
                  ? shimmerLoading()
                  : ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: datadonatur.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _donatur = datadonatur[index];
                        // var _donatur_image =
                        // datadonatur[index].pict == null
                        //     ? ""
                        //     : datadonatur[index].pict;
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _donatur.donaturname,
                                        style: blackFontStyle3,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Nominal : ",
                                            style: blackFontStyle3,
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0,
                                                    locale: 'id-ID')
                                                .format(double.parse(
                                                    _donatur.price)),
                                            style: blueFontStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(_donatur.crdt)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              _donatur.textmessage,
                              style: blackFontStyle3,
                            ),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
