// part of 'intro.dart';

// class IntroSliderScreen extends StatefulWidget {
//   IntroSliderScreen({Key key}) : super(key: key);

//   @override
//   IntroSliderScreenState createState() => new IntroSliderScreenState();
// }

// //------------------ Custom config ------------------
// // class IntroSliderScreenState extends State<IntroSliderScreen> {
// //  List<Slide> slides = new List();
// //
// //  @override
// //  void initState() {
// //    super.initState();
// //
// //    slides.add(
// //      new Slide(
// //        title:
// //            "A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE",
// //        maxLineTitle: 2,
// //        styleTitle:
// //            TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
// //        description:
// //            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
// //        styleDescription:
// //            TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
// //        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
// //        centerWidget: Text("Replace this with a custom widget", style: TextStyle(color: Colors.white)),
// //        colorBegin: Color(0xffFFDAB9),
// //        colorEnd: Color(0xff40E0D0),
// //        backgroundImage: 'images/photo_eraser.png',
// //        directionColorBegin: Alignment.topLeft,
// //        directionColorEnd: Alignment.bottomRight,
// //        onCenterItemPress: () {},
// //      ),
// //    );
// //    slides.add(
// //      new Slide(
// //        title: "MUSEUM",
// //        styleTitle:
// //            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
// //        description: "Ye indulgence unreserved connection alteration appearance",
// //        styleDescription:
// //            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
// //        pathImage: "images/photo_museum.png",
// //        colorBegin: Color(0xffFFFACD),
// //        colorEnd: Color(0xffFF6347),
// //        directionColorBegin: Alignment.topRight,
// //        directionColorEnd: Alignment.bottomLeft,
// //      ),
// //    );
// //    slides.add(
// //      new Slide(
// //        title: "COFFEE",
// //        styleTitle:
// //            TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
// //        description:
// //            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
// //        styleDescription:
// //            TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
// //        pathImage: "images/photo_coffee_shop.png",
// //        colorBegin: Color(0xffFFA500),
// //        colorEnd: Color(0xff7FFFD4),
// //        directionColorBegin: Alignment.topCenter,
// //        directionColorEnd: Alignment.bottomCenter,
// //        maxLineTextDescription: 3,
// //      ),
// //    );
// //  }
// //
// //  void onDonePress() {
// // //    Do what you want
// // //    Navigator.push(
// // //      context,
// // //      MaterialPageRoute(builder: (context) => HomeScreen()),
// // //    );
// //  }
// //
// //  Widget renderNextBtn() {
// //    return Icon(
// //      Icons.navigate_next,
// //      color: Color(0xffD02090),
// //      size: 35.0,
// //    );
// //  }
// //
// //  Widget renderDoneBtn() {
// //    return Icon(
// //      Icons.done,
// //      color: Color(0xffD02090),
// //    );
// //  }
// //
// //  Widget renderSkipBtn() {
// //    return Icon(
// //      Icons.skip_next,
// //      color: Color(0xffD02090),
// //    );
// //  }
// //
// //  @override
// //  Widget build(BuildContext context) {
// //    return new IntroSliderScreenSlider(
// //      // List slides
// //      slides: this.slides,
// //
// //      // Skip button
// //      renderSkipBtn: this.renderSkipBtn(),
// //      colorSkipBtn: Color(0x33000000),
// //      highlightColorSkipBtn: Color(0xff000000),
// //
// //      // Next button
// //      renderNextBtn: this.renderNextBtn(),
// //
// //      // Done button
// //      renderDoneBtn: this.renderDoneBtn(),
// //      onDonePress: this.onDonePress,
// //      colorDoneBtn: Color(0x33000000),
// //      highlightColorDoneBtn: Color(0xff000000),
// //
// //      // Dot indicator
// //      colorDot: Color(0x33D02090),
// //      colorActiveDot: Color(0xffD02090),
// //      sizeDot: 13.0,
// //
// //      // Show or hide status bar
// //      shouldHideStatusBar: true,
// //      backgroundColorAllSlides: Colors.grey,
// //
// //      // Scrollbar
// //      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
// //    );
// //  }
// // }

// //------------------ Custom your own tabs ------------------
// class IntroSliderScreenState extends State<IntroSliderScreen> {
//   List<Slide> slides = new List();

//   Function goToTab;

//   @override
//   void initState() {
//     super.initState();

//     slides.add(
//       new Slide(
//         title: "SCHOOL",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "images/photo_school.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "MUSEUM",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Ye indulgence unreserved connection alteration appearance",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "images/photo_museum.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "COFFEE SHOP",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "images/photo_coffee_shop.png",
//       ),
//     );
//   }

//   void onDonePress() {
//     //this.goToTab(0);
//     Navigator.of(context)
//         .pushNamedAndRemoveUntil(PAGELANDING, (route) => false);
//   }

//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//   }

//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: Color(0xffffcc5c),
//       size: 35.0,
//     );
//   }

//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: Color(0xffffcc5c),
//     );
//   }

//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: Color(0xffffcc5c),
//     );
//   }

//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = new List();
//     for (int i = 0; i < slides.length; i++) {
//       Slide currentSlide = slides[i];
//       tabs.add(Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//           child: ListView(
//             children: <Widget>[
//               GestureDetector(
//                   child: Image.asset(
//                 currentSlide.pathImage,
//                 width: 200.0,
//                 height: 200.0,
//                 fit: BoxFit.contain,
//               )),
//               Container(
//                 child: Text(
//                   currentSlide.title,
//                   style: currentSlide.styleTitle,
//                   textAlign: TextAlign.center,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//               Container(
//                 child: Text(
//                   currentSlide.description,
//                   style: currentSlide.styleDescription,
//                   textAlign: TextAlign.center,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ));
//     }
//     return tabs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       // List slides
//       // slides: this.slides,

//       // Skip button
//       renderSkipBtn: this.renderSkipBtn(),
//       colorSkipBtn: Color(0x33ffcc5c),
//       highlightColorSkipBtn: Color(0xffffcc5c),

//       // Next button
//       renderNextBtn: this.renderNextBtn(),

//       // Done button
//       renderDoneBtn: this.renderDoneBtn(),
//       onDonePress: this.onDonePress,
//       colorDoneBtn: Color(0x33ffcc5c),
//       highlightColorDoneBtn: Color(0xffffcc5c),

//       // Dot indicator
//       colorDot: Color(0xffffcc5c),
//       sizeDot: 13.0,
//       typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

//       // Tabs
//       listCustomTabs: this.renderListCustomTabs(),
//       backgroundColorAllSlides: Colors.white,
//       refFuncGoToTab: (refFunc) {
//         this.goToTab = refFunc;
//       },

//       // Behavior
//       scrollPhysics: BouncingScrollPhysics(),

//       // Show or hide status bar
//       shouldHideStatusBar: true,

//       // On tab change completed
//       onTabChangeCompleted: this.onTabChangeCompleted,
//     );
//   }
// }
