// import 'package:autoprohub/PROVIDER/Services/Accessories/accesories.dart';
// import 'package:autoprohub/PROVIDER/Services/Rent/rentals.dart';
// import 'package:autoprohub/PROVIDER/Services/Workshop/workshops.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../Location/location_controller.dart';
// import '../Services/Cab/cabs.dart';
//
//
// class HomeProvider extends StatefulWidget {
//   const HomeProvider({Key? key}) : super(key: key);
//
//   @override
//   State<HomeProvider> createState() => _HomeProviderState();
// }
//
// class _HomeProviderState extends State<HomeProvider> {
//   var index;
//   var myLatitude;
//   var myLongitude;
//   var locationContent;
//   Future<Map<String?, String?>> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? lati = prefs.getString('lati');
//     String? longi = prefs.getString('longi');
//     return {'lati': lati, 'longi': longi};
//   }
//
//   Future<void> checkingLocation(context, LocationController controller) async {
//     Map<String?, String?> locationData = await getData();
//     String? lati = locationData['lati'];
//     String? longi = locationData['longi'];
//     print('lati inside checking location: $lati');
//     print('longi inside checking location: $longi');
//     if (lati == '0' && longi == '0') {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Container(
//                 height: 150,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Visibility(
//                         visible: (lati != '0' && longi != '0') ? true : false,
//                         child: Text(locationContent)),
//                     Visibility(
//                         visible: (lati != '0' && longi != '0') ? true : false,
//                         child: ElevatedButton(
//                             onPressed: () {}, child: const Text('Update'))),
//                     Visibility(
//                         visible: (lati != '0' && longi != '0') ? false : true,
//                         child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 controller.getCurrentLocation();
//                                 // mapLocation.text= controller.currentLocation == null ? '--No Location Selected--' :
//                                 // controller.currentLocation!;
//                                 locationContent = controller.currentLocation ==
//                                     null
//                                     ? '--Wait for a while to get Location or tap again below after a few seconds--'
//                                     : controller.currentLocation!;
//                                 myLatitude = controller.myLat;
//                                 myLongitude = controller.myLong;
//                                 print(myLatitude);
//                                 print(myLongitude);
//                               });
//                             },
//                             child: const Text('Get Location'))),
//                   ],
//                 ),
//               ),
//             );
//           });
//     }
//   }
//
//   void nav(int index, LocationController controller) {
//     switch (index) {
//       case 1:
//         checkingLocation(context, controller);
//         Navigator.push(context as BuildContext,
//             MaterialPageRoute(builder: (context) => const Cabs()));
//         break;
//       case 2:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const Rentals()));
//         break;
//       case 3:
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const Accessories()));
//
//         break;
//       case 4:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const Workshop()));
//
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LocationController>(
//         init: LocationController(),
//         builder: (controller) {
//           return SafeArea(
//             child: Scaffold(
//               body: Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("images/kamshotthat.jpg"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Center(
//                   child: IntrinsicWidth(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         SizedBox(
//                           height: 80.0,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               nav(1, controller);
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                               Colors.blue, // Change the button color here
//                             ),
//                             child: const Text(
//                               'Cab service provider',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 80.0,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               nav(2, controller);
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                             ),
//                             child: const Text(
//                               'Rental service provider',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 80.0,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               nav(3, controller);
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.orange,
//                             ),
//                             child: const Text(
//                               'Accessories service provider',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 80.0,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               nav(4, controller);
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                             ),
//                             child: const Text(
//                               'Workshop service provider',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
