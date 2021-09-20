part of 'karir.dart';

class KarirList extends StatefulWidget {
  final String namalengkap,
      tempatlahir,
      tanggallahir,
      nohp,
      nowa,
      pendidikan,
      gender,
      foto_me,
      alamat,
      keycode;
  KarirList(
      {this.namalengkap,
      this.tempatlahir,
      this.tanggallahir,
      this.nohp,
      this.nowa,
      this.pendidikan,
      this.gender,
      this.foto_me,
      this.alamat,
      this.keycode});
  @override
  _KarirListState createState() => _KarirListState();
}

var valnamaperusahaan, valposisi, valspesialisasi;

class _KarirListState extends State<KarirList> {
  List<ShowPengalamanModel> datapengalaman = new List();
  void getPengalaman() async {
    KarirViewModel().show_pengalaman(widget.keycode.toString()).then((value2) {
      setState(() {
        datapengalaman = value2;
        valnamaperusahaan = datapengalaman[0].nama;
        valposisi = datapengalaman[0].posisiNama;
        valspesialisasi = datapengalaman[0].spesialisasiNama;
      });
    });
  }

  var valpenghasilan, valwilayah, valdeskripsi;
  List<ShowInfotambahanModel> datainfo = new List();
  void getInfo() async {
    KarirViewModel()
        .show_info_tambahan(widget.keycode.toString())
        .then((value2) {
      setState(() {
        datainfo = value2;
        valpenghasilan = datainfo[0].penghasilan;
        valwilayah = datainfo[0].wilayah;
        valdeskripsi = datainfo[0].deskripsi;
      });
    });
  }

  List<ShowKemampuanModel> datakemampuan = new List();
  void getkemampuan() async {
    UserViewModel().show_kemampuan(widget.keycode.toString()).then((value2) {
      setState(() {
        datakemampuan = value2;
      });
    });
  }

  List<ShowBahasaModel> databahasa = new List();
  void getbahasa() async {
    UserViewModel().show_bahasa(widget.keycode.toString()).then((value2) {
      setState(() {
        databahasa = value2;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPengalaman();
    getInfo();
    dataPendidikan();
    getkemampuan();
    getbahasa();
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
    UserViewModel().pendidikan_detail(widget.keycode.toString()).then((value) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("valwilayah${valwilayah}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        title: Text("Karir Saya", style: whiteFontStyle),
        backgroundColor: mainColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            valposisi == null || valnamaperusahaan == null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue[50],
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Silahkan lengkapi informasi Karir anda !",
                      style: blueFontStyle,
                    ),
                  )
                : Container(
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
                            Icons.business_center_outlined,
                            size: 56,
                            color: Colors.blue[50],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valposisi == null ? "" : valposisi.toString(),
                              style: blueFontStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              valnamaperusahaan == null
                                  ? ""
                                  : valnamaperusahaan.toString(),
                              style: blackFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            Text(
                              valspesialisasi == null
                                  ? ""
                                  : valspesialisasi.toString(),
                              style: blackFontStyle2.copyWith(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            valpenghasilan == null
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Penghasilan minimal",
                          style: blueFontStyle,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id-ID')
                              .format(valpenghasilan),
                          style: orenFontStyle.copyWith(
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
            Divider(
              height: 24,
            ),
            Card1(
              xpengalaman: datapengalaman,
              datakemampuan: datakemampuan,
              databahasa: databahasa,
              // xdatainfo: datainfo,

              namalengkap: widget.namalengkap == null ? "" : widget.namalengkap,
              tempatlahir: widget.tempatlahir == null ? "" : widget.tempatlahir,
              tanggallahir:
                  widget.tanggallahir == null ? "" : widget.tanggallahir,
              nohp: widget.nohp == null ? "" : widget.nohp,
              nowa: widget.nowa == null ? "" : widget.nowa,
              pendidikan: widget.pendidikan == null ? "" : widget.pendidikan,
              gender: widget.gender == null ? "" : widget.gender,
              alamat: widget.alamat == null ? "" : widget.alamat,
              foto_me: widget.foto_me == null ? "" : widget.foto_me,
              hintprov: hintprov == null ? "" : hintprov,
              hintkabkota: hintkabkota == null ? "" : hintkabkota,
              hintkec: hintkec == null ? "" : hintkec,
              hintdesa: hintdesa == null ? "" : hintdesa,
              hintpendidikan: hintpendidikan == null ? "" : hintpendidikan,
              valpendidikan: valpendidikan == null ? "" : valpendidikan,
              valprov: valprov == null ? "" : valprov,
              valkabkota: valkabkota == null ? "" : valkabkota,
              valkec: valkec == null ? "" : valkec,
              valdesa: valdesa == null ? "" : valdesa,
              valtahunkelulusan:
                  valtahunkelulusan == null ? "" : valtahunkelulusan,
              etkodepos: etkodepos == null ? "" : etkodepos,
              etalamat: etalamat == null ? "" : etalamat,
              etnamainstansi: etnamainstansi == null ? "" : etnamainstansi,
              etnilaiakhir: etnilaiakhir == null ? "" : etnilaiakhir,
              etdari: etdari == null ? "" : etdari,

              etpenghasilan: valpenghasilan.toString() == null
                  ? ""
                  : valpenghasilan.toString(),
              etwilayah: valwilayah == null ? "" : valwilayah,
              etdeskripsi: valdeskripsi == null ? "" : valdeskripsi,
              keycode: widget.keycode == null ? "" : widget.keycode,
            ),
            Card2(
              keycode: widget.keycode,
              namalengkap: widget.namalengkap == null ? "" : widget.namalengkap,
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String namalengkap,
      tempatlahir,
      tanggallahir,
      nohp,
      nowa,
      pendidikan,
      gender,
      foto_me,
      alamat,
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
      valtahunkelulusan,
      etkodepos,
      etalamat,
      etnamainstansi,
      etnilaiakhir,
      etdari,
      etpenghasilan,
      etwilayah,
      etdeskripsi,
      keycode;
  // final List<ShowInfotambahanModel> xdatainfo;
  final List<ShowPengalamanModel> xpengalaman;
  final List<ShowKemampuanModel> datakemampuan;
  final List<ShowBahasaModel> databahasa;
  Card1(
      {this.databahasa,
      this.datakemampuan,
      this.xpengalaman,
      this.etpenghasilan,
      this.etwilayah,
      this.etdeskripsi,
      this.namalengkap,
      this.tempatlahir,
      this.tanggallahir,
      this.nohp,
      this.nowa,
      this.pendidikan,
      this.gender,
      this.foto_me,
      this.alamat,
      this.hintprov,
      this.hintkabkota,
      this.hintkec,
      this.hintdesa,
      this.hintpendidikan,
      this.valpendidikan,
      this.valprov,
      this.valkabkota,
      this.valkec,
      this.valdesa,
      this.valtahunkelulusan,
      this.etkodepos,
      this.etalamat,
      this.etnamainstansi,
      this.etnilaiakhir,
      this.keycode,
      this.etdari});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
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
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    foto_me == null ? "" : foto_me,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      namalengkap == null ? "" : namalengkap,
                                      style: blueFontStyle,
                                    ),
                                    Text(
                                      gender == "L"
                                          ? "Laki - Laki"
                                          : gender == "P"
                                              ? "Perempuan"
                                              : "",
                                      style: blackFontStyle3,
                                    ),
                                    Text(
                                      "${tempatlahir == null ? "" : tempatlahir},${tanggallahir == null ? "" : tanggallahir}",
                                      style: blackFontStyle3,
                                    ),
                                    Text(
                                      nowa == null ? "" : nowa.toString(),
                                      style: blackFontStyle3,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.download_rounded),
                                iconSize: 32,
                                color: mainColor1,
                                onPressed: () {
                                  print("download");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (DownloadFile(
                                                keycode: keycode == null
                                                    ? ""
                                                    : keycode.toString(),
                                                namalengkap: namalengkap == null
                                                    ? ""
                                                    : namalengkap.toString(),
                                              ))));
                                },
                              ),
                              Text(
                                "PDF",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        alamat == null ? "" : alamat,
                        style: blackFontStyle3,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  //tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          color: mainColor1,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "My CV",
                          style: blueFontStyle2Bold,
                        ),
                      ],
                    )),
                // collapsed: Text(
                //   "loremIpsum",
                //   softWrap: true,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Pendidikan
                    ExpansionTile(
                      title: Text(
                        "Pendidikan",
                        style: blackFontStyle1.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${etnamainstansi} ",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  hintkabkota == null
                                      ? ""
                                      : hintkabkota.toString(),
                                  style: blueFontStyle),
                              Text(
                                valtahunkelulusan.toString(),
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jurusan",
                                    style: blackFontStyle3,
                                  ),
                                  Text(
                                    hintpendidikan == null
                                        ? ""
                                        : hintpendidikan.toString(),
                                    style: blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nilai Akhir",
                                    style: blackFontStyle3,
                                  ),
                                  Text(
                                    etnilaiakhir == null
                                        ? ""
                                        : etnilaiakhir.toString(),
                                    style: blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${etalamat},  Kec. ${hintkec} Kab. ${hintkabkota} Prov. ${hintprov}",
                                style: blackFontStyle3.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //Pengalaman
                    ExpansionTile(
                      title: Text(
                        "Pengalaman",
                        style: blackFontStyle1.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                          child: xpengalaman == null
                              ? Container()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: xpengalaman.length,
                                  itemBuilder: (context, index) {
                                    final xxpengalaman = xpengalaman[index];
                                    return Container(
                                      margin: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            xxpengalaman.nama == null
                                                ? ""
                                                : xxpengalaman.nama,
                                            style: blueFontStyle.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${xxpengalaman.posisiNama == null ? '' : xxpengalaman.posisiNama} | ${xxpengalaman.wilayahKota == null ? '' : xxpengalaman.wilayahKota}",
                                              style: blueFontStyle),
                                          Text(
                                            "${xxpengalaman.dari == null ? '' : xxpengalaman.dari} - ${xxpengalaman.hingga == null ? '' : xxpengalaman.hingga}",
                                            style: blackFontStyle3,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  "Industri",
                                                  style: blackFontStyle3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  xxpengalaman.industriNama ==
                                                          null
                                                      ? ""
                                                      : xxpengalaman
                                                          .industriNama,
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  "Spesialisasi",
                                                  style: blackFontStyle3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  xxpengalaman.spesialisasiNama ==
                                                          null
                                                      ? ""
                                                      : xxpengalaman
                                                          .spesialisasiNama,
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  "Bidang Pekerjaan",
                                                  style: blackFontStyle3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  xxpengalaman.bidangNama ==
                                                          null
                                                      ? ""
                                                      : xxpengalaman.bidangNama,
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  "Jabatan",
                                                  style: blackFontStyle3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  xxpengalaman.jabatanNama ==
                                                          null
                                                      ? ""
                                                      : xxpengalaman
                                                          .jabatanNama,
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  "Gaji bulanan",
                                                  style: blackFontStyle3,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "IDR ${xxpengalaman.gaji}",
                                                  style:
                                                      blackFontStyle3.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            xxpengalaman.deskripsi == null
                                                ? ""
                                                : xxpengalaman
                                                            .deskripsi.length <=
                                                        60
                                                    ? xxpengalaman.deskripsi +
                                                        '..'
                                                    : '',
                                            style: blackFontStyle3.copyWith(
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                        ),
                      ],
                    ),

                    //Kemampuan
                    ExpansionTile(
                      title: Text(
                        "Kemampuan",
                        style: blackFontStyle1.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                          child: datakemampuan == null
                              ? Container()
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: datakemampuan.length,
                                  itemBuilder: (context, index) {
                                    final xkemampuan = datakemampuan[index];

                                    return Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    //xkemampuan.nama == null
                                                    xkemampuan.kemampuan == null
                                                        ? ""
                                                        //: xkemampuan.nama,
                                                        : xkemampuan.kemampuan,
                                                    style:
                                                        blueFontStyle.copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Tingkat",
                                                      style: blackFontStyle2
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      //xkemampuan.industriNama == null
                                                      xkemampuan.tingkatan ==
                                                              null
                                                          ? ""
                                                          //: xkemampuan.industriNama,
                                                          : xkemampuan
                                                              .tingkatan,
                                                      style: blackFontStyle2
                                                          .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                          indent: 16,
                                          endIndent: 16,
                                        )
                                      ],
                                    );
                                  }),
                        ),
                      ],
                    ),

                    //Bahasa Yang Dikuasai
                    ExpansionTile(
                      title: Text(
                        "Bahasa yang dikuasai",
                        style: blackFontStyle1.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                          child: databahasa == null
                              ? Container()
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: databahasa.length,
                                  itemBuilder: (context, index) {
                                    final xdatabaahasa = databahasa[index];

                                    return Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    //xpengalaman.nama == null
                                                    xdatabaahasa.bahasa == null
                                                        ? ""
                                                        //: xdatabaahasa.nama,
                                                        : xdatabaahasa.bahasa,
                                                    style:
                                                        blueFontStyle.copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Tingkat Tulisan",
                                                      style: blackFontStyle2
                                                          .copyWith(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      //xdatabaahasa.industriNama == null
                                                      xdatabaahasa.tulisan ==
                                                              null
                                                          ? ""
                                                          //: xdatabaahasa.industriNama,
                                                          : xdatabaahasa
                                                              .tulisan,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    height: 24,
                                                    width: 1,
                                                    color: Colors.grey),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Tingkat Lisan",
                                                      style: blackFontStyle2
                                                          .copyWith(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                    Text(
                                                      //xpengalaman.industriNama == null
                                                      xdatabaahasa.lisan == null
                                                          ? ""
                                                          //: xpengalaman.industriNama,
                                                          : xdatabaahasa.lisan,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                          indent: 16,
                                          endIndent: 16,
                                        )
                                      ],
                                    );
                                  }),
                        ),
                      ],
                    ),

                    //Informasi Tambahan
                    ExpansionTile(
                      title: Text(
                        "Informasi Tambahan",
                        style: blackFontStyle1.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wilayah yang di inginkan :",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                etwilayah.toString() == null ? "" : etwilayah,
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Penghasilan Harapan :",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                etpenghasilan.toString() == null
                                    ? ""
                                    : etpenghasilan.toString(),
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Informasi lainnya :",
                                style: blueFontStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                etdeskripsi.toString() == null
                                    ? ""
                                    : etdeskripsi.toString(),
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Card2 extends StatelessWidget {
  final String keycode, namalengkap;
  Card2({
    this.keycode,
    this.namalengkap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0.0, 1.0), blurRadius: 3.0)
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Icon(
          Icons.upload_file,
          color: mainColor1,
        ),
        title: Text(
          'My Apply',
          style: blueFontStyle2Bold,
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (KarirMyapply(
                        keycode: keycode == null ? "" : keycode.toString(),
                        namalengkap: namalengkap == null ? "" : namalengkap,
                      ))));
        },
      ),
    );
  }
}
