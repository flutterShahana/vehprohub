// import 'package:flutter/material.dart';
// import 'package:searchbar_animation/searchbar_animation.dart';
//
// class WorkshopServices extends StatefulWidget {
//   const WorkshopServices({Key? key}) : super(key: key);
//
//   @override
//   State<WorkshopServices> createState() => _WorkshopServicesState();
// }
//
// class _WorkshopServicesState extends State<WorkshopServices> {
//   double _rating = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Work Shop"),
//         backgroundColor: Colors.purple[200],
//
//         actions: [
//           IconButton(
//               onPressed: (){
//                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
//
//               },
//               icon:const Icon(Icons.filter_list_alt)
//           )
//         ],
//       ),
//
//       body: Container(
//         height: double.infinity ,
//         width: MediaQuery.of(context).size.width,
//
//         child:SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//
//             children: [
//               const SizedBox(height: 12),
//               Padding(padding: const EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0,right: 10.0),
//
//                 child: Card(
//                   elevation: 10,
//                   child: Column(
//
//                     children: [
//                       SearchBarAnimation(
//                         textEditingController: TextEditingController(),
//                         isOriginalAnimation: false,
//                         enableKeyboardFocus: true,
//                         buttonBorderColour: Colors.black45,
//                         buttonWidget:const Icon( Icons.search),
//                         onFieldSubmitted: (String value){
//                           debugPrint('onFieldSubmitted value $value');
//                         }, trailingWidget: const Icon(
//                         Icons.search,
//                         size: 20,
//                         color: Colors.black,
//                       )
//                         , secondaryButtonWidget:  const Icon(
//                         Icons.close,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//
//                       ),
//                       Container(
//                         height: 150,
//                         // width: 100,
//                         decoration:  const BoxDecoration(
//
//                             image: DecorationImage(image:AssetImage("images/cabtop.jpg"),
//                               fit: BoxFit.fill,
//
//                             )
//                         ),
//
//                       ),
//                       Container(
//                         height:30,
//                         width:310 ,
//                         color: Colors.red.shade100,
//                         child: const Text("VEHICLE WORKSHOP SERVICES",
//                           textAlign: TextAlign.center,
//                           style:TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               const Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text("Workshop Types",style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 ),
//               ),
//
//               // const SizedBox(height: 14),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//               //   child: Card(
//               //     color: Colors.cyan,
//               //     child: Column(
//               //       crossAxisAlignment: CrossAxisAlignment.start,
//               //       children: [
//               //         const Padding(
//               //           padding: EdgeInsets.all(20.0),
//               //           child: Row(
//               //             children: [
//               //               Text(
//               //                 "Car",
//               //                 style: TextStyle(
//               //                   fontSize: 14,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //
//               //               Text("show more",
//               //                 style: TextStyle(
//               //                   fontSize: 14,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),),
//               //               Icon(
//               //                 Icons.arrow_forward,
//               //                 size: 18,
//               //                 weight:18,
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //
//               //
//               //         SizedBox(
//               //           height: 180,
//               //           child: ListView.builder(
//               //             scrollDirection: Axis.horizontal,
//               //             itemCount: 3,
//               //             itemBuilder: (context, index) {
//               //               return Padding(
//               //                 padding: const EdgeInsets.only(left: 5.0),
//               //                 child: Card(
//               //                   elevation: 10,
//               //                   child: Column(
//               //                     children: [
//               //                       Container(
//               //                         color: Colors.yellow[200],
//               //                         child: const Row(
//               //                           children: [
//               //                             Text("CAR ONE"),
//               //                             SizedBox(
//               //                               width: 5,
//               //                             ),
//               //                             Text("Detail 1"),
//               //                             SizedBox(
//               //                               width: 5,
//               //                             ),
//               //                             Text("Detail 1"),
//               //
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       const SizedBox(
//               //                         width: 10,
//               //                       ),
//               //                       Container(
//               //                         child: Row(
//               //                           children: [
//               //                             Container(
//               //                               height: 110,
//               //                               width: 140,
//               //                               decoration: const BoxDecoration(
//               //                                 image: DecorationImage(
//               //                                   image: AssetImage("images/img2.png"),
//               //                                   fit: BoxFit.fill,
//               //                                 ),
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //
//               //                     ],
//               //                   ),
//               //                 ),
//               //               );
//               //             },
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//
//               SizedBox(height: 10),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//                 child: Card(
//                   color: Colors.cyan,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Column(
//                               children: [
//                                 Text(
//                                   "Car",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabTravellerShowmore()));
//                                   },
//                                   child: const Text('Show more'),
//                                 ),
//                               ],
//                             ),
//                             // Icon(
//                             //   Icons.arrow_forward,
//                             //   size: 18,
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 180,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(),
//                               child: Card(
//                                 elevation: 10,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 140,
//
//                                       color: Colors.yellow[200],
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: const Row(
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("CAR ONE"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 1"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 2"),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Container(
//                                       height: 89,
//                                       width: 140,
//                                       decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                           image: AssetImage("images/img2.png"),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//                 child: Card(
//                   color: Colors.cyan,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Column(
//                               children: [
//                                 Text(
//                                   "Bike",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabTravellerShowmore()));
//                                   },
//                                   child: const Text('Show more'),
//                                 ),
//                               ],
//                             ),                            // Icon(
//                             //   Icons.arrow_forward,
//                             //   size: 18,
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 180,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(),
//                               child: Card(
//                                 elevation: 10,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 140,
//
//                                       color: Colors.yellow[200],
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: const Row(
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("BIKE ONE"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 1"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 2"),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Container(
//                                       height: 89,
//                                       width: 140,
//                                       decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                           image: AssetImage("images/img2.png"),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//                 child: Card(
//                   color: Colors.cyan,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                        Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Column(
//                               children: [
//                                 Text(
//                                   "Heavy Vehicles",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabTravellerShowmore()));
//                                   },
//                                   child: const Text('Show more'),
//                                 ),
//                               ],
//                             ),                            // Icon(
//                             //   Icons.arrow_forward,
//                             //   size: 18,
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 180,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(),
//                               child: Card(
//                                 elevation: 10,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 140,
//
//                                       color: Colors.yellow[200],
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: const Row(
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("CAR ONE"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 1"),
//                                               SizedBox(height: 3),
//                                               Text("Detail 2"),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Container(
//                                       height: 89,
//                                       width: 140,
//                                       decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                           image: AssetImage("images/img2.png"),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // SizedBox(height: 10),
//               //
//               //
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//               //   child: Card(
//               //     color: Colors.cyan,
//               //     child: Column(
//               //       crossAxisAlignment: CrossAxisAlignment.start,
//               //       children: [
//               //         const Padding(
//               //           padding: EdgeInsets.all(20.0),
//               //           child: Row(
//               //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //             crossAxisAlignment: CrossAxisAlignment.start,
//               //             children: [
//               //               Column(
//               //                 children: [
//               //                   Text(
//               //                     "Traveler",
//               //                     style: TextStyle(
//               //                       fontSize: 14,
//               //                       fontWeight: FontWeight.bold,
//               //                     ),
//               //                   ),
//               //                 ],
//               //               ),
//               //               Column(
//               //                 children: [
//               //                   Text(
//               //                     "show more",
//               //                     style: TextStyle(
//               //                       fontSize: 14,
//               //                       fontWeight: FontWeight.bold,
//               //                     ),
//               //                   ),
//               //                 ],
//               //               ),
//               //               Icon(
//               //                 Icons.arrow_forward,
//               //                 size: 18,
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         SizedBox(
//               //           height: 180,
//               //           child: ListView.builder(
//               //             scrollDirection: Axis.horizontal,
//               //             itemCount: 3,
//               //             itemBuilder: (context, index) {
//               //               return Padding(
//               //                 padding: const EdgeInsets.symmetric(),
//               //                 child: Card(
//               //                   elevation: 10,
//               //                   child: Column(
//               //                     crossAxisAlignment: CrossAxisAlignment.start,
//               //                     children: [
//               //                       Container(
//               //                         width: 140,
//               //
//               //                         color: Colors.yellow[200],
//               //                         padding: const EdgeInsets.all(10.0),
//               //                         child: const Row(
//               //                           children: [
//               //                             Column(
//               //                               crossAxisAlignment: CrossAxisAlignment.start,
//               //                               children: [
//               //                                 Text("CAR ONE"),
//               //                                 SizedBox(height: 3),
//               //                                 Text("Detail 1"),
//               //                                 SizedBox(height: 3),
//               //                                 Text("Detail 2"),
//               //                               ],
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                       SizedBox(width: 5),
//               //                       Container(
//               //                         height: 89,
//               //                         width: 140,
//               //                         decoration: const BoxDecoration(
//               //                           image: DecorationImage(
//               //                             image: AssetImage("images/img2.png"),
//               //                             fit: BoxFit.fill,
//               //                           ),
//               //                         ),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ),
//               //               );
//               //             },
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//
//               SizedBox(height: 15),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
//                 child: Card(
//                   // color: Colors.cyan,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               "Feedback",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             // Icon(
//                             //   Icons.arrow_forward,
//                             //   size: 20,
//                             //   weight:20,
//                             // ),
//                           ],
//
//
//                         ),
//
//
//                       ),
//                       SizedBox(
//                         height: 180,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(left: 5.0),
//                               child: Card(
//                                 elevation: 10,
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       height: 160,
//                                       width: 300,
//                                       decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                           image: AssetImage("images/img2.png"),
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 12),
//
//     Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Column(
//     children: [
//     const Text(
//     'Rating',
//     ),
//     Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//     IconButton(
//     icon: Icon(Icons.star, color: _rating >= 1 ? Colors.orange : Colors.grey),
//     onPressed: () {
//     setState(() {
//     _rating = 1;
//     });
//     },
//     ),
//     IconButton(
//     icon: Icon(Icons.star, color: _rating >= 2 ? Colors.orange : Colors.grey),
//     onPressed: () {
//     setState(() {
//     _rating = 2;
//     });
//     },
//     ),
//     IconButton(
//     icon: Icon(Icons.star, color: _rating >= 3 ? Colors.orange : Colors.grey),
//     onPressed: () {
//     setState(() {
//     _rating = 3;
//     });
//     },
//     ),
//     IconButton(
//     icon: Icon(Icons.star, color: _rating >= 4 ? Colors.orange : Colors.grey),
//     onPressed: () {
//     setState(() {
//     _rating = 4;
//     });
//     },
//     ),
//     IconButton(
//     icon: Icon(Icons.star, color: _rating >= 5 ? Colors.orange : Colors.grey),
//     onPressed: () {
//     setState(() {
//     _rating = 5;
//     });
//     },
//     ),
//     ],
//     ),
//
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const TextField(
//                       decoration: InputDecoration(
//                         labelText: "Enter your Feedback here ...........",
//                         border: OutlineInputBorder(),
//                         contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
//                       ),
//                     ),
//                     const SizedBox(height: 9.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Review()));
//
//                       },
//                       child: const Text("   Add Your Feedback   "),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 15),
//
//
//             ],
//           ),
//     ),
//     ],
//     ),
//         ),
//       ),
//
//     );
//   }
// }
