part of 'widget_home.dart';

class MenuBerita extends StatelessWidget {
  final ListEduModel databerita;
  final String kategori;

  MenuBerita({this.databerita, this.kategori});

  // String _parseHtmlString(String htmlString) {
  //   var document = parse(htmlString);
  //   String parsedString = parse(document.body.text).documentElement.text;

  //   return parsedString;
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (kategori == "berita"
                    ? BeritaDetail(
                        cid: databerita.cid,
                        konten: databerita.konten,
                        title: databerita.title,
                        penulis: databerita.sumber,
                        tanggal: databerita.crdt,
                      )
                    : PromosiDetail(
                        cid: databerita.cid,
                        konten: databerita.konten,
                        title: databerita.title,
                        caradapat: databerita.caradapat,
                        poinredeem: databerita.poinreedem.toString(),
                      ))));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
            height: 160,
            width: 240,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(databerita.cid), fit: BoxFit.cover),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (kategori == "berita"
                                ? BeritaDetail(
                                    cid: databerita.cid,
                                    konten: databerita.konten,
                                    title: databerita.title,
                                    penulis: databerita.sumber,
                                    tanggal: databerita.crdt,
                                  )
                                : PromosiDetail(
                                    cid: databerita.cid,
                                    konten: databerita.konten,
                                    title: databerita.title,
                                    caradapat: databerita.caradapat,
                                    poinredeem:
                                        databerita.poinreedem.toString(),
                                  ))));
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: mainColor1,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(databerita.crdt,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: whiteFontStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 11.5,
            right: 12,
            child: Container(
              height: 40,
              width: 232,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.black45,
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    databerita.title == null ? "" : databerita.title,
                    style: whiteFontStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dymCode() {
    Container(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(10),
                    ),
                    color: mainColor,
                  ),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    databerita.crdt == null ? "" : databerita.crdt,
                    style: blueFontStyle.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                )),
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image: DecorationImage(
                  image: NetworkImage(databerita.cid), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              databerita.title == null ? "" : databerita.title,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: blackFontStyle1.copyWith(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: databerita.hingga == null
                ? Text(
                    //databerita.konten == null ? "" : _parseHtmlString(databerita.konten),
                    "",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: blackFontStyle1.copyWith(
                        color: Colors.black54,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Berakhir : ",
                            style: blackFontStyle3.copyWith(fontSize: 10),
                          ),
                          Text(
                            databerita.hingga,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: blueFontStyle.copyWith(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
          )
          // Container(
          //   margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
          //   child: Text(
          //     "Prospek Kerja Kuliah Jurusan Kesehatan",
          //     maxLines: 2,
          //     overflow: TextOverflow.clip,
          //     style: blackFontStyle1.copyWith(
          //         fontSize: 12, fontWeight: FontWeight.w100),
          //   ),
          // ),
        ],
      ),
    );
  }
}
