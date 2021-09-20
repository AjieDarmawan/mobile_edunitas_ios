part of 'inboxPages.dart';

class MainNotification extends StatefulWidget {
  MainNotification({Key key}) : super(key: key);

  @override
  _MainNotification createState() => _MainNotification();
}

class _MainNotification extends State<MainNotification> {
  var globalkey = "", globalEmail = "";
  var status = false;
  var mystatus = false;
  // SessionManager sessionManager = SessionManager();
   ScrollController _controller;
  // var gabs = ApiNotif.getData;

  // void getPreferences() async {
  //   await sessionManager.getPreference().then((value) {//handled
  //     setState(() {
  //       mystatus = sessionManager.status;
  //       globalkey = sessionManager.key;
  //       globalEmail = sessionManager.email;
  //       print("email${globalEmail}");
  //       print("globalkey${globalkey}");
  //       print("mystatus${mystatus}");
  //     });
  //   });
  // }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  @override
  void initState() {
    super.initState();
   // getPreferences();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(child: globalkey == null ? NonLogin() : NoMessage()
          // : Container(
          //     child: ListView.builder(
          //         itemCount: gabs.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             child: Column(
          //               children: [
          //                 ListTile(
          //                   title: Text(
          //                     gabs[index]['pname'],
          //                     style: TextStyle(
          //                         color: mainColor1,
          //                         fontWeight: FontWeight.bold),
          //                     textAlign: TextAlign.left,
          //                   ),
          //                   subtitle: Text(
          //                     gabs[index]['pmessage'],
          //                     style: TextStyle(
          //                       color: mainColor1,
          //                     ),
          //                     overflow: TextOverflow.ellipsis,
          //                     textAlign: TextAlign.left,
          //                   ),
          //                   trailing: Text(
          //                     gabs[index]['time'],
          //                     style: TextStyle(
          //                       color: mainColor1,
          //                     ),
          //                     textAlign: TextAlign.right,
          //                   ),
          //                 ),
          //                 Divider(
          //                   color: Colors.black45,
          //                   thickness: 1,
          //                   indent: 20,
          //                   endIndent: 20,
          //                 ),
          //               ],
          //             ),
          //           );
          //         }),
          //   ),
          ),
    );
  }
}

class ApiNotif {
  static final getData = [
    {
      'pname': 'Bayar Kuliah Dapat Diskon',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    },
    {
      'pname': 'Info Terbaru Kampus Idaman',
      'pmessage':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'time': '3 Mar'
    },
  ];
}
