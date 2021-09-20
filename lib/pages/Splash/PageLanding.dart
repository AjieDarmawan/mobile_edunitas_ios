part of 'intro.dart';



class PageLanding extends StatefulWidget {
  PageLanding({Key key}) : super(key: key);

  @override
  _PageLandingState createState() => _PageLandingState();
}

class _PageLandingState extends State<PageLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: EdgeInsets.only(top: 100),
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Text(
                        "Daftar \n Sekarang",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              Positioned.fill(
                child: Image.asset(
                  'assets/intro/bg1.png',
                  fit: BoxFit.fitWidth,
                  height: 415,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      child: Positioned.fill(
                        child: Image.asset(
                          'assets/intro/icon1.png',
                          fit: BoxFit.fitWidth,
                          height: 182,
                          width: 230,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        color: Colors.yellow,
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SIGN_IN, (route) => false);
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        color: Colors.yellow,
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SIGN_UP, (route) => false);
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 140),
                        child: Row(
                          children: [
                            Text(
                              "*",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (Navigation_bottom(selectedIndex: 0,))));
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
