part of 'widgetWishlist.dart';

class CardWishlist extends StatefulWidget {
  CardWishlist({Key key}) : super(key: key);

  @override
  _CardWishlistState createState() => _CardWishlistState();
}

class _CardWishlistState extends State<CardWishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 5,
        child: Container(
          height: 320,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => (HomeDetailPage())));
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Container(
                          height: 190,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://file.edunitas.com/assets/kampus/img/1576764256/medium-cover.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Icon(Icons.map),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "POLNAS",
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: blackFontStyle1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UMS Surabaya:",
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: blackFontStyle1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
