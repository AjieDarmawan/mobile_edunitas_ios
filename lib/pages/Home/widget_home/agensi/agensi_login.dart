part of 'widget_agensi.dart';

class AgensiLogin extends StatefulWidget {
  @override
  _AgensiLoginState createState() => _AgensiLoginState();

  final Photo campus;
  final String routef;
  final String email;
  AgensiLogin({
    this.campus,
    this.routef,
    this.email,
  });
}

class _AgensiLoginState extends State<AgensiLogin> {
  var labelnamaweb = '', kodeweb = '', jenjangweb;
  var dataWebJurusan = new List();
  void getWebJurusan() {
    sipemaview_model().getBiayaSipema_web(widget.campus.kode,widget.campus.webacid).then((value) {//handled
      setState(() {
        dataWebJurusan = value;

        labelnamaweb = dataWebJurusan[0].label;
        kodeweb = dataWebJurusan[0].kode;
        jenjangweb = dataWebJurusan[0].jenjang;
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
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
      foto_me;
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
        });
      }
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  var valjurusan;
  var hintjurusan;
  void modalBottomJurusan(context) {
    showModalBottomSheet(
        backgroundColor: mainColor1,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 200,
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
                  child: Expanded(
                    child: dataWebJurusan.length == 0
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[350],
                                  highlightColor: Colors.white,
                                  child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[350])),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: dataWebJurusan.length,
                            itemBuilder: (BuildContext context, int index) {
                              final lastDataSipema = dataWebJurusan[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    valjurusan = lastDataSipema.kode;
                                    hintjurusan = lastDataSipema.label;

                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 24, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(lastDataSipema.label,
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
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          );
        });
  }

  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  SessionManager sessionManager = SessionManager();
  void getPreferences() async {
    await sessionManager.getPreference().then((value) {//handled
      setState(() {
        mystatus = sessionManager.status;
        globalkey = sessionManager.key;
        globalEmail = sessionManager.email;
        print("email${globalEmail}");
        print("globalkey${globalkey}");
        print("mystatus${mystatus}");
      });
    });
  }

  var nama_agent, keycode_agent, gambar_selfi;
  void check_agent(keycode) {
    Agentview_model().check_agent(keycode.toString()).then((value) {//handled
      StatusModel data = value;
      nama_agent = data.message;
      keycode_agent = data.etc;
      gambar_selfi = data.etc2;
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
                getWebJurusan();
                datausers();
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
    getWebJurusan();
    getPreferences();
    datausers();
  }

  bool _value_no = false;
  bool _value_yes = false;
  int val = -1;
  
  @override
  Widget build(BuildContext context) {
    check_agent(globalkey);
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              )),
              automaticallyImplyLeading: false,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: mainColor1,
              expandedHeight: 72.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'eduCampus',
                    style: whiteFontStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[50],
                  ),
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Apakah anda direkomendasikan oleh ",
                      style: blueFontStyle.copyWith(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: varnama.toString() == null
                              ? ""
                              : varnama.toString(),
                          style: blackFontStyle1Bold.copyWith(fontSize: 14),
                        ),
                        TextSpan(
                          text: 'untuk mendaftar di ',
                          style: blueFontStyle.copyWith(fontSize: 14),
                        ),
                        TextSpan(
                          text: widget.campus.nama.toString() == null
                              ? ""
                              : widget.campus.nama.toString(),
                          style: blackFontStyle1Bold.copyWith(fontSize: 14),
                        ),
                        TextSpan(
                          text: ' ? ',
                          style: blueFontStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            gambar_selfi == null ? "" : gambar_selfi,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            widget.campus.logo == null
                                ? ""
                                : widget.campus.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 140,
                        child: RadioListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //controlAffinity: ListTileControlAffinity.trailing,
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            // setState(() {
                            //   _val_tipe_lowongan_lengkap = value;
                            //   _value_tipe_lowongan_lengkap[0] = true;
                            //   tipe_lowongan_value = "Full Time";
                            // });
                            setState(() {
                              val = value;
                              _value_no = true;
                              _value_yes = false;
                            });
                          },
                          title: Text(
                            "Tidak",
                            style: blackFontStyle1Bold.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          selected: _value_no,
                        ),
                      ),
                      Container(
                        width: 140,
                        child: RadioListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //controlAffinity: ListTileControlAffinity.trailing,
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                              _value_yes = true;
                              _value_no = false;
                            });
                          },
                          title: Text(
                            "Ya",
                            style: blackFontStyle1Bold.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          selected: _value_yes,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 2, color: mainColor1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: RichText(
                          text: TextSpan(
                            text: "Silahkan pilih ",
                            style: blueFontStyle.copyWith(fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Prodi ',
                                style:
                                    blackFontStyle1Bold.copyWith(fontSize: 14),
                              ),
                              TextSpan(
                                text: 'lalu klik ',
                                style: blueFontStyle.copyWith(fontSize: 14),
                              ),
                              TextSpan(
                                text: 'Cek Biaya ',
                                style:
                                    blackFontStyle1Bold.copyWith(fontSize: 14),
                              ),
                              TextSpan(
                                text: ' untuk tahap pendaftaran',
                                style: blueFontStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          onTap: () {
                            if (dataWebJurusan != null) {
                              modalBottomJurusan(context);
                            }
                          },
                          leading: Text(
                            dataWebJurusan != null
                                ? hintjurusan == null
                                    ? 'Pilih Jurusan '
                                    : hintjurusan
                                : 'Mohon tunggu..',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: mainColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    height: 48,
                    child: EduButton(
                        buttonText: 'Cek Biaya',
                        onPressed: () {
                          if (valjurusan == null ||
                              _value_yes.toString() == "false" &&
                                  _value_no.toString() == "false") {
                            Flushbar(
                              title: "Maaf !!",
                              message: "Harap Di Isi",
                              duration: Duration(seconds: 3),
                              flushbarPosition: FlushbarPosition.TOP,
                              flushbarStyle: FlushbarStyle.FLOATING,
                              reverseAnimationCurve: Curves.decelerate,
                              forwardAnimationCurve: Curves.fastOutSlowIn,
                              boxShadows: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 3.0)
                              ],
                              backgroundColor: Colors.red,
                            )..show(context);
                          } else {
                            // print(_value_yes.toString() == "false"
                            //     ? "2"
                            //     : "1");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (Daftar_kuliahWebJurusan(
                                          campus: widget.campus,
                                          kodejurusan: valjurusan,
                                          namaJurusan: hintjurusan,
                                          jenjang: "",
                                          status_agent:
                                              _value_yes.toString() == "false"
                                                  ? "2"
                                                  : "1",
                                        ))));
                          }

                          // print("_value_yes" + _value_yes.toString());
                          // print("_value_no" + _value_no.toString());
                        }),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
