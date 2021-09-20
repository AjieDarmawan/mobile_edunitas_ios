part of 'account.dart';

class SettingAccount extends StatefulWidget {
  @override
  _SettingAccount createState() => _SettingAccount();
}

class _SettingAccount extends State<MainAccount> {
  var globalkey = "",
      globalEmail = "";
  var status = false;
  var mystatus = false;
 // SessionManager sessionManager = SessionManager();

  void getPreferences() async {
    // await sessionManager.getPreference().then((value) {//handled
    //   setState(() {
    //     mystatus = sessionManager.status;
    //     globalkey = sessionManager.key;
    //     globalEmail = sessionManager.email;
    //     print("email${globalEmail}");
    //     print("globalkey${globalkey}");
    //     print("mystatus${mystatus}");
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  signOut() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // setState(() {
    //   preferences.setBool("status", false);
    //   preferences.clear();
    //   preferences.commit();
    //   Navigator.of(context).pushNamedAndRemoveUntil(NAVI, (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: globalkey == null
            ? NonLogin()
            : Column(
          children: [
            Container(
              child: Text(globalEmail == null ? '' : globalEmail),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      Text('Logout12', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  color: mainColor,
                  textColor: Colors.white,
                  elevation: 5,
                ),
                Text(" "),
              ],
            )
          ],
        ),
      ),
    );
  }
}