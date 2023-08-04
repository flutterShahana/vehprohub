// import 'dart:convert';
//
// import 'package:autoprohub/User/Services/Cab/cabservices.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../../../CONNECTION/connect.dart';
// import 'accessoriesService.dart';
//
// class AccBooking extends StatefulWidget {
//   AccBooking({super.key, required this.acc_id});
//   var acc_id;
//
//   @override
//   State<AccBooking> createState() => _AccBookingState();
// }
//
// class _AccBookingState extends State<AccBooking> {
//   final _formkey = GlobalKey<FormState>();
//   var qnty = TextEditingController();
//   var flag = 0;
//   var status;
//   var selected_payType;
//   var selectedIndex;
//   var _selectedPay;
//   var count, updated_qnty;
//
//   List<String> pay = [
//     'assets/images/Rectangle 83.png',
//     'assets/images/Rectangle 82.png',
//     'assets/images/Rectangle 81.png',
//     'assets/images/other2.png',
//   ];
//   Future<dynamic> sentData() async {
//     updated_qnty = int.parse(qnty.text) - count;
//     var data = {
//       'acc_id': widget.acc_id,
//       'user_id': '1',
//       'qnty': count.toString(),
//       'updated_qnty': updated_qnty.toString(),
//       'date': DateTime.now().toString(),
//     };
//     print(data);
//     var response =
//         await post(Uri.parse('${Con.url}USER/accBooking.php'), body: data);
//     print(response.body);
//     print(response.statusCode);
//     status = response.statusCode;
//     jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
//     if (flag == 1) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => AccessoriesServices()));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => AccessoriesServices()));
//     }
//     //return jsonDecode(response.body);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(50.0),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.98,
//             child: Form(
//               key: _formkey,
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Fill the details to book your Accessory',
//                     style: TextStyle(
//                         //  backgroundColor: Colors.yellow,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.amber),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextFormField(
//                     controller: qnty,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         hintText: '--Enter quantity required--'),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     'Payment Type',
//                     style: TextStyle(
//                         //  backgroundColor: Colors.yellow,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.amber),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   RadioListTile(
//                       title: Text('Pay Now'),
//                       value: 'paynow',
//                       groupValue: selected_payType,
//                       onChanged: (val) {
//                         setState(() {
//                           selected_payType = val;
//                         });
//                       }),
//                   RadioListTile(
//                       title: Text('COD'),
//                       value: 'cod',
//                       groupValue: selected_payType,
//                       onChanged: (val) {
//                         setState(() {
//                           selected_payType = val;
//                         });
//                       }),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Visibility(
//                     visible: (selected_payType == 'paynow') ? true : false,
//                     child: Container(
//                       height: 200,
//                       width: 350,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           //  top: 10.0,
//                           // bottom: 10.0,
//                           left: 50.0,
//                           right: 50.0,
//                         ),
//                         child: GridView.builder(
//                           itemCount: pay.length,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   childAspectRatio: 1.5,
//                                   mainAxisSpacing: 50,
//                                   crossAxisSpacing: 50),
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: selectedIndex == index
//                                         ? Colors.blue
//                                         : Colors.transparent,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                                 child: Image.asset(
//                                   pay[index],
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: SizedBox(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width * 0.75,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20))),
//                           onPressed: () {
//                             switch (selectedIndex) {
//                               case 0:
//                                 _selectedPay = 'PhonePe';
//                                 break;
//                               case 1:
//                                 _selectedPay = 'Google Pay';
//                                 break;
//                               case 2:
//                                 _selectedPay = 'Paytm';
//                                 break;
//                               case 3:
//                                 _selectedPay = 'Other';
//                                 break;
//                             }
//
//                             if (selectedIndex == -1) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                 content: Text(
//                                   'select payment method',
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.white),
//                                 ),
//                                 backgroundColor: Color(0xfa8f7805),
//                               ));
//                             }
//
//                             sentData();
//                           },
//                           child: Text('Book Now')),
//                     ),
//                   ),
//                   Center(
//                     child: SizedBox(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width * 0.75,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20))),
//                           onPressed: () {
//                             if (selected_payType == '' ||
//                                 selected_payType == null) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                 content: Text(
//                                   'select payment method',
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.white),
//                                 ),
//                                 backgroundColor: Color(0xfa8f7805),
//                               ));
//                             } else
//                               sentData();
//                           },
//                           child: Text('Book Now')),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
