// part of 'karir.dart';

// class KarirMain extends StatefulWidget{
//   @override
//   _KarirMainState createState() => _KarirMainState();
// }

// class _KarirMainState extends State<KarirMain>{

//   var logo = [1,0,0,0];
//   var smallImg = [0,0,0,1];
//   var bigImg = [0,0,1,0];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Karir"),
//         backgroundColor: mainColor1,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TopBanner(),
//             CustomKarirList()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget TopBanner() {
//     return Container(
//       margin: EdgeInsets.only(top: 16),
//       height: 80,
//       width: MediaQuery.of(context).size.width-32,
//       decoration: BoxDecoration(
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 3,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//         color: mainColor1,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }

//   Widget CustomKarirList() {
//     return Column(
//       children: [
//         ListView.builder(
//           itemCount: 4,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, i) {
//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 3,
//                     blurRadius: 6,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               margin: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(10.0))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: smallImg[i]==0?4:3,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("PT. Gilland Ganesha", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
//                                     bigImg[i]==1
//                                         ? Container(child: SizedBox(height: 5,),)
//                                         : smallImg[i]==1
//                                         ? Column(
//                                         children: [
//                                           SizedBox(height: 5,),
//                                           Text('Memeriksa invoice sebelum ditandatangani direksi dan sebelum dikirim ke client~Mengontrol tim dalam pengiriman invoice~Mengontrol tim dalam follow up e-faktur dan pembawaran~Membuat target awal dan',
//                                             maxLines: 4,),
//                                         ])
//                                         : logo[i]==1
//                                         ? Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 5,),
//                                         Text("Specialist Search Engine Optimitation", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w900, fontSize: 12),),
//                                         SizedBox(height: 5,),
//                                         Container(
//                                           height: 25,
//                                           width: 75,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.white,
//                                               side: BorderSide(width: 1.0, color: mainColor),
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius: new BorderRadius.circular(10.0)),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'Category',
//                                                 maxLines: 1,
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black),
//                                               ),
//                                             ),
//                                             onPressed: (){

//                                             },
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                         : Container()

//                                   ],
//                                 ),
//                               ),
//                               bigImg[i]==1
//                                   ? Container()
//                                   : Expanded(
//                                 flex: smallImg[i]==0?1:3,
//                                 child: logo[i]==1
//                                     ? Container(
//                                     width: 50,
//                                     height: 100,
//                                     color: Colors.white,
//                                     child: Icon(Icons.school, size: 50, color: Colors.grey,)
//                                 )
//                                     : smallImg[i]==1
//                                     ? Container(
//                                     width: 50,
//                                     height: 100,
//                                     color: abuColor,
//                                 )
//                                     : Container()
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 1,
//                         ),
//                         bigImg[i]==1
//                             ? Column(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 130,
//                               color: abuColor,
//                             ),
//                             Divider(
//                               height: 1,
//                             ),
//                           ],
//                         ):Container(),
//                         smallImg[i]==1
//                             ? Container()
//                             : Container(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             'Memeriksa invoice sebelum ditandatangani direksi dan sebelum dikirim ke client~Mengontrol tim dalam pengiriman invoice~Mengontrol tim dalam follow up e-faktur dan pembawaran~Membuat target awal dan',
//                             maxLines: bigImg[i]==1?2:4,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     height: 1,
//                   ),
//                   Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: mainColor1,
//                           borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(10.0))),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           bigImg[i]==0 && smallImg[i]==0 && logo[i]==1
//                           ?Container(
//                             width: 100,
//                             child: Row(
//                               children: [
//                                 Icon(Icons.place, color: Colors.white,),
//                                 Text("Tempat", style: TextStyle(color: Colors.white),)
//                               ],
//                             )

//                           ):Container(),
//                           Text("sampai dengan", style: TextStyle(color: Colors.white),)
//                         ],
//                       )
//                   ),
//                 ],
//               ),
//             );
//           }
//         )
//       ],
//     );
//   }
// }