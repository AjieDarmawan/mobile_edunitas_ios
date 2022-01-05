part of 'widget_agensi.dart';

class InformasiPerolehan extends StatefulWidget {
  final String keycode;
  final bool fromsendmhs;

  InformasiPerolehan({
    this.keycode,
    this.fromsendmhs,
  });

  @override
  _InformasiPerolehanState createState() => _InformasiPerolehanState();
}

class _InformasiPerolehanState extends State<InformasiPerolehan> {
  String _id,
      _code,
      _cid,
      _status,
      _unitarea,
      _nama,
      _email,
      _notlp,
      _nowa,
      _crdt;
  List<DaftarMhsRekomenModel> datar_mhs_rekom = new List();

  String _norekening;
  String _namarekening;
  String _label_bank;

  List<String> desk = [
    "Calon Mahasiswa belum mengisi formulir pendaftaran di eduNitas apps / website",
    "Calon Mahasiswa tidak merasa direkomendasikan oleh anda",
    "Calon Mahasiswa telah melengkapi form pendaftaran online tetapi belum melakukan transfer uang pendaftaran",
    "Calon Mahasiswa sudah melakukan transfer uang pendaftaran tapi belum daftar ulang",
    "Calon Mahasiswa selama 60 hari tidak melakukan daftar ulang",
    "Calon Mahasiswa aktif karna sudah melakukan pendaftaran dan daftar ulang",
    "Fee anda sudah di transfer",
    "Terjadi kesalahan pada nomor rekening atau nama bank"
  ];

  List<Color> colorstatus = [
    Colors.blue,
    Colors.red,
    Colors.amber[900],
    Colors.blue[900],
    Colors.blueGrey,
    Colors.green,
    Colors.indigo,
    Colors.pink
  ];

  void getMhsRekomen() async {
    Agentview_model().get_mhs_rekomend_agent(widget.keycode).then((value) {
      //handled
      setState(() {
        datar_mhs_rekom = value == null ? [] : value;
      });
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  var valprogram;
  var program = ["eduCampus", "eduSchool"];
  void modalBottomProgram(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 500,
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
                  height: 452,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      final fdata = program[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            valprogram = fdata.toString();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 24, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fdata,
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
                )
              ],
            ),
          );
        });
  }

  var valstatus;
  var status = [
    "Pending",
    "Reject",
    "Daftar",
    "Non Herreg",
    "Expired",
    "Get",
    "Terbayar",
    "Correction"
  ];
  void modalBottomStatus(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: 500,
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
                  height: 452,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      final fdata = status[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            valstatus = fdata.toString();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 24, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fdata,
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
              ],
            ),
          );
        });
  }

  void getInfoRekening() {
    Agentview_model().getRekening(widget.keycode).then((value) {
      //handled
      setState(() {
        CheckRekeningAgentModel data = value;

        _norekening = data.norekening == null ? "" : data.norekening;
        _namarekening = data.namarekening == null ? "" : data.namarekening;
        _label_bank = data.label_bank == null ? "" : data.label_bank;
      });
    }).catchError((erro) {
      onErrHandling(erro);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.fromsendmhs) {
      Flushbar(
        title: "Berhasil",
        message: "Data Berhasil Disimpan",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.fastOutSlowIn,
        boxShadows: [
          BoxShadow(
              color: Colors.black38, offset: Offset(0.0, 3.0), blurRadius: 3.0)
        ],
        backgroundColor: Colors.green[600],
      )..show(context);
    }
    getMhsRekomen();
    getInfoRekening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          "Informasi Perolehan",
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    //leading: Icon(Icons.credit_card),
                    title: _namarekening == null
                        ? Text("Loading..")
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              _namarekening,
                              style: blueFontStyleBold,
                            ),
                          ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label_bank == null
                            ? Text("")
                            : Text(
                                _label_bank,
                                style: blackFontStyle3.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                        SizedBox(
                          height: 4.0,
                        ),
                        _norekening == null
                            ? Text("")
                            : Text(
                                _norekening,
                                style: blackFontStyle3.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                      ],
                    ),
                    trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(48.0),
                        child: Image.asset('assets/profile/defaultprofil.png')),
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      'Filter Program/Status',
                      style: blueFontStyleBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    leading: Icon(Icons.filter_list, color: mainColor1),
                    title: Text(
                      "Semua Program",
                      style: blackFontStyle2,
                    ),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      modalBottomProgram(context);
                    },
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    leading: Icon(Icons.filter_list, color: mainColor1),
                    title: Text(
                      "Semua Status",
                      style: blackFontStyle2,
                    ),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      modalBottomStatus(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 3.0)
                  ],
                  color: Colors.white),
              child: Column(
                children: [
                  TabelMhsRekomen(
                    xmhsrekomenlist: datar_mhs_rekom,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 8.0),
                    child: Text(
                      'Deskripsi Status',
                      style: blueFontStyleBold,
                    ),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int indx) {
                      return Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 32,
                                width: 100,
                                child: Card(
                                  color: colorstatus[indx],
                                  child: Center(
                                      child: Text(
                                    status[indx],
                                    style: whiteFontStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                flex: 8,
                                child: Text(desk[indx]),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      height: 24.0,
                    ),
                  ),
                  SizedBox(height: 24.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onErrHandling(erro) {
    print("do_agent_err: " + erro.toString());
    if (erro.toString().contains("SocketException")) {
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
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }
}

class TabelMhsRekomen extends StatelessWidget {
  TabelMhsRekomen({this.xmhsrekomenlist});

  //final List<RiwayatLamaranModel> xriwayatlamaran;
  final List<DaftarMhsRekomenModel> xmhsrekomenlist;
  //final List xmhsrekomenlist = [];

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text(
          'Status',
          style: blueFontStyleBold.copyWith(fontSize: 14),
        ),
      ),
      DataColumn(
        label: Text(
          'Nama',
          style: blueFontStyleBold.copyWith(fontSize: 14),
        ),
        //numeric: true,
      ),
      DataColumn(
        label: Text(
          'Kampus',
          style: blueFontStyleBold.copyWith(fontSize: 14),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      dataRowColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.grey[100];
        },
      ),
      columnSpacing: (MediaQuery.of(context).size.width / 5) * 0.5,
      dataRowHeight: 72,
      columns: _createColumns(),
      rows: xmhsrekomenlist
          .map(
            (data) => DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      height: 32,
                      width: 80,
                      child: Card(
                        color: data.status.toString() == '0'
                            ? Colors.blue
                            : data.status.toString() == '1'
                                ? Colors.red
                                : data.status.toString() == '2'
                                    ? Colors.amber[900]
                                    : data.status.toString() == '3'
                                        ? Colors.blue[900]
                                        : data.status.toString() == '4'
                                            ? Colors.blueGrey
                                            : data.status.toString() == '5'
                                                ? Colors.green
                                                : data.status.toString() == '6'
                                                    ? Colors.indigo
                                                    : Colors.pink,
                        child: Center(
                            child: Text(
                          data.status.toString() == '0'
                              ? "Pending"
                              : data.status.toString() == '1'
                                  ? "Reject"
                                  : data.status.toString() == '2'
                                      ? "Daftar"
                                      : data.status.toString() == '3'
                                          ? "Non-Herreg"
                                          : data.status.toString() == '4'
                                              ? "Expired"
                                              : data.status.toString() == '5'
                                                  ? "Get"
                                                  : data.status.toString() ==
                                                          '6'
                                                      ? "Terbayar"
                                                      : "Correction",
                          style: whiteFontStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        )),
                      ),
                    ),
                  ),
                  DataCell(Container(
                    width: (MediaQuery.of(context).size.width / 2) * 0.5,
                    child: Text(
                      data.nama.toString(),
                      style: blackFontStyle1Bold.copyWith(fontSize: 11),
                      textAlign: TextAlign.start,
                    ),
                  )),
                  DataCell(Container(
                    width: (MediaQuery.of(context).size.width / 2) * 0.5,
                    child: Text(
                      data.cid.toString(),
                      style: blackFontStyle1Bold.copyWith(fontSize: 11),
                      textAlign: TextAlign.start,
                    ),
                  )),
                ],
                onSelectChanged: (bool selected) {
                  if (selected) {
                    detailMhs(data.nama, data.notlp, data.nowa, data.unitarea,
                        data.code, data.cid, data.crdt, data.status, context);
                  }
                }),
          )
          .toList(),
      showCheckboxColumn: false,
    );
  }

/*
  int id;
  String code;
  String cid;
  String status;
  String unitarea;
  String nama;
  String email;
  String notlp;
  String nowa;
  String crdt;
*/

  void detailMhs(nama, nohp, nowa, lokasi, program, instansi, tanggalrek,
      status, context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$nama',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Handphone:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$nohp',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Whatsapp:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$nowa',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lokasi:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$lokasi',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Program:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$program',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Instansi:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$instansi',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tgl Rekomen:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '$tanggalrek',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status:',
                            style: blackFontStyle3,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 32,
                            width: 80,
                            child: Card(
                              color: status.toString() == '0'
                                  ? Colors.blue
                                  : status.toString() == '1'
                                      ? Colors.red
                                      : status.toString() == '2'
                                          ? Colors.amber[900]
                                          : status.toString() == '3'
                                              ? Colors.blue[900]
                                              : status.toString() == '4'
                                                  ? Colors.blueGrey
                                                  : status.toString() == '5'
                                                      ? Colors.green
                                                      : status.toString() == '6'
                                                          ? Colors.indigo
                                                          : Colors.pink,
                              child: Center(
                                  child: Text(
                                status.toString() == '0'
                                    ? "Pending"
                                    : status.toString() == '1'
                                        ? "Reject"
                                        : status.toString() == '2'
                                            ? "Daftar"
                                            : status.toString() == '3'
                                                ? "Non-Herreg"
                                                : status.toString() == '4'
                                                    ? "Expired"
                                                    : status.toString() == '5'
                                                        ? "Get"
                                                        : status.toString() ==
                                                                '6'
                                                            ? "Terbayar"
                                                            : "Correction",
                                style: whiteFontStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 32,
                    child: EduButtonSecond(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      buttonText: "Tutup",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
