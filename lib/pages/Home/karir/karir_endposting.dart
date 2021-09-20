part of 'karir.dart';

class KarirEndPosting extends StatefulWidget {
  @override
  _KarirEndPostingState createState() => _KarirEndPostingState();
  final String email,
      keycode,
      password_temp,
      email_temp,
      codereff_temp,
      userbaru_temp;

  KarirEndPosting({
    this.email,
    this.keycode,
    this.password_temp,
    this.email_temp,
    this.codereff_temp,
    this.userbaru_temp,
  });
}

class _KarirEndPostingState extends State<KarirEndPosting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              )),
              automaticallyImplyLeading: false,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: mainColor1,
              expandedHeight: 90.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Selamat !!! Lowongan Kerja Anda sudah berhasil didaftarkan',
                    style: whiteFontStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            widget.keycode == null
                ? EndpostingNoLogin(
                    email: widget.email,
                    keycode: widget.keycode,
                    password_temp: widget.password_temp,
                    email_temp: widget.email_temp,
                    codereff_temp: widget.codereff_temp,
                    userbaru_temp: widget.userbaru_temp)
                : EndpostingLogin(
                    email: widget.email,
                    keycode: widget.keycode,
                    password_temp: widget.password_temp,
                    email_temp: widget.email_temp,
                    codereff_temp: widget.codereff_temp,
                    userbaru_temp: widget.userbaru_temp,
                  )
          ],
        ));
  }
}

class EndpostingNoLogin extends StatelessWidget {
  final String email,
      keycode,
      password_temp,
      email_temp,
      codereff_temp,
      userbaru_temp;

  EndpostingNoLogin({
    this.email,
    this.keycode,
    this.password_temp,
    this.email_temp,
    this.codereff_temp,
    this.userbaru_temp,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue[50],
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Mohon sabar untuk menunggu proses pengecekan dan approval dari team kami. setelah lowongan kerja anda disetujui maka akan langsung tampil di halaman list lowongan karir edunitas.',
          style: blueFontStyleBold,
        ),
      ),
      Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2, color: mainColor1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login ke aplikasi eduNitas dengan menggunakan :',
                style: blackFontStyle1Bold.copyWith(fontSize: 14)),
            Container(
              margin: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(64),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Username : '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          email_temp.toString() == null
                              ? ""
                              : email_temp.toString(),
                          style: blueFontStyle,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Password : '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          password_temp.toString() == null
                              ? ""
                              : password_temp.toString(),
                          style: blueFontStyle,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Kode Aktivasi : '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          codereff_temp.toString() == null
                              ? ""
                              : codereff_temp.toString(),
                          style: blueFontStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Cek status dari iklan lowongan kerja anda, jika status lowongan masih belum di approved oleh pihak kami, anda dipersilakan untuk edit lowongan.\nAnda bisa cek cv digital para pelamar yang melamar pada iklan Anda, bisa melakukan manage aksi untuk lanjut interview, terima dan tolak pelamar.',
              style: blackFontStyle3,
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Container(
          height: 48,
          child: EduButton(
              buttonText: 'Login untuk cek status dan tambah',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Login())));
              }),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Container(
          height: 48,
          child: EduButtonSecond(
              buttonText: 'Kembali',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (KarirPilihTemplate())));
              }),
        ),
      ),
    ]));
  }
}

//kalo dia posisinya udah login munculin yg ini
class EndpostingLogin extends StatelessWidget {
  final String email,
      keycode,
      password_temp,
      email_temp,
      codereff_temp,
      userbaru_temp;

  EndpostingLogin({
    this.email,
    this.keycode,
    this.password_temp,
    this.email_temp,
    this.codereff_temp,
    this.userbaru_temp,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue[50],
          ),
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Mohon sabar untuk menunggu proses pengecekan dan approval dari team kami. setelah lowongan kerja anda disetujui maka akan langsung tampil di halaman list lowongan karir edunitas.',
            style: blueFontStyleBold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: FixedColumnWidth(64),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1',
                      style: blueFontStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cek status dari iklan lowongan kerja anda, jika status lowongan masih belum di approval oleh pihak kami, anda dipersilahkan untuk edit lowongan.',
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '2',
                      style: blueFontStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Anda bisa cek CV digital para pelamar yang melamar pada iklan anda, bisa melakukan manage aksi untuk lanjut interview, terima dan tolak pelamar',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Container(
            height: 48,
            child: EduButton(
                buttonText: 'Cek list dan status lowongan',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (KarirMyapply(
                                keycode: keycode.toString() == null
                                    ? ""
                                    : keycode.toString(),
                                namalengkap: email_temp.toString() == null
                                    ? ""
                                    : email_temp.toString(),
                              ))));
                }),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Container(
            height: 48,
            child: EduButtonSecond(
                buttonText: 'Tambah lowongan lain',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (KarirPilihTemplate())));
                }),
          ),
        ),
      ]),
    );
  }
}
