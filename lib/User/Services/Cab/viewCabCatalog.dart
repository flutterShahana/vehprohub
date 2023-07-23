// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../../../CONNECTION/connect.dart';
// import '../../../PROVIDER/Widgets/customLottie.dart';
//
// class ViewCabCatalog extends StatefulWidget {
//   ViewCabCatalog({Key? key, required this.vehType}) : super(key: key);
//   var vehType;
//   @override
//   State<ViewCabCatalog> createState() => _ViewCabCatalogState();
// }
//
// class _ViewCabCatalogState extends State<ViewCabCatalog> {
//   var flag = 0;
//   Future<dynamic> getData(String vehType) async {
//     var data = {'vehType': widget.vehType};
//     var response =
//         await post(Uri.parse('${Con.url}USER/userViewCabs.php'), body: data);
//     print(response.body);
//     jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
//
//     return jsonDecode(response.body);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xffBE70CB),
//           leading: const Icon(Icons.arrow_back),
//           title: widget.vehType != null
//               ? Text('${widget.vehType}.toUpperCase()')
//               : Text('CAB'),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Icon(Icons.ac_unit_rounded),
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: SizedBox(
//                   height: 200,
//                   child: FutureBuilder(
//                       future: getData('car'),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.hasError)
//                           print('Error ::${snapshot.error}');
//                         print('Inside builder ::${snapshot.hasData}');
//                         if (!snapshot.hasData) {
//                           return const Center(
//                             child: Center(child: Text('No Data')),
//                           );
//                         }
//                         return flag == 0
//                             ? lottieNothing()
//                             : GridView.builder(
//                                 gridDelegate:
//                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 4,
//                                   crossAxisSpacing: 4,
//                                   childAspectRatio: 0.6,
//                                 ),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   List list = snapshot.data;
//                                   return InkWell(
//                                     onTap: () {
//                                       print(widget.vehType);
//                                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtDetailPage(
//                                       // rate: list[index]['rate'],
//                                       // description: list[index]['des'],
//                                       // stock:list[index]['stock'],
//                                       // image:list[index]['image'],
//                                       // itemID:list[index]['pid'],
//                                       // type:widget.type,
//                                       // name:list[index]['name'],
//                                       // index:index,
//                                       // logID: widget.logID,
//                                       // pid: list[index]['pid'],
//                                       // vid: list[index]['vendor_id'],
//                                       //
//                                       //
//                                       // )));
//                                     },
//                                     child: Hero(
//                                       tag: index,
//                                       child: Card(
//                                           // generate blues with random shades
//                                           color: Colors
//                                               .amber[Random().nextInt(4) * 100],
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(12),
//                                             child: Container(
//                                               height: 250,
//                                               child: Column(
//                                                 children: [
//                                                   Container(
//                                                     height: 240,
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     child: Image.network(
//                                                       "${Con.url}cabs/${list[index]['image']}",
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                     // child:
//                                                     // Center(
//                                                     //   child: Text(
//                                                     //     artCatelog[index]['name'],
//                                                     //     style: TextStyle(color:Colors.white,
//                                                     //         fontWeight: FontWeight.bold,fontSize: 30),),),
//                                                   ),
//                                                   Container(
//                                                     height: 50,
//                                                     color: Colors.white,
//                                                     child: Center(
//                                                       child: Text(
//                                                         'Rs ${list[index]['rate']} /km',
//                                                         style: TextStyle(
//                                                             color: Color(
//                                                                 0xff458F9D),
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize: 18),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           )),
//                                     ),
//                                   );
//                                 },
//                                 itemCount: snapshot.data.length,
//                               );
//                       }
//                       // FutureBuilder(
//                       //     future: getData('car'),
//                       //     builder: (context, snapshot) {
//                       //       if (snapshot.hasError) print('Error:${snapshot.error}');
//                       //       print(
//                       //           'Inside cab view(checking hasData): ${snapshot.hasData}');
//                       //       if (!snapshot.hasData) {
//                       //         return const Center(
//                       //           child: Text('No Data..'),
//                       //         );
//                       //       }
//                       //
//                       //       return flag == 0
//                       //           ? const Center(child: Text('Nothing to show'))
//                       //           : GridView.builder(
//                       //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       //           crossAxisCount: 2,
//                       //         ),
//                       //           itemCount: snapshot.data.length,
//                       //           itemBuilder: (context, index) =>
//                       //
//                       //               // GestureDetector(
//                       //               //   onTap: () {
//                       //               //     // Navigator.push(context, MaterialPageRoute(builder: (
//                       //               //     //     context)=>servc(
//                       //               //     //   // img:sevgridnew[index]['image'] ,
//                       //               //     //   // name: sevgridnew[index]['head'],
//                       //               //     // )));
//                       //               //   },
//                       //               //   child: Container(
//                       //               //     height: 100,
//                       //               //     width: 150,
//                       //               //     margin: const EdgeInsets.all(10),
//                       //               //     child: Card(
//                       //               //       color: const Color(0xffFBE838),
//                       //               //       margin: const EdgeInsets.all(10),
//                       //               //       shadowColor: Colors.blueGrey,
//                       //               //       elevation: 40,
//                       //               //       child: Container(
//                       //               //         // height: 500,
//                       //               //         child: Column(
//                       //               //           children: [
//                       //               //             Container(
//                       //               //               height: 120,
//                       //               //               width: double.infinity,
//                       //               //               decoration: BoxDecoration(
//                       //               //                 color: Colors.grey,
//                       //               //                 image: DecorationImage(
//                       //               //                   image: NetworkImage(
//                       //               //                       '${Con.url}/cabs/${snapshot.data[index]['image']}'),
//                       //               //                   fit: BoxFit.fill,
//                       //               //                 ),
//                       //               //                 borderRadius:
//                       //               //                 const BorderRadius.all(
//                       //               //                   Radius.circular(10.0),
//                       //               //                 ),
//                       //               //               ),
//                       //               //             ),
//                       //               //             Column(
//                       //               //               children: [
//                       //               //                 Text(
//                       //               //                     '${snapshot.data[index]['name']}'),
//                       //               //                 (snapshot.data[index]
//                       //               //                 ['person'] ==
//                       //               //                     1)
//                       //               //                     ? Text(
//                       //               //                     'Ideal for ${snapshot.data[index]['person']}person')
//                       //               //                     : Text(
//                       //               //                     'Ideal for ${snapshot.data[index]['person']}persons'),
//                       //               //               ],
//                       //               //             ),
//                       //               //           ],
//                       //               //         ),
//                       //               //       ),
//                       //               //     ),
//                       //               //   ),
//                       //               // ));
//                       //     }),
//                       ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
