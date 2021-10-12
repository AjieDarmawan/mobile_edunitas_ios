part of 'pengaturan.dart';

class ShowPengalaman extends StatefulWidget {
  final String keycode;
  ShowPengalaman({
    this.keycode,
  });

  @override
  _ShowPengalamanState createState() => _ShowPengalamanState();
}

class _ShowPengalamanState extends State<ShowPengalaman> {
  List<ShowPengalamanModel> datapengalaman = new List();
  void getPengalaman() async {
    KarirViewModel().show_pengalaman(widget.keycode.toString()).then((value2) {//handled
      setState(() {
        datapengalaman = value2;
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
                getPengalaman();
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
    getPengalaman();
  }

  Future<bool> _backPressed() {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListDatadiri(
              keycode: widget.keycode == null ? "" : widget.keycode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: _backPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          title: Text(
            'Pengalaman',
            style: whiteFontStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue[50], width: 2)),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.folder_shared,
                        size: 56,
                        color: Colors.blue[50],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tingkat pengalaman",
                          style: blueFontStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Untuk meningkatkan kesempatan Anda dipilih oleh perusahaan Tambahkan beberapa pengalaman anda pada pekerjaan sebelumnya.",
                          style: blackFontStyle2.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Pengalaman',
                              style: blackFontStyle1.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 32,
                            child: EduButtonSecond(
                              buttonText: "Tambah",
                              onPressed: () {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PenglamanDatadiri(
                                    keycode: widget.keycode == null
                                        ? ""
                                        : widget.keycode.toString(),
                                  ),
                                ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    datapengalaman == null
                        ? Container(
                            height: 16,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: datapengalaman.length,
                            itemBuilder: (context, index) {
                              final xpengalaman = datapengalaman[index];

                              return Column(
                                children: [
                                  Container(
                                    color: Colors.blue[50],
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${xpengalaman.posisiNama == null ? '' : xpengalaman.posisiNama} ",
                                              style: blueFontStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              modalShow(
                                                  context,
                                                  xpengalaman.id.toString(),
                                                  xpengalaman,
                                                  widget.keycode);
                                            },
                                          )
                                        ]),
                                  ),
                                  Divider(
                                    height: 0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${xpengalaman.nama == null ? "" : xpengalaman.nama} | ${xpengalaman.wilayahKota == null ? '' : xpengalaman.wilayahKota}",
                                          style: blackFontStyle1.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "${xpengalaman.dari == null ? '' : xpengalaman.dari} - ${xpengalaman.hingga == null ? '' : xpengalaman.hingga}"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Industri",
                                              style: blackFontStyle2.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text(
                                                xpengalaman.industriNama == null
                                                    ? ""
                                                    : xpengalaman.industriNama,
                                                style: blueFontStyle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Spesialisasi",
                                              style: blackFontStyle2.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text(
                                                xpengalaman.spesialisasiNama ==
                                                        null
                                                    ? ""
                                                    : xpengalaman
                                                        .spesialisasiNama,
                                                style: blueFontStyle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bidang pekerjaan",
                                              style: blackFontStyle2.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text(
                                                xpengalaman.bidangNama == null
                                                    ? ""
                                                    : xpengalaman.bidangNama,
                                                style: blueFontStyle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Jabatan",
                                              style: blackFontStyle2.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text(
                                                xpengalaman.jabatanNama == null
                                                    ? ""
                                                    : xpengalaman.jabatanNama,
                                                style: blueFontStyle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Gaji bulanan",
                                              style: blackFontStyle2.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                                child: Text(
                                              NumberFormat.currency(
                                                      symbol: 'IDR ',
                                                      decimalDigits: 0,
                                                      locale: 'id-ID')
                                                  .format(xpengalaman.gaji),
                                              style: blueFontStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                            )),
                                          ],
                                        ),
                                        Divider(),
                                        Text(xpengalaman.deskripsi == null
                                            ? ""
                                            : xpengalaman.deskripsi.length >= 10
                                                ? xpengalaman.deskripsi
                                                        .substring(0, 10) +
                                                    '..'
                                                : '')
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void modalShow(context, id, xpengalaman, keycode) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 270,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/dialog/editmdpi.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 32,
                              child: Text(
                                'Lakukan Perubahan',
                                style: blueFontStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Apakah anda yakin ?',
                              style: blackFontStyle3,
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    hapus(context, id);
                                  },
                                  buttonText: "Hapus",
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: EduButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                (editPengalaman(
                                                  keycode: keycode,
                                                  xpengalaman: xpengalaman,
                                                ))));
                                    //edit(context,xpengalaman);
                                  },
                                  buttonText: "Edit",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 48,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<bool> hapus(context, id) {
    KarirViewModel().hapus_pengalaman(id.toString()).then((value) {//handled
      StatusModel data = value;

      print("hapus :" + data.status.toString());
      if (data.status == 200) {
        Navigator.pop(context);
        getPengalaman();
        return Flushbar(
          title: "Berhasil !!",
          message: "Data Sukses Terhapus",
          duration: Duration(seconds: 3),
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
          backgroundColor: Colors.green[600],
        )..show(context);
      } else if (data.status == 404) {
        Navigator.pop(context);
        getPengalaman();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else if (data.status == 400) {
        Navigator.pop(context);
        getPengalaman();
        return Flushbar(
          title: "Maaf !!",
          message: "Gagal Dihapus",
          duration: Duration(seconds: 3),
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
        )..show(context);
      } else {
        print("pengalaman hapus err: " + data.status.toString());
        Navigator.pop(context);
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }
}
