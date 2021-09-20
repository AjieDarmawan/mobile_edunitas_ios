part of 'widget_home.dart';

class MenuRekomendasi extends StatefulWidget {
  final Photo rekomendasi;

  MenuRekomendasi({
    this.rekomendasi,
  });

  @override
  _MenuRekomendasiState createState() => _MenuRekomendasiState();
}

class _MenuRekomendasiState extends State<MenuRekomendasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (HomeDetailPage(
                          campus: widget.rekomendasi,
                          routef: '',
                        ))));
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.rekomendasi.cover),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  height: 48,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.rekomendasi.singkatan,
                            style: whiteFontStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: 5),
                        Text(widget.rekomendasi.nama,
                            style: whiteFontStyle.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
