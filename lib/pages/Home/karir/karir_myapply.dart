part of 'karir.dart';

class KarirMyapply extends StatefulWidget {
  final String keycode, namalengkap;
  KarirMyapply({
    this.keycode,
    this.namalengkap,
  });
  @override
  _KarirMyapplyState createState() => _KarirMyapplyState();
}

class _KarirMyapplyState extends State<KarirMyapply> {
  List<RiwayatLamaranModel> datariwayatlamaran = new List();
  void getRiwayatlamaran() async {
    KarirViewModel().riwayat_lamaran(widget.keycode).then((value2) {//handled
      setState(() {
        //datariwayatlamaran = value2;
        datariwayatlamaran = value2 == null ? [] : value2;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  List<ShowPengalamanModel> datapengalaman = new List();
  void getPengalaman() async {
    KarirViewModel().show_pengalaman(widget.keycode.toString()).then((value2) {//handled
      setState(() {
        datapengalaman = value2;
        valnamaperusahaan = datapengalaman[0].nama;
        valposisi = datapengalaman[0].posisiNama;
        valspesialisasi = datapengalaman[0].spesialisasiNama;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var valpenghasilan, valwilayah, valdeskripsi;
  List<ShowInfotambahanModel> datainfo = new List();
  void getInfo() async {
    KarirViewModel()
        .show_info_tambahan(widget.keycode.toString()).then((value2) {//handled
      setState(() {
        datainfo = value2;
        valpenghasilan = datainfo[0].penghasilan;
        valwilayah = datainfo[0].wilayah;
        valdeskripsi = datainfo[0].deskripsi;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var etkodepos,
      etalamat,
      etnamainstansi,
      etnilaiakhir,
      etdari,
      hintprov,
      hintkabkota,
      hintkec,
      hintdesa,
      hintpendidikan,
      valpendidikan,
      valprov,
      valkabkota,
      valkec,
      valdesa,
      valtahunkelulusan;
  void dataPendidikan() {
    UserViewModel().pendidikan_detail(widget.keycode.toString()).then((value) {//handled
      DetailPendidikanModel data = value;

      hintprov = data.wilayahProv;
      hintkabkota = data.wilayahKota;
      hintkec = data.wilayahKec;
      hintdesa = data.wilayahDesa;
      hintpendidikan = data.namaleveledu;

      valpendidikan = data.leveledu;
      valprov = data.provinsi;
      valkabkota = data.kota;
      valkec = data.kecamatan;
      valdesa = data.kelurahan;

      valtahunkelulusan = data.thnlulus;
      etkodepos = data.kodepos;
      etalamat = data.alamat;
      etnamainstansi = data.nama;
      etnilaiakhir = data.nilaiakhir;
      etdari = data.dari;
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
                getInfo();
                getPengalaman();
                dataPendidikan();
                getRiwayatlamaran();
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
    getInfo();
    getPengalaman();
    dataPendidikan();
    getRiwayatlamaran();
  }

  @override
  Widget build(BuildContext context) {
    print("datariwayatlamaran${datariwayatlamaran}");
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        title: Text("My Apply", style: whiteFontStyle),
        backgroundColor: mainColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[100],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cek status lamaran yang sudah anda Apply",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Anda bisa melihat status lamaran, jadwal jobfair yang anda ikuti, batalkan Apply lamaran",
                    style: blueFontStyle,
                  ),
                ],
              ),
            ),
            StepList(),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue[50], width: 2)),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      Icons.business_center_outlined,
                      size: 56,
                      color: Colors.blue[50],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 56,
                      color: Colors.blue[50],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.namalengkap == null ? "" : widget.namalengkap,
                        style: blueFontStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        etnamainstansi == null ? "" : etnamainstansi.toString(),
                        style: blackFontStyle2.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        valnamaperusahaan == null
                            ? ""
                            : valnamaperusahaan.toString(),
                        style: blackFontStyle2.copyWith(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      Divider(
                        height: 24,
                      ),
                      Text(
                        valspesialisasi == null
                            ? ""
                            : valspesialisasi.toString(),
                        style: blueFontStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        valwilayah == null ? "" : valwilayah.toString(),
                        style: blackFontStyle2.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      valpenghasilan == null
                          ? Text("")
                          : Text(
                              NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id-ID')
                                  .format(valpenghasilan),
                              style: blackFontStyle2.copyWith(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TabelHistory(xriwayatlamaran: datariwayatlamaran),
            //
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: EduButton(buttonText: "Download", onPressed: () {}),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class StepList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: mainColor1,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Icon(
                        Icons.schedule_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 24,
                    width: 4,
                    color: yellowColor,
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap 1",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text("Lamaran Anda belum dilihat (menunggu)",
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          //2
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: mainColor1,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Icon(
                        Icons.visibility_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 24,
                    width: 4,
                    color: yellowColor,
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap 2",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text("Lamaran Anda telah dilihat oleh perusahaan",
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          //3
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: mainColor1,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Icon(
                        Icons.question_answer_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 24,
                    width: 4,
                    color: yellowColor,
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap 3",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text("Anda lolos lanjut tahap interview",
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          //4
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: mainColor1,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Icon(
                        Icons.check_circle_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 24,
                    width: 4,
                    color: yellowColor,
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap 4",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text("Anda diterima bekerja di perusahaan",
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          //
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: mainColor1,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahap 5",
                    style: blueFontStyleBold,
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text("Lamaran anda ditolak oleh perusahaan",
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabelHistory extends StatelessWidget {
  TabelHistory({this.xriwayatlamaran});

  final List<RiwayatLamaranModel> xriwayatlamaran;

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text(
          'No',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
        numeric: true,
      ),
      DataColumn(
        label: Text(
          'Posisi',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
      ),
      DataColumn(
        label: Text(
          'Instansi',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
      ),
      DataColumn(
        label: Text(
          'Tipe',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
      ),
      DataColumn(
        label: Text(
          'Tanggal',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
      ),
      DataColumn(
        label: Text(
          'Status',
          style: blueFontStyleBold.copyWith(fontSize: 12),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.grey[200];
        },
      ),
      columnSpacing: (MediaQuery.of(context).size.width / 15) * 0.5,
      dataRowHeight: 72,
      columns: _createColumns(),
      rows: xriwayatlamaran
          .map(
            (data) => DataRow(cells: [
              DataCell(Text(
                data.no.toString(),
                style: blackFontStyle1Bold.copyWith(fontSize: 11),
              )),
              DataCell(Text(
                data.lowongan,
                style: blackFontStyle1Bold.copyWith(fontSize: 11),
              )),
              DataCell(Text(
                data.namaPerusahaan,
                style: blackFontStyle1Bold.copyWith(fontSize: 11),
              )),
              DataCell(Text(
                '-',
                style: blackFontStyle1Bold.copyWith(fontSize: 11),
              )),
              DataCell(Text(
                data.tanggal,
                style: blackFontStyle1Bold.copyWith(fontSize: 11),
              )),
              DataCell(
                Container(
                  child: data.status == "0"
                      ? Icon(
                          Icons.schedule_outlined,
                          size: 24,
                          color: mainColor1,
                        )
                      : data.status == "1"
                          ? Icon(
                              Icons.visibility_outlined,
                              size: 24,
                              color: mainColor1,
                            )
                          : data.status == "2"
                              ? Icon(
                                  Icons.question_answer_outlined,
                                  size: 24,
                                  color: mainColor1,
                                )
                              : data.status == "3"
                                  ? Icon(
                                      Icons.check_circle_outlined,
                                      size: 24,
                                      color: mainColor1,
                                    )
                                  : Icon(
                                      Icons.cancel_outlined,
                                      size: 24,
                                      color: mainColor1,
                                    ),
                ),
              ),
            ]),
          )
          .toList(),
    );
  }
}
