part of 'partner.dart';

class PartnerKampus_Main extends StatefulWidget {
  @override
  _PartnerKampus_Main_State createState() => _PartnerKampus_Main_State();
}

class _PartnerKampus_Main_State extends State<PartnerKampus_Main> {
  var _blueCardTitle = [
    '1. Pembayaran Online',
    '2. Penagihan Online',
    '3. Fasilitas publikasi',
    '4. Akses dunia kerja',
  ];

  var _blueCardDetail = [
    'Support pembayaran kuliah secara online dan didukung pembayaran di berbagai outlet, seperti Indomaret dll',
    'Support notifikasi/tagihan online pembayaran mahasiswa.',
    'Fasilitas publikasi Nilai, Jadwal Kuliah, Jadwal Ujian, Kurikulum, Kalender Akademik dll',
    'Lowongan kerja yang sangat bermanfaat bagi Mahasiswa anda.',
  ];

  var _whiteCardDetail = [
    'Pembayaran kuliah bisa melalui Alfamart, Indomaret, Bank Transfer, Shopee Pay, dll',
    'Kami buatkan 41.000 web marketing eksklusif',
    'Support : SIAKAD, Learning System Gratis',
    'Dipromosikan juga di Youtube, FB - Instagram berbayar, TikTok',
    '100% Biaya Marketing kami yang menanggung',
    'Sistem Kerjasama obyektif, menguntungkan dan tidak beresiko bagi kampus',
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
          'Partner Kampus',
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
                    image: AssetImage("assets/partnerfix.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                'Ingin Kampus Anda Maju serta Ramai Mahasiswanya?',
                style: blueFontStyle2Bold.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                    text:
                        'Kampus Anda akan di Promosikan dan di Marketingkan secara luas',
                    style: blackFontStyle2.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' (GRATIS)',
                        style: blackFontStyle2.copyWith(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                  'Dapatkan fitur-fitur pendukung lainnya yang dapat meningkatkan Citra dan Pelayanan Kampus anda seperti :',
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
              Text('Benefit Lainnya',
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
            buttonText: "Join Partner Kampus",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (FormPatnerKampus())));
            },
          ),
        )),
      ),
    );
  }
}
