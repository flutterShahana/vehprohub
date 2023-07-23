// import 'package:flutter/material.dart';
//
// class CabShowmore extends StatefulWidget {
//   const CabShowmore({Key? key}) : super(key: key);
//
//   @override
//   State<CabShowmore> createState() => _CabShowmoreState();
// }
//
// class _CabShowmoreState extends State<CabShowmore> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Cabservices",
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 4 : 2,
//               childAspectRatio: 2 / 3, // Adjust this ratio as needed
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Card(
//                       elevation: 10,
//                       child: Column(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "CAR",
//                                 style: TextStyle(
//                                   backgroundColor: Colors.yellow,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             child: SizedBox(
//                               height: 120,
//                               width: double.infinity,
//                               child: Image.asset(
//                                 "images/img2.png",
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Add button action here
//                               },
//                               child: const Text('Click to book'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 10,
//                       child: Column(
//                         children: [
//                           const Text(
//                             "AUTORIKSHA",
//                             style: TextStyle(
//                               backgroundColor: Colors.yellow,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Container(
//                             height: 120,
//                             width: double.infinity,
//                             child: Image.asset(
//                               "images/img2.png",
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Container(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Add button action here
//                               },
//                               child: const Text('Click to book'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 10,
//                     child: Container(
//                       child: Column(
//                         children: [
//                           const Text(
//                             "GOODS CARRIER",
//                             style: TextStyle(
//                               backgroundColor: Colors.yellow,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Container(
//                             height: 120,
//                             width: double.infinity,
//                             child: Image.asset(
//                               "images/img2.png",
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Container(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Add button action here
//                               },
//                               child: const Text('Click to book'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 10,
//                     child: Container(
//                       child: Column(
//                         children: [
//                           const Text(
//                             "TRAVELLER ",
//                             style: TextStyle(
//                               backgroundColor: Colors.yellow,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Container(
//                             height: 120,
//                             width: double.infinity,
//                             child: Image.asset(
//                               "images/img2.png",
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           Container(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Add button action here
//                               },
//                               child: const Text('Click to book'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
