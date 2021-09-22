part of 'me_partnerkarir.dart';

class CardKarir_me extends StatefulWidget {
  final ListKarirPatnerModel xkarir;
  CardKarir_me({this.xkarir});

  @override
  _CardKarirState createState() => _CardKarirState();
}

class _CardKarirState extends State<CardKarir_me> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => (KarirDetail(
          //               xkarir: widget.xkarir,
          //             ))));
        },
        child: widget.xkarir.status == "2"
            ? Stack(
                children: [
                  Container(
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
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.xkarir.namaPerusahaan,
                          style: blueFontStyleBold,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.xkarir.lowongan,
                          style: blackFontStyle1Bold.copyWith(fontSize: 14),
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                ),
                                Container(
                                  width: 120,
                                  child: Text(
                                    widget.xkarir.lokasiKerja,
                                    style: blackFontStyle1Bold.copyWith(
                                        fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                widget.xkarir.hingga,
                                style: blueFontStyleBold.copyWith(fontSize: 11),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 32,
                          child: EduButtonSecond(
                              buttonText: "Detail", onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Dikunjungi ",
                                    style: blackFontStyle1.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Text("0",
                                    style: blueFontStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  height: 10,
                                  width: 1,
                                  color: Colors.grey[800],
                                ),
                                Text("Apply ",
                                    style: blackFontStyle1.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Text("0",
                                    style: blueFontStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      child: Text("Published",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: whiteFontStyle.copyWith(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Container(
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
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.xkarir.namaPerusahaan,
                          style: blueFontStyleBold,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.xkarir.lowongan,
                          style: blackFontStyle1Bold.copyWith(fontSize: 14),
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                ),
                                Container(
                                  width: 120,
                                  child: Text(
                                    widget.xkarir.lokasiKerja,
                                    style: blackFontStyle1Bold.copyWith(
                                        fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                widget.xkarir.hingga,
                                style: blueFontStyleBold.copyWith(fontSize: 11),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 32,
                          child: EduButtonSecond(
                              buttonText: "Edit",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KarirPilihTemplate(xkarir: widget.xkarir,)),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      child: Text("Menunggu Approval",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: whiteFontStyle.copyWith(
                              fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ));
  }
}
