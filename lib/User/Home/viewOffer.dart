// import 'dart:convert';
// import 'dart:math' as math;
//
// import 'package:autoprohub/PROVIDER/Services/Cab/addCabDetails.dart';
// import 'package:autoprohub/SP/sp.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../../../connection/connect.dart';
// import '../../PROVIDER/Home_Pro/addOffer.dart';
//
// class ViewOffer extends StatefulWidget {
//   ViewOffer({Key? key, }) : super(key: key);
//
//
//   @override
//   State<ViewOffer> createState() => _ViewOfferState();
// }
//
// class _ViewOfferState extends State<ViewOffer> {
//   // var pro_id;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   myLogin();
//   // }
//   //
//   // Future<void> myLogin() async {
//   //   pro_id = await getLogin();
//   // }
//
//   var lid;
//   @override
//   void initState() {
//     SharedPreferencesHelper.getSavedData().then((value) {
//       setState(() {
//         lid = value;
//
//         print(lid);
//       });
//     });
//     getData();
//   }
//
//   var flag;
//   var offer_id;
//   Future<dynamic> getData() async {
//     var data = {
//       'pro_id': lid.toString(),
//     };
//
//     var response = await post(Uri.parse('${Con.url}viewOffer.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
//       print(flag);
//       return json.decode(response.body);
//     } else
//       throw Exception('Error returned');
//   }
//
//   Future<dynamic> deleteData() async {
//     var data = {
//       'offer_id': offer_id,
//     };
//
//     var response = await post(Uri.parse('${Con.url}deleteOffer.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       if (jsonDecode(response.body)['result'] == 'success') {
//         setState(() {});
//         Navigator.pop(context);
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//             'Deleted Successfully...',
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           backgroundColor: Color(0xfa8f7805),
//         ));
//
//         print(flag);
//         // return json.decode(response.body);
//       } else {
//         Navigator.pop(context);
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//             'Failed to delete...',
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           ),
//           backgroundColor: Color(0xfa8f7805),
//         ));
//
//         print(flag);
//       }
//     } else
//       throw Exception('Error returned');
//   }
//
//
//   void nav() {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => AddOffer(
//
//             )));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         isExtended: true,
//         onPressed: () {
//           nav();
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Text(
//           'Offers',
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.home),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: FutureBuilder(
//             future: getData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) print('Error ::${snapshot.error}');
//               print('Inside builder ::${snapshot.hasData}');
//               if (!snapshot.hasData) {
//                 return const Center(
//                   child: Center(child: Text('No Data')),
//                 );
//               }
//               //  return flag==0?lottieNothing():
//               return flag == 0
//                   ? const Center(
//                 child: Text("No Data to show.."),
//               )
//                   : ListView.separated(
//                 separatorBuilder: (context, index) {
//                   return const Divider();
//                 },
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Card(
//                       elevation: 20,
//                       child: Container(
//                         height: 640,
//                         width: MediaQuery.of(context).size.width,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                     height: 350,
//                                     width:
//                                     MediaQuery.of(context).size.width,
//                                     color: const Color(0xffa2e7ef),
//                                     child: Image.network(
//                                       '${Con.url}offer/${snapshot.data[index]['image']}',
//                                       fit: BoxFit.fill,
//                                     )),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'Start Date: ${snapshot.data[index]['start_date']}',
//                                   // style: heading1,
//                                 ),
//                               ), Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'End Date: ${snapshot.data[index]['end_date']}',
//                                   // style: heading1,
//                                 ),
//                               ),
//
//                               //  Spacer(),
//                               ButtonBar(
//                                 children: [
//                                   // ElevatedButton(
//                                   //     onPressed: () {
//                                   //       print(widget.type);
//                                   //       setState(() {
//                                   //     //    addToCart();
//                                   //       });
//                                   //     },
//                                   //     child: Text('Add to Cart')),
//                                   ButtonBar(
//                                     children: [
//
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return AlertDialog(
//                                                     title: const Text(
//                                                         'Delete Product'),
//                                                     content: const Text(
//                                                         'Are you sure?'),
//                                                     actions: [
//                                                       TextButton(
//                                                           onPressed: () {offer_id = snapshot
//                                                                 .data[
//                                                             index]
//                                                             [
//                                                             'offer_id'];
//                                                             deleteData();
//                                                           },
//                                                           child:
//                                                           const Text(
//                                                               'Yes')),
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             Navigator.pop(
//                                                                 context);
//                                                           },
//                                                           child:
//                                                           const Text(
//                                                               'No')),
//                                                     ],
//                                                   );
//                                                 });
//                                           },
//                                           child: const Text('Delete')),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }
