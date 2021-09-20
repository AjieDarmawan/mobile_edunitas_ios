part of 'widget_agensi.dart';

class InformasiPerolehan extends StatefulWidget {
  final String keycode;

  InformasiPerolehan({
    this.keycode,
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

  void getMhsRekomen() async {
    Agentview_model().get_mhs_rekomend_agent(widget.keycode).then((value) {//handled
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
    "Get(Process)",
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

  @override
  void initState() {
    super.initState();
    getMhsRekomen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 100,
            //   child: Card(
            //       elevation: 10,
            //       borderOnForeground: true,
            //       color: Colors.white,
            //       child: Container(
            //         padding: EdgeInsets.all(10),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               width: 70,
            //               height: 70,
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(70),
            //                 child: Image.network(
            //                   "https://file.edunitas.com/assets/kampus/img/1576764260/medium-cover.png",
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   "John Doe",
            //                   style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text("Bank Rakyat Indonesia",
            //                     style: TextStyle(fontSize: 14)),
            //                 Text("9823472347",
            //                     style: TextStyle(fontSize: 14)),
            //               ],
            //             ),
            //             SizedBox(
            //               width: 30,
            //             ),
            //             GestureDetector(
            //               child: Icon(
            //                 Icons.edit,
            //                 size: 30,
            //               ),
            //               onTap: () {},
            //             )
            //           ],
            //         ),
            //       )),
            // ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      // leading:
                      //     Icon(Icons.account_balance_wallet, color: mainColor1),
                      title: Text(
                        "Semua Program",
                        style: blackFontStyle2,
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        modalBottomProgram(context);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      // leading:
                      //     Icon(Icons.account_balance_wallet, color: mainColor1),
                      title: Text(
                        "Semua Status",
                        style: blackFontStyle2,
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        modalBottomStatus(context);
                      },
                    ),
                  ),
                  Card(
                    child: ExpansionTile(
                      title: Text(
                        'Deskripsi Status',
                        style: blackFontStyle2,
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int indx) {
                              return Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Icon(
                                          Icons.circle,
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(
                                              height: 0,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(desk[indx]),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
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
              child: TabelMhsRekomen(
                xmhsrekomenlist: datar_mhs_rekom,
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
                    Container(
                      width: 32,
                      child: data.status.toString() == "0"
                          ? Icon(
                              Icons.schedule_outlined,
                              size: 24,
                              color: Colors.grey,
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
                                      color: orenColor,
                                    )
                                  : data.status == "3"
                                      ? Icon(
                                          Icons.check_circle_outlined,
                                          size: 24,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.cancel_outlined,
                                          size: 24,
                                          color: Colors.redAccent,
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
          height: 270,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Nama: $nama',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'No. Handphone: $nohp',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'No. Whatsapp: $nowa',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Lokasi: $lokasi',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Program: $program',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Instansi: $instansi',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Tgl Rekomen: $tanggalrek',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Status: $status',
                      style: blackFontStyle3,
                      textAlign: TextAlign.center,
                    ),
                  ],
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
