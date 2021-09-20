part of 'karir.dart';

class PartnerKarirMain extends StatefulWidget {
  @override
  _PartnerKarirMainState createState() => _PartnerKarirMainState();
}

class _PartnerKarirMainState extends State<PartnerKarirMain> {
  var _blueCardTitle = [
    '1. List Data Pelamar',
    '2. Fasilitas Publikasi Job Fair',
    '3. Fasilitas Publikasi Lowongan',
    '4. View Progress Lamaran',
  ];

  var _blueCardDetail = [
    'Anda bisa melihat siapa saja yang sudah apply lowongan Anda disertai profil pelamar, pendidikannya, pengalamannya, bahkan kontak dan email secara gratis.',
    'Posting Job Fair anda secara gratis !! bersiaplah untuk raih banyak peserta.',
    'Gratis posting Lowongan Pekerjaan dengan fitur Apply Online disertai manajemen pengelolaan nya',
    'Anda bisa melihat progress pelamar yang sudah apply lowongan anda, anda memiliki control untuk tolak pelamar, lanjutkan untuk interview dan terima pelamar.',
  ];

  var _whiteCardDetail = [
    'Publikasi Lowker ke kampus/Mahasiswa (Tepat sasaran)',
    'Kandidat Pelamar Qualified',
    'Posting Lowker/Jobfair Mudah',
    'Dapat memilih Kandidat sesuai dengan Jurusan kuliahnya',
    'Posting Lowker disini Gratis',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          'Partner Karir',
          style: whiteFontStyle,
        ),
        backgroundColor: mainColor1,
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
                    image: AssetImage("assets/partnerkarirfix.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                'Ingin mencari SDM atau Pegawai yang Sesuai dengan Kualifikasi Perusahaan? Posting Lowongan Pekerjaan serta Info Job Fair Perusahaan Anda di eduCareer',
                style: blueFontStyle2Bold.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                    text:
                        'Perusahaan anda akan di publikasikan atau di promosikan kepada Mitra Partner Kami',
                    style: blackFontStyle2.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' (Sekolah, Kampus, Pelamar, Mahasiswa, dll)',
                        style: blackFontStyle2.copyWith(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' secara luas.',
                        style: blackFontStyle2.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                  'Dapatkan fitur-fitur pendukung lainnya yang dapat meningkatkan Citra dan Pelayanan Perusahaan tempat Anda sebagaimana :',
                  style: blackFontStyle1.copyWith(fontSize: 14)),
              ListView.builder(
                  itemCount: _blueCardTitle.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _blueCardTitle[index],
                            style: blueFontStyle.copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: mainColor1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 12),
                                child: Text(
                                  _blueCardDetail[index],
                                  style: whiteFontStyle,
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 16,
              ),
              Text(
                  'Ayo bergabung menjadi Partner eduCareer dan dapatkan banyak sekali keuntungannya',
                  style: blueFontStyle.copyWith(fontSize: 18)),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                  itemCount: _whiteCardDetail.length,
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
                                        _whiteCardDetail[index],
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
            buttonText: "Join Partner Karir",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (KarirPilihTemplate())));
            },
          ),
        )),
      ),
    );
  }
}
