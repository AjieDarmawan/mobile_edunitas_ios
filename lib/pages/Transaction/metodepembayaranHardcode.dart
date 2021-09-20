part of 'transaction.dart';

class MetodePembayaranHardcode extends StatefulWidget {
  final String bank, nama, nominal;

  MetodePembayaranHardcode({
    this.bank,
    this.nama,
    this.nominal,
  });

  @override
  _MetodePembayaranHardcodeState createState() =>
      _MetodePembayaranHardcodeState();
}

class _MetodePembayaranHardcodeState extends State<MetodePembayaranHardcode> {
  Widget bni() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(
        height: 0,
        thickness: 1,
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: mainColor1,
              ),
            ),
            Text("Instruksi Pembayaran", style: blackFontStyle2)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor1, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((1).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: '',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Catat kode pembayaran dan tagihan Anda',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' , kemudian'),
                            TextSpan(
                                text: ' pergi ke Bank terdekat',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' (BNI atau bank lainnya)'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((2).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: '',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(text: 'Ambil'),
                            TextSpan(
                                text: ' slip setoran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dan'),
                            TextSpan(
                                text:
                                    ' isi nomor rekening tujuan dengan kode pembayaran Anda',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: ' 988933837143584938',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red),
                            ),
                            TextSpan(
                              text:
                                  "\nNomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. ${widget.nama.toString()}\n",
                              style: blackFontStyle3.copyWith(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((3).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: '',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: const <TextSpan>[
                            TextSpan(
                                text:
                                    'Beritahukan ke Teller bahwa Anda ingin melakukan'),
                            TextSpan(
                                text: ' pembayaran virtual account',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((4).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: '',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'Teller akan mengkonfirmasi data pembayaran virtual account seperti Kode Pembayaran :'),
                            TextSpan(
                              text: ' 988933837143584938',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red),
                            ),
                            TextSpan(
                              text:
                                  "\nNomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. ${widget.nama.toString()}\n",
                              style: blackFontStyle3.copyWith(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            TextSpan(text: 'Atas Nama :'),
                            TextSpan(
                                text: ' Nama Anda',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ', Nama Pemilik Rekening :'),
                            TextSpan(
                                text: ' Gilland Ganesha',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((5).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Lakukan pembayaran ke Teller sesuai jumlah transaksi Anda",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((6).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Dapatkan',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' tanda terima sebagai bukti pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((7).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Selesai",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((8).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Jika sudah melebihi batas waktu, tanpa memakai kode unik dan tidak melakukan upload bukti donasi tetap bisa dilakukan akan tetapi menjadi donasi umum yang kemudian disalurkan oleh eduNitas ke campaign lain secara acak",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ]);
  }

  Widget bca() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(
        height: 0,
        thickness: 1,
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: mainColor1,
              ),
            ),
            Text("Instruksi Pembayaran", style: blackFontStyle2)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor1, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((1).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Transfer',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${widget.nominal.toString()})',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor1),
                            ),
                            TextSpan(text: ' ke rekening berikut :\n'),
                            TextSpan(text: ' \u2B24'),
                            TextSpan(text: ' Bank Central Asia (BCA)\n'),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Rekening no :'),
                            TextSpan(
                              text: ' 167 300 94 11\n',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Atas nama :'),
                            TextSpan(
                              text: ' Gilland Ganesha PT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((2).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Simpan baik-baik',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' “Bukti Transfer tersebut”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((3).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Kemudian silahkan Anda',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: [
                            TextSpan(
                                text: ' Upload Bukti Transfer',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dengan klik tombol '),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Unggah Struk',
                                  style:
                                      blueFontStyleBold.copyWith(fontSize: 10)),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((4).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Isi beberapa informasi pendukung ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Bukti Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' Anda'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((5).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text:
                              'Jika pengisian form sudah selesai silahkan klik tombol ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '“UPLOAD”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((6).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Harap tunggu, ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Pembayaran Anda sedang kami proses',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((7).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Selesai",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ]);
  }

  Widget bsi() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(
        height: 0,
        thickness: 1,
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: mainColor1,
              ),
            ),
            Text("Instruksi Pembayaran", style: blackFontStyle2)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor1, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((1).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Transfer',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${widget.nominal.toString()})',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor1),
                            ),
                            TextSpan(text: ' ke rekening berikut :\n'),
                            TextSpan(text: ' \u2B24'),
                            TextSpan(text: ' Bank Syariah Indonesia (BSI)\n'),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Rekening no :'),
                            TextSpan(
                              text: ' 714 358 49 38\n',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Atas nama :'),
                            TextSpan(
                              text: ' Yayasan Andra',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((2).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Simpan baik-baik',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' “Bukti Transfer tersebut”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((3).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Kemudian silahkan Anda',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: [
                            TextSpan(
                                text: ' Upload Bukti Transfer',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dengan klik tombol '),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Unggah Struk',
                                  style:
                                      blueFontStyleBold.copyWith(fontSize: 10)),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((4).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Isi beberapa informasi pendukung ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Bukti Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' Anda'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((5).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text:
                              'Jika pengisian form sudah selesai silahkan klik tombol ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '“UPLOAD”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((6).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Harap tunggu, ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Pembayaran Anda sedang kami proses',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((7).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Selesai",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ]);
  }

  Widget bri() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(
        height: 0,
        thickness: 1,
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: mainColor1,
              ),
            ),
            Text("Instruksi Pembayaran", style: blackFontStyle2)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor1, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((1).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Transfer',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${widget.nominal.toString()})',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor1),
                            ),
                            TextSpan(text: ' ke rekening berikut :\n'),
                            TextSpan(text: ' \u2B24'),
                            TextSpan(text: ' Bank BRI\n'),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Rekening no :'),
                            TextSpan(
                              text: ' 042101000915300\n',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Atas nama :'),
                            TextSpan(
                              text: '  Gilland Ganesha PT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((2).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Simpan baik-baik',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' “Bukti Transfer tersebut”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((3).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Kemudian silahkan Anda',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: [
                            TextSpan(
                                text: ' Upload Bukti Transfer',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dengan klik tombol '),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Unggah Struk',
                                  style:
                                      blueFontStyleBold.copyWith(fontSize: 10)),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((4).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Isi beberapa informasi pendukung ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Bukti Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' Anda'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((5).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text:
                              'Jika pengisian form sudah selesai silahkan klik tombol ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '“UPLOAD”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((6).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Harap tunggu, ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Pembayaran Anda sedang kami proses',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((7).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Selesai",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ]);
  }

  Widget mandiri() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(
        height: 0,
        thickness: 1,
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.receipt_long_outlined,
                color: mainColor1,
              ),
            ),
            Text("Instruksi Pembayaran", style: blackFontStyle2)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor1, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((1).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Transfer',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${widget.nominal.toString()})',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor1),
                            ),
                            TextSpan(text: ' ke rekening berikut :\n'),
                            TextSpan(text: ' \u2B24'),
                            TextSpan(text: ' Bank Mandiri\n'),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Rekening no :'),
                            TextSpan(
                              text: ' 157 000 700 0111\n',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '     \u2610'),
                            TextSpan(text: ' Atas nama :'),
                            TextSpan(
                              text: '  Gilland Ganesha PT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((2).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Simpan baik-baik',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' “Bukti Transfer tersebut”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((3).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Kemudian silahkan Anda',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: [
                            TextSpan(
                                text: ' Upload Bukti Transfer',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' dengan klik tombol '),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Unggah Struk',
                                  style:
                                      blueFontStyleBold.copyWith(fontSize: 10)),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((4).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Isi beberapa informasi pendukung ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Bukti Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' Anda'),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((5).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text:
                              'Jika pengisian form sudah selesai silahkan klik tombol ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '“UPLOAD”',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        child: Center(
                          child: Text((6).toString(), style: blackFontStyle3),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Harap tunggu, ',
                          style: blackFontStyle1.copyWith(fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Pembayaran Anda sedang kami proses',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 20,
                          child: Center(
                            child: Text((7).toString(), style: blackFontStyle3),
                          )),
                      Expanded(
                        child: Text(
                          "Selesai",
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.bank == "bni"
          ? bni()
          : widget.bank == "bsm"
              ? bsi()
              : widget.bank == "bri"
                  ? bri()
                  : widget.bank == "mandiri"
                      ? mandiri()
                      : bca(),
    );
  }
}
