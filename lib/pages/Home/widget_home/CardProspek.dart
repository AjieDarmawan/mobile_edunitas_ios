part of 'widget_home.dart';

class CardProspek extends StatelessWidget {
  final String judul;
  final String isi;

  CardProspek({this.judul, this.isi});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: judul == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 2,
                shadowColor: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: judul == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              judul,
                              style: blueFontStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                    ),
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: Colors.grey,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: isi == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Html(
                                data: isi.toString(),
                                defaultTextStyle: blackFontStyle3)

                        // Text(
                        //   Isi,
                        //   textAlign: TextAlign.left,
                        // ),
                        ),
                  ],
                ),
              ),
            ),
    );
  }
}
