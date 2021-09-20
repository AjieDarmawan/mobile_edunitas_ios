part of 'widgetkarir.dart';

class CardKarir extends StatefulWidget {
  final ListKarirModel xkarir;
  CardKarir({this.xkarir});

  @override
  _CardKarirState createState() => _CardKarirState();
}

class _CardKarirState extends State<CardKarir> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (KarirDetail(
                      xkarir: widget.xkarir,
                    ))));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            // flex: smallImg[i]==0?4:3,
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.xkarir.namaPerusahaan,
                                    style: blackFontStyle1.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  widget.xkarir.lowongan == null ||
                                          widget.xkarir.lowongan == ''
                                      ? Container()
                                      : Text(
                                          widget.xkarir.lowongan,
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: blueFontStyle.copyWith(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 14),
                                        ),
                                ],
                              ),
                            ),
                            // ini nanti buat tempat logo perusahaan
                            Container(
                              width: 48,
                              height: 48,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      widget.xkarir.jenisLowongan.toString() == "gambar"
                          ? widget.xkarir.gambar1.toString() != ""
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image.network(
                                      widget.xkarir.gambar1.toString()),
                                )
                              : Container(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image.asset(
                                      'assets/dummyimagemdpi.png',
                                      fit: BoxFit.fitWidth),
                                )
                          : Container(),
                      widget.xkarir.jenisLowongan.toString() != "pdf"
                          ? Container() : Container(),
                          // : PDF.network(
                          //     widget.xkarir.pdf.toString(),
                          //     height: 200,
                          //     width: MediaQuery.of(context).size.width,
                          //   ),
                      // : PDF.asset(
                      //     "assets/invoice.pdf",
                      //     height: 200,
                      //     width: MediaQuery.of(context).size.width,
                      //   ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          widget.xkarir.keterangan.length >= 90
                              ? widget.xkarir.keterangan.substring(0, 90) + '..'
                              : widget.xkarir.keterangan,
                          style: blackFontStyle3,
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Klik : ',
                              style: blackFontStyle1Bold.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.xkarir.jumlahklik,
                              style: blueFontStyle2Bold.copyWith(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              width: 2,
                              height: 12,
                              color: Colors.grey,
                            ),
                            Text(
                              'Tayang : ',
                              style: blackFontStyle1Bold.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.xkarir.totaltayang,
                              style: blueFontStyle2Bold.copyWith(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  child: Row(
                                children: [],
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  child: Row(
                                children: [],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: mainColor1,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: yellowColor,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.xkarir.lokasiKerja,
                                      style:
                                          whiteFontStyle.copyWith(fontSize: 12),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 3,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Sampai Dengan : ',
                                  style: whiteFontStyle.copyWith(
                                      color: yellowColor, fontSize: 11),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${widget.xkarir.hingga}',
                                      style: whiteFontStyle.copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 8,
            child: widget.xkarir.tipeLowongan == null ||
                    widget.xkarir.tipeLowongan == ''
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: yellowColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(widget.xkarir.tipeLowongan,
                        overflow: TextOverflow.clip,
                        style: blueFontStyle.copyWith(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
          ),
        ],
      ),
    );
  }
}
