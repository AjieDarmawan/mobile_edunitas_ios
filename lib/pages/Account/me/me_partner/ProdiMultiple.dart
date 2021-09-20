part of 'me_partner.dart';

class ProdiMultiple extends StatefulWidget {
  final String proditerpilih, proditertambah;

  ProdiMultiple({this.proditerpilih, this.proditertambah});

  @override
  _ProdiMultipleState createState() => _ProdiMultipleState();
}

class _ProdiMultipleState extends State<ProdiMultiple> {
  //initState
  bool selected = false;

  var _valuecheck = [];
  var _tempprodi = [];
  var _tambahprodi = [];
  var _proditerpilih = [];
  var _proditertambah = [];
  var _temp_tambahprodi = '';
  var _resultprodi = ['', '', ''];
  var _nonedited_resultprodi = ['', '', ''];

  void _generateValueCheckProdi() {
    var _tempprod = widget.proditerpilih != null
        ? json.decode('[' + widget.proditerpilih + ']')
        : [];
    print('proh_c: ' + _tempprod.toString());
    if (_tempprod.length != 0) {
      for (var i = 0, n = 0; i < listprodi.length; i++) {
        var x = int.parse(_tempprod[n].toString());
        if (x == i) {
          print('proh: ' + x.toString());
          _tempprodi.add(listprodi[i].kode);
          _proditerpilih.add(i);
          _valuecheck.add(true);
          if (n < _tempprod.length - 1) n++;
        } else {
          _valuecheck.add(false);
        }
      }
    } else {
      for (var i = 0; i < listprodi.length; i++) {
        _valuecheck.add(false);
      }
    }
  }

  void _generateValueAddProdi() {
    List _tempprod =
        widget.proditertambah != null ? widget.proditertambah.split(', ') : [];
    print('proh_t: ' + _tempprod.length.toString());
    if (_tempprod.length != 0) {
      for (var i = 0; i < _tempprod.length; i++) {
        //_proditertambah.add(_tempprod[i]);
        _tambahprodi.add(_tempprod[i].toString());
      }
    }
  }

  void _sumProdiResult(bool edited) {
    _proditerpilih.sort();
    setState(() {
      if(edited){
        _resultprodi[0] =
            _tempprodi.toString().replaceAll('[', '"').replaceAll(']', '"');
        _resultprodi[1] =
            _tambahprodi.toString().replaceAll('[', '"').replaceAll(']', '"');
        _resultprodi[2] =
            _proditerpilih.toString().replaceAll('[', '"').replaceAll(']', '"');
      } else {
        _nonedited_resultprodi[0] =
            _tempprodi.toString().replaceAll('[', '"').replaceAll(']', '"');
        _nonedited_resultprodi[1] =
            _tambahprodi.toString().replaceAll('[', '"').replaceAll(']', '"');
        _nonedited_resultprodi[2] =
            _proditerpilih.toString().replaceAll('[', '"').replaceAll(']', '"');
      }
    });
  }

  List<ProdiMultipleModel> listprodi = [];
  void getProdi() async {
    Masterview_model().prodimultipe().then((value) {//handled
      setState(() {
        listprodi = value == null ? [] : value;
        _generateValueCheckProdi();
        _generateValueAddProdi();
        _sumProdiResult(false);
      });
    }).catchError((erro){
      onErrHandling(erro);
    });
  }

  Future<bool> _save() {
    _sumProdiResult(true);
    Navigator.pop(context, _resultprodi.toString());
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
            color: Colors.black38,
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0)
      ],
      backgroundColor: Colors.green[600],
    )..show(context);
  }

  Future<bool> _onWillpop() {
    Navigator.pop(context, _nonedited_resultprodi.toString());
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
                getProdi();
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
    getProdi();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Scaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: mainColor1,
          title: Text(
            'Pilih Prodi Yang Tersedia',
            style: whiteFontStyle,
          ),
        ),
        body: Container(
          color: CupertinoColors.systemGrey6,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 330,
          child: ListView.builder(
            itemCount: listprodi.length,
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return listprodi.length!=0
                  ? Container(
                width: MediaQuery.of(context).size.width,
                child: CheckboxListTile(
                  title: Text(listprodi[i].jenjang+" "+listprodi[i].nama),
                  value: _valuecheck[i],
                  onChanged: (bool value) {
                    setState(() {
                      _valuecheck[i] = value;
                      if (value) {
                        _tempprodi.add(listprodi[i].kode);
                        _proditerpilih.add(i);
                      } else {
                        _tempprodi
                            .removeWhere((item) => item == listprodi[i].kode);
                        _proditerpilih.removeWhere((item) => item == i);
                      }
                    });
                    print('prodi_apaansih: ' +
                        _tempprodi
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''));
                  },
                ),
              )
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        bottomSheet: Container(
          height: 258,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.only(top: 8, bottom: 10),
                color: Colors.white,
                height: 40,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        height: 40,
                        child: EduButton(
                          buttonText: "Simpan Prodi",
                          onPressed: () {
                            _save();
                          },
                        ),
                      ),
                    )),
              ),
              Divider(
                height: 1,
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Prodi anda tidak tersedia dalam list di atas ? Tambahkan diisni",
                  style: blueFontStyle.copyWith(
                      fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        validator: activasiValidator,
                        cursorColor: mainColor1,
                        //controller: ,
                        //enabled: false,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 10, bottom: 5, top: 5, right: 10),
                            hintText: "Program Studi"),
                        onChanged: (value) {
                          _temp_tambahprodi = value;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outlined,
                      ),
                      iconSize: 48,
                      color: mainColor1,
                      onPressed: () {
                        setState(() {
                          _tambahprodi.add(_temp_tambahprodi);
                          print('prodi_nambah_apaansih: ' +
                              _tambahprodi
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''));
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: CupertinoColors.systemGrey4,
                height: 72,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tambahprodi.length,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: mainColor1, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            _tambahprodi[i],
                            style: blueFontStyle,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 16,
                            ),
                            onPressed: () {
                              setState(() {
                                _tambahprodi.removeWhere(
                                    (item) => item == _tambahprodi[i]);
                                print('prodi_nambah_apaansih: ' +
                                    _tambahprodi
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', ''));
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(user.name),
    ));
  }
}

class User {
  final int index;
  final String about;
  final String name;
  final String email;
  final String picture;

  User(this.index, this.about, this.name, this.email, this.picture);
}
