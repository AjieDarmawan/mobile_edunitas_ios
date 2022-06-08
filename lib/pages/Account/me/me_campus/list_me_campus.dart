part of 'me_kampus.dart';

class List_me_campus extends StatefulWidget {
  final String namalengkap,
      logo_me,
      email,
      campus_me,
      prodi_me,
      no_virtual,
      nosel,
      singkatan_me,
      keycode,
      kode_campus_me,
      kelas_me;

  List_me_campus({
    this.namalengkap,
    this.logo_me,
    this.email,
    this.campus_me,
    this.prodi_me,
    this.no_virtual,
    this.singkatan_me,
    this.kelas_me,
    this.keycode,
    this.kode_campus_me,
    this.nosel,
  });

  @override
  _List_me_campusState createState() => _List_me_campusState();
}

class _List_me_campusState extends State<List_me_campus> {
  _divider() {
    return Divider(
      color: Colors.grey.withOpacity(0.5),
      thickness: 1,
      height: 24.0,
    );
  }

  _dividerBawah() {
    return Divider(
      color: Colors.grey.withOpacity(0.5),
      thickness: 1,
      height: 0.0,
    );
  }

  String varnama,
      varemail,
      vargenre,
      varalamat,
      vartgl_lahir,
      vartempat_lahir,
      varpendidikan,
      varnohp,
      varnowa,
      vargender,
      no_virtual,
      campus_me,
      prodi_me,
      logo_me,
      kelas_me,
      nosel,
      singkatan_me,
      kode_campus_me,
      foto_me,
      nim;
  void datausers() {
    UserViewModel().users_detail(widget.email.toString()).then((value) {//handled
      UsersDetailModel data = value;

      if (data.status == 200) {
        setState(() {
          varnama = data.nama;
          varemail = data.email;
          varalamat = data.alamat;
          varpendidikan = data.pendidikan;
          varnohp = data.noHp;
          varnowa = data.noWa;
          vargender = data.genre;
          vartempat_lahir = data.tempatLahir;
          vartgl_lahir = data.tanggalLahir.toString();
          no_virtual = data.no_virtual;
          campus_me = data.campus;
          prodi_me = data.prodi;
          logo_me = data.logo;
          kelas_me = data.kelas;
          nosel = data.nosel;
          singkatan_me = data.singkatan;
          kode_campus_me = data.kodecampus;
          foto_me = data.foto;
          nim = data.nim;
        });
      }
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
                datausers();
                Navigator.of(context).pop();
              },
              buttonText: 'Muat Ulang',
            ),
          )).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    datausers();
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Kampus Saya',
          style: whiteFontStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Container(
                      //   width: 90,
                      //   height: 90,
                      //   child: Card(
                      //     borderOnForeground: true,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      Container(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              logo_me == null ? "" : logo_me,
                              // height: MediaQuery.of(context).size.height / 9,
                              // width: MediaQuery.of(context).size.width / 3,
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              singkatan_me == null ? "" : singkatan_me.toString(),
                              style: blueFontStyleBold,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              campus_me == null ? "" : campus_me.toString(),
                              style: blackFontStyle3,
                              maxLines: 2,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _divider(),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Program",
                              style: blackFontStyle3,
                            ),
                            Text(
                              kelas_me == null ? "" : kelas_me,
                              style: blueFontStyleBold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jurusan",
                              style: blackFontStyle3,
                            ),
                            Text(
                              prodi_me == null ? "" : prodi_me.toString(),
                              style: blueFontStyleBold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NIM",
                              style: blackFontStyle3,
                            ),
                            Text(
                              "-",
                              style: blueFontStyleBold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "VA",
                              style: blackFontStyle3,
                            ),
                            Text(
                              no_virtual.toString(),
                              style: blueFontStyleBold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Status",
                              style: blackFontStyle3,
                            ),
                            Text(
                              "Aktif",
                              style:
                              blueFontStyleBold.copyWith(color: Colors.green),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _dividerBawah(),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance_wallet,
                        color: mainColor1,
                      ),
                      title: Text(
                        'Info Pembayaran',
                        style: blackFontStyle3,
                      ),
                      trailing: Icon(Icons.navigate_next),
                      dense: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              //todo: ini debug buat debug, pastikan pakai InfoPembayaran saat rilis
                                builder: (context) => (InfoPembayaranDebug(
                                  namalengkap: varnama == null ? "" : varnama,
                                  logo_me: logo_me == null ? "" : logo_me,
                                  prodi_me: prodi_me == null ? "" : prodi_me,
                                  campus_me: campus_me == null ? "" : campus_me,
                                  no_virtual:
                                  no_virtual == null ? "" : no_virtual,
                                  kelas_me: kelas_me == null ? "" : kelas_me,
                                  nosel: nosel == null ? "" : nosel,
                                  singkatan_me:
                                  singkatan_me == null ? "" : singkatan_me,
                                  keycode: widget.keycode == null
                                      ? ""
                                      : widget.keycode.toString(),
                                  kode_campus_me:
                                  kode_campus_me.toString() == null
                                      ? ""
                                      : kode_campus_me.toString(),
                                  nim:
                                  nim.toString() == null
                                      ? "-"
                                      : nim.toString(),
                                ))));
                      },
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Jadwal Kuliah',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.assignment_turned_in,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Nilai',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_add_alt_1,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Absensi',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.assignment,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Jadwal Ujian',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.insert_chart,
                            color: mainColor1,
                          ),
                          title: Text(
                            'Kurikulum',
                            style: blackFontStyle3,
                          ),
                          trailing: Icon(Icons.navigate_next),
                          dense: true,
                          //onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Kalender Akademik',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.chat,
                          color: mainColor1,
                        ),
                        title: Text(
                          'Saran',
                          style: blackFontStyle3,
                        ),
                        trailing: Icon(Icons.navigate_next),
                        dense: true,
                        //onTap: () {},
                      ),
                    ),
                  ),
                  _dividerBawah(),
                ],
              ),
            )),
      ),
    );
  }
}
