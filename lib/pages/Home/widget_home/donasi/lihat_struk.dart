part of 'widget_donasi.dart';

class Lihat_struk extends StatefulWidget {
  final String method,nama_bank,txttime,txtdate,images;
  Lihat_struk({
    this.method,
    this.nama_bank,
    this.txttime,
    this.txtdate,
    this.images,
  });
  @override
  _Lihat_strukState createState() => _Lihat_strukState();
}

class _Lihat_strukState extends State<Lihat_struk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: mainColor1,
        title: Text(
          'Lihat Struk ',
          style: whiteFontStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Metode Pembayaran :"),
                    ),
                    Container(
                      child: Text(
                        widget.method.toString() == null ? "" : widget.method.toString() ,
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Bank yang digunakan :"),
                    ),
                    Container(
                      child: Text(
                        widget.nama_bank.toString() == null ? "" : widget.nama_bank.toString() ,
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Tanggal transaksi :"),
                    ),
                    Container(
                      child: Text(
                        widget.txtdate.toString() == null ? "" : widget.txtdate.toString() ,
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Waktu transaksi :"),
                    ),
                    Container(
                      child: Text(
                        widget.txttime.toString() == null ? "" : widget.txttime.toString() ,
                        style: blackFontStyle4.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            height:400,
            width:MediaQuery.of(context).size.width,
            child: Image.network(
                widget.images.toString()==null ? "" : widget.images.toString()),
          ),
        ],
      ),
    );
  }
}
