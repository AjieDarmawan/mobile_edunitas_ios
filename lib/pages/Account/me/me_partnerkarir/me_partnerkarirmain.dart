part of 'me_partnerkarir.dart';

class MePartnerKarir extends StatefulWidget {
  final String email, keycode;
  MePartnerKarir({Key key, this.email, this.keycode}) : super(key: key);
  @override
  _KarirMainState createState() => _KarirMainState();
}

class _KarirMainState extends State<MePartnerKarir> {
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
  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultkarirsPerPageCount = 10;
  List<ListKarirPatnerModel> karirs;
  final int _nextPageThreshold = 5;
  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    karirs = [];
    fetchKarir();
  }

  var logo = [1, 0, 0, 0];
  var smallImg = [0, 0, 0, 1];
  var bigImg = [0, 0, 1, 0];

  Future<bool> _onWillpop() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation_bottom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("email${widget.email}");
    //print("_pageNumber${_pageNumber}");
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Scaffold(
        appBar: AppBar(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            backgroundColor: mainColor1,
            title: karirs.isEmpty
                ? Text(
                    'Posting Lowongan Kerja',
                    style: whiteFontStyle,
                  )
                : Text(
                    'Daftar Lowongan',
                    style: whiteFontStyle,
                  )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: getBody()),
              SizedBox(
                height: 16,
              )
            ],
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
              buttonText: "Posting Iklan Lowongan Kerja",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (KarirPilihTemplate())));
              },
            ),
          )),
        ),
      ),
    );
  }

  Widget getBody() {
    print("cek" + karirs.length.toString());
    if (karirs.isEmpty) {
      if (_loading) {
        return shimmerLoading();
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              fetchKarir();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Error while loading Karir, tap to try again"),
          ),
        ));
      }
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: karirs.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == karirs.length - _nextPageThreshold) {
              fetchKarir();
            }
            if (index == karirs.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      fetchKarir();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Error while loading karir, tap to try again"),
                  ),
                ));
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              }
            }
            final ListKarirPatnerModel karir = karirs[index];

            return CardKarir_me(xkarir: karir);
          });
    }
    return getBodyKosong();
  }

  Widget getBodyKosong() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: 54,
          ),
        ],
      ),
    );
  }

  Future<void> fetchKarir() async {
    // print("https://dev-api.edunitas.com/list_patner_karir?email=${widget.email}&page=$_pageNumber");
    try {
      final response = await http.get(
          "https://dev-api.edunitas.com/list_patner_karir?email=${widget.email}&page=$_pageNumber");

           
           
      List<ListKarirPatnerModel> fetchedkarirs =
          listKarirPatnerModelFromJson(response.body);

           
       
      //
      print("cekck" + response.body);
      setState(() {
        _hasMore = fetchedkarirs.length == _defaultkarirsPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        karirs.addAll(fetchedkarirs);
      });

       
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }

   
  }

  Widget shimmerLoading() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350],
          highlightColor: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350])),
            ],
          ),
        ),
      ),
    ));
  }
}
