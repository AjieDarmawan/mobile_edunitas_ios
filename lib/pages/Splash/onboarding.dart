part of 'intro.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // ignore: deprecated_member_use
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlide();
   // initPlatformState();
  }

  String _deviceId = 'Unknown';
  // Future<void> initPlatformState() async {
  //   String deviceId;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _deviceId = deviceId;

  //     print("deviceId->$_deviceId");
  //   });
  // }

  // SessionManager sessionManager = SessionManager();
  // void cekdevices() {
  //   setState(() {
  //     sessionManager.saveandroid_id(_deviceId);
  //   });
  //   Navigator.of(context).pushNamedAndRemoveUntil(SIGN_IN, (route) => false);
  //   // UserViewModel().android_id_update(_deviceId.toString()).then((value) {
  //   //   StatusModel data = value;

  //   //   if (data.status == 200) {
  //   // Navigator.of(context)
  //   //     .pushNamedAndRemoveUntil(SIGN_IN, (route) => false);
  //   //   }
  //   // });
  // }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.lightBlue[900] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return Slider(
              imgAssetsPath: slides[index].getImgAssetsPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: 72,
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  SizedBox(
                    height: 32,
                    width: 120,
                    child: EduButton(
                      onPressed: () {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      buttonText: 'Selanjutnya',
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: 72,
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  SizedBox(
                    height: 32,
                    width: 120,
                    child: EduButton(
                      onPressed: () {
                        //cekdevices();
                      },
                      buttonText: 'Mulai',
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

// ignore: must_be_immutable
class Slider extends StatelessWidget {
  String imgAssetsPath, title, desc;
  Slider({this.imgAssetsPath, this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgAssetsPath),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: blueFontStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 150),
            margin: EdgeInsets.all(48),
            child: Text(
              desc,
              style: whiteFontStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
