part of 'widget.dart';

class Navigation_bottom extends StatefulWidget {
  final int selectedIndex;
  Navigation_bottom({Key key, this.selectedIndex}) : super(key: key);

  @override
  _Navigation_bottomState createState() => _Navigation_bottomState();
}

class _Navigation_bottomState extends State<Navigation_bottom>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int _selectedIndex;
  static List<Widget> _tabs = <Widget>[
    MainHome(),
    MainWishlist(),
    MainTransaction(),
    MainAccount(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    //print("Print ${tabController.index}");
    tabController.addListener(_getActiveTabIndex);
    if (_selectedIndex == null) {
      _selectedIndex = 0;
    }
    ;
    debugPrint('CURRENT_PAGE $_selectedIndex');
  }

  void _getActiveTabIndex() {
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
    _selectedIndex = tabController.index;
    debugPrint('CURRENT_PAGE $_selectedIndex');
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow,
            child: Icon(Icons.qr_code),
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      body: Center(
        child: _tabs.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset('assets/navigasi/hmmdpi.png', height: 24),
            activeIcon:
                new Image.asset('assets/navigasi/hmamdpi.png', height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/navigasi/wishmdpi.png', height: 24),
            activeIcon:
                new Image.asset('assets/navigasi/wishamdpi.png', height: 24),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/navigasi/transmdpi.png', height: 24),
            activeIcon:
                new Image.asset('assets/navigasi/transamdpi.png', height: 24),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/navigasi/usrmdpi.png', height: 24),
            activeIcon:
                new Image.asset('assets/navigasi/usramdpi.png', height: 24),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
