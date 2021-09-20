part of 'widget_home.dart';

class MenuPromosi extends StatelessWidget {
  final ListEduModel databerita;
  final String kategori;
  MenuPromosi({this.databerita, this.kategori});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        height: 140,
        width: 240,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(databerita.cid), fit: BoxFit.fill),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (PromosiDetail(
                              cid: databerita.cid,
                              konten: databerita.konten,
                              title: databerita.title,
                              caradapat: databerita.caradapat,
                              poinredeem: databerita.poinreedem.toString(),
                            ))));
              },
            ),
          ),
        ),
      ),
      Positioned(
        top: 8,
        left: 8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red,
          ),
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Berakhir : ",
                style: whiteFontStyle.copyWith(
                  fontSize: 10,
                ),
              ),
              Text(databerita.hingga,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: whiteFontStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 12,
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
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
