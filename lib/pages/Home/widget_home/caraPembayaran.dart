part of 'widget_home.dart';

class CaraPembayaran extends StatefulWidget {
  CaraPembayaran({Key key}) : super(key: key);

  @override
  _CaraPembayaranState createState() => _CaraPembayaranState();
}

class _CaraPembayaranState extends State<CaraPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: mainColor1,
        title: Text("Cara Pembayaran"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Virtual Account BSI", style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor1)),
                        Container(width: 50, height: 50,
                          child: Image.asset('assets/transaksi/bni@2x.png')),
                      ],
                    ),
                    Divider(thickness: 1, color: CupertinoColors.systemGrey2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Virtual Account", style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor1)),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.copy, color: mainColor1,),
                              onPressed: () {
                                Clipboard.setData(new ClipboardData(text: ("1234567")));
                                Fluttertoast.showToast(
                                    msg: "Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0

                                );
                              },
                            ),
                            Text("1234567", style: TextStyle(color: mainColor1,))],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pembayaran", style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor1)),
                        Text("Rp. 100.000", style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor1)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Divider(thickness: 1, color: CupertinoColors.systemGrey2,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: CupertinoColors.systemGrey4,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 20, left: 10),
                                    child: Text(
                                      "Total Angsuran Petama",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: mainColor1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.keyboard_arrow_up,
                            collapseIcon: Icons.keyboard_arrow_down,
                            iconColor: Color(0xFF1661D5),
                            iconSize: 28.0,
                            //iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text(
                              "Catat kode pembayaran Anda (0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih), kemudian pergi ke cabang BSI terdekat.", style: TextStyle(color: mainColor1), maxLines: 10,),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Ambil slip setoran dan isi nomor rekening tujuan dengan nomor pembayaran 10 digit Anda : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih", style: TextStyle(color: mainColor1), maxLines: 10,),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Beritahukan ke Teller bahwa Anda ingin melakukan pembayaran institusi : program perkuliahan karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                          )

                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Jika Teller tidak mengetahui Program Perkuliahan Karyawan, berikan intruksi untuk menggunakan internet banking cabang, lalu pilihmenu pembayaran, kemudian pilih institusi dan cari Akademik – Program Perkuliahan Karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Teller akan mengkonfirmasi data pembayaran virtual account seperti Nomor Pembayaran : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih , Atas Nama : Nama Mahasiswa", style: TextStyle(color: mainColor1),maxLines: 10,),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("6", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Jumlah Tagihan : sesuai tagihan mahasiswa Lakukan pembayaran ke Teller sesuai jumlah transaksi Anda", style: TextStyle(color: mainColor1),maxLines: 10,),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("7.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text("Dapatkan tanda terima sebagai bukti pembayaran", style: TextStyle(color: mainColor1),maxLines: 10,),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("8.", style: TextStyle(color: mainColor1),),
                          SizedBox(width: 5,),
                          Text("Selesai", style: TextStyle(color: mainColor1),),
                        ],
                      ),
                    ],
                  )
                ),
              ),
              SizedBox(height: 5,),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: CupertinoColors.systemGrey4,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 20, left: 10),
                                    child: Text(
                                      "Mobile Banking",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: mainColor1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.keyboard_arrow_up,
                            collapseIcon: Icons.keyboard_arrow_down,
                            iconColor: Color(0xFF1661D5),
                            iconSize: 28.0,
                            //iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: Container(
                    /*padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text(
                                "Catat kode pembayaran Anda (0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih), kemudian pergi ke cabang BSI terdekat.", style: TextStyle(color: mainColor1), maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("2.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Ambil slip setoran dan isi nomor rekening tujuan dengan nomor pembayaran 10 digit Anda : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih", style: TextStyle(color: mainColor1), maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("3.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Beritahukan ke Teller bahwa Anda ingin melakukan pembayaran institusi : program perkuliahan karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                            )

                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Jika Teller tidak mengetahui Program Perkuliahan Karyawan, berikan intruksi untuk menggunakan internet banking cabang, lalu pilihmenu pembayaran, kemudian pilih institusi dan cari Akademik – Program Perkuliahan Karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("5.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Teller akan mengkonfirmasi data pembayaran virtual account seperti Nomor Pembayaran : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih , Atas Nama : Nama Mahasiswa", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Jumlah Tagihan : sesuai tagihan mahasiswa Lakukan pembayaran ke Teller sesuai jumlah transaksi Anda", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Dapatkan tanda terima sebagai bukti pembayaran", style: TextStyle(color: mainColor1),maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("8.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            Text("Selesai", style: TextStyle(color: mainColor1),),
                          ],
                        ),
                      ],
                    )*/
                ),
              ),
              SizedBox(height: 5,),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: CupertinoColors.systemGrey4,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 20, left: 10),
                                    child: Text(
                                      "ATM",
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(color: mainColor1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.keyboard_arrow_up,
                            collapseIcon: Icons.keyboard_arrow_down,
                            iconColor: Color(0xFF1661D5),
                            iconSize: 28.0,
                            //iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: Container(
                  /*padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text(
                                "Catat kode pembayaran Anda (0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih), kemudian pergi ke cabang BSI terdekat.", style: TextStyle(color: mainColor1), maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("2.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Ambil slip setoran dan isi nomor rekening tujuan dengan nomor pembayaran 10 digit Anda : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih", style: TextStyle(color: mainColor1), maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("3.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Beritahukan ke Teller bahwa Anda ingin melakukan pembayaran institusi : program perkuliahan karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                            )

                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Jika Teller tidak mengetahui Program Perkuliahan Karyawan, berikan intruksi untuk menggunakan internet banking cabang, lalu pilihmenu pembayaran, kemudian pilih institusi dan cari Akademik – Program Perkuliahan Karyawan", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("5.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Teller akan mengkonfirmasi data pembayaran virtual account seperti Nomor Pembayaran : 0001130020 Nomor Virtual Account (VA) tersebut di atas adalah norek VA a.n. Aprea Kosasih , Atas Nama : Nama Mahasiswa", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Jumlah Tagihan : sesuai tagihan mahasiswa Lakukan pembayaran ke Teller sesuai jumlah transaksi Anda", style: TextStyle(color: mainColor1),maxLines: 10,),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Text("Dapatkan tanda terima sebagai bukti pembayaran", style: TextStyle(color: mainColor1),maxLines: 10,),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("8.", style: TextStyle(color: mainColor1),),
                            SizedBox(width: 5,),
                            Text("Selesai", style: TextStyle(color: mainColor1),),
                          ],
                        ),
                      ],
                    )*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}