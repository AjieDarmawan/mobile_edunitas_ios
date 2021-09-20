part of 'widget_home.dart';

class ListKampusCard extends StatefulWidget {
  final Photo campus;
  final String routef;

  final String nilaiunitarea, nilaikelas, nilaijurusan, nilai;
  final int key_enter;

  ListKampusCard(
      {this.campus,
      this.routef,
      this.nilaijurusan,
      this.nilaikelas,
      this.nilaiunitarea,
      this.nilai,
      this.key_enter});

  // ListKampusCard({Key key}) : super(key: key);

  @override
  _ListKampusCardState createState() => _ListKampusCardState();
}

class _ListKampusCardState extends State<ListKampusCard> {
  @override
  Widget build(BuildContext context) {
    print("widget.routef= " + widget.routef);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => (HomeDetailPage(
                      campus: widget.campus,
                      routef: widget.routef,
                      nilaiunitarea: widget.nilaiunitarea,
                      nilaikelas: widget.nilaikelas,
                      nilaijurusan: widget.nilaijurusan == null
                          ? ''
                          : widget.nilaijurusan,
                      nilai: "1",
                      key_enter: 1,
                    ))));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        height: 270,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(widget.campus.cover),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 16,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.campus.logo == null
                                      ? ""
                                      : widget.campus.logo,
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          height: 48,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.campus.singkatan == null
                                    ? ""
                                    : widget.campus.singkatan,
                                style: whiteFontStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                widget.campus.nama == null
                                    ? ""
                                    : widget.campus.nama,
                                style: whiteFontStyle.copyWith(
                                    fontSize: 11, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.amber),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      // "Jl. Jakarta No.28, Kebonwaru, Kec. Batununggal, Kota Bandung, Jawa Barat 40272",
                      widget.campus.alamat.replaceAll('<br>', ','),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: blueFontStyle.copyWith(
                          fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hanya Dengan :",
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: blackFontStyle1.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    NumberFormat.currency(
                            symbol: 'Rp. ', decimalDigits: 0, locale: 'id-ID')
                        .format(double.parse(widget.campus.biaya) * 1.25),
                    style: blackFontStyle1.copyWith(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        //fontStyle: FontStyle.italic,
                        decoration: TextDecoration.lineThrough)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    NumberFormat.currency(
                            symbol: 'Rp. ', decimalDigits: 0, locale: 'id-ID')
                        .format(double.parse(widget.campus.biaya)),
                    style: orenFontStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anda sudah bisa kuliah",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: blackFontStyle1.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text("${widget.campus.totaljurusan} Prodi Tersedia",
                      style: blueFontStyle.copyWith(fontSize: 12))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
