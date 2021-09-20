part of 'widget_donasi.dart';

class DetailLengkapDonasi extends StatefulWidget {
  final DonasiKabarModel datakabar;

  DetailLengkapDonasi({
    this.datakabar,
  });

  @override
  _DetailLengkapDonasiState createState() => _DetailLengkapDonasiState();
}

class _DetailLengkapDonasiState extends State<DetailLengkapDonasi> {

  DonasiKabarModel data;

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  @override
  void initState() {
    super.initState();
    data = widget.datakabar==null?null:widget.datakabar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Pengalaman',
          style: whiteFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0))),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(data.cover??""), fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(data.judul, style: blueFontStyleBold,),
            Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
            ),
            Text(_parseHtmlString(data.textmessage).replaceAll("<br>", ""), style: blackFontStyle3,),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 100,
                child: EduButton(
                  buttonText: "Bantu Mereka Kembali",
                  textColor: mainColor1,
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                    (FormulirDonasi())));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Selalu Berbagilah,\neduNitas", style: blackFontStyle3,),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: mainColor1,size: 10,),
                      Text(" "+data.waktu, style: blueFontStyle,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}