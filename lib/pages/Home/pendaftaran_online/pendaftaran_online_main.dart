part of 'pendaftaran_online.dart';

class PendaftaranOnline extends StatefulWidget {
  @override
  _PendaftaranOnlineState createState() => _PendaftaranOnlineState();
}

class _PendaftaranOnlineState extends State<PendaftaranOnline> {
  var _whiteCardDetailChecklist = [
    'Hanya dengan mulai Rp. 300ribuan, anda sudah bisa kuliah',
    'Waktu kuliah fleksibel di luar jam kerja',
    'Biaya kuliah sangat terjangkau dan bisa di cicil per-bulan',
    'Kelas karyawan : Solusi meningkatkan Karir & Gaji',
    'Kampus / PTS berkualitas',
    'Kampus tersebar hampir di seluruh wilayah di Indonesia',
    'Terakreditasi BAN-PT, A, dan B',
    'Tersedia Beasiswa',
    'Banyak pilihan Program Studi / Jurusan Favorit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Pendaftaran Online',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/daftarfix.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                'Informasi mengenai Rekomendasi kampus PTS terbaik di semua wilayah Indonesia dengan beragam pilihan kelas serta program studi favorit.',
                style: blueFontStyle2Bold.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Di dalam eduNitas kamu mencari kampus pilihanmu dengan bermacam Program perkuliahan, Prospektus Lulusan, Program Studi, Biaya Kuliah, dan sebagainya.',
                style: blackFontStyle2.copyWith(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                  'Berikut keunggulan yang ditawarkan kampus (PTS) mitra eduNitas :',
                  style: blackFontStyle1.copyWith(fontSize: 14)),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                  itemCount: _whiteCardDetailChecklist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  color: abuColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.check_circle_outlined,
                                    color: orenColor,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Text(
                                        _whiteCardDetailChecklist[index],
                                        style: blueFontStyleBold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 64,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
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
            buttonText: "Daftar Sekarang",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (FormPendaftaranOnline())));
            },
          ),
        )),
      ),
    );
  }
}
