part of 'Auth.dart';

class NonLogin extends StatefulWidget {
  NonLogin({Key key}) : super(key: key);

  @override
  _NonLoginState createState() => _NonLoginState();
}

class _NonLoginState extends State<NonLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mustLoginxhdpi.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    "Anda Belum Masuk",
                    textAlign: TextAlign.center,
                    style: blueFontStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  child: Text(
                    "Silahkan masuk terlebih dahulu,\nuntuk mendapatkan akses ke akunmu",
                    textAlign: TextAlign.center,
                    style: blackFontStyle1.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 48,
                child: EduButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Login())));
                  },
                  buttonText: "Masuk",
                )

                // child: RaisedButton(
                //   elevation: 0,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(24)),
                //   color: Colors.yellow,
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => (Login())));
                //   },
                //   child: Text(
                //     "Login",
                //     style: GoogleFonts.poppins(
                //         color: Colors.blue, fontWeight: FontWeight.w500),
                //   ),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
