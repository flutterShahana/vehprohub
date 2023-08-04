import 'dart:convert';

import 'package:autoprohub/SP/sp.dart';
import 'package:autoprohub/User/Home/offer_carousel.dart';
import 'package:autoprohub/User/Services/Accessory/accessoriesService.dart';
import 'package:autoprohub/User/Services/Workshop/workshopService.dart';
import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/Services/Cab/cabServices.dart';
import 'package:autoprohub/User/media.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:autoprohub/User/workshopservices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../Services/Rent/rentalService.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var aph_service, flag = 0, name, lid;
  List<dynamic> res = [];

  Future<dynamic> getData() async {
    print('------------inside getData fn of view offer by user----------');

    var response = await get(Uri.parse('${Con.url}USER/viewOffer_user.php'));
    print(response.body);
    print(response.statusCode);
    print('----------------------------------');

    jsonDecode(response.body)[0]['result'] == 'success'
        ? {
            flag = 1,
            res = jsonDecode(response.body),
            getUserData(),
            print('********************'),
            print(res),
            print('**************')
          }
        : flag = 0;

    return jsonDecode(response.body);
  }

  Future<dynamic> getUserData() async {
    print(
        '------Home------inside getUserData fn of view user data by user----------');
    var data = {
      'user_id': widget.lid,
    };
    print(data);
    var response = await post(
        Uri.parse(
          '${Con.url}USER/userProfile.php',
        ),
        body: data);
    print(response.body);
    print(response.statusCode);
    print('----------------------------------');

    jsonDecode(response.body)[0]['result'] == 'success'
        ? {
            flag = 1,
            name = jsonDecode(response.body)[0]['username'],
            print('********************'),
            print(name),
            print('**************')
          }
        : flag = 0;

    return jsonDecode(response.body);
  }

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getData();
    getUserData();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      //   backgroundColor: Colors.purpleAccent[200],
      // ),
      body: SingleChildScrollView(
        child: Container(
            // height: double.infinity ,
            // width: MediaQuery.of(context).size.width,

            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  // color: Colors.cyanAccent,
                  height: 35,
                  width: MediaQuery.of(context).size.width,

                  child: const Text(
                    "   All in ONE Service here...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  // color: Colors.cyanAccent,
                  height: 40,
                  width: MediaQuery.of(context).size.width,

                  child: RichText(
                    text: TextSpan(
                        text: '    Hi ',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '  $name',
                            //style: TextStyle(color: Colors.blue[100]),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          )
                        ]),
                  ),

                  // Text(
                  //   "   Hi $name...",
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontStyle: FontStyle.normal,
                  //     fontSize: 24,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ),
              ),
              ImageCarousel(
                offers: res,
              ),

              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
              //   child: Card(
              //     elevation: 10,
              //     child: Column(
              //       children: [
              //         Container(
              //           height: 150,
              //           // width: 100,
              //           decoration: const BoxDecoration(
              //               image: DecorationImage(
              //             image: AssetImage("images/yoshi.png"),
              //             fit: BoxFit.fill,
              //           )),
              //         ),
              //         Container(
              //           height: 30,
              //           width: 310,
              //           color: Colors.red.shade100,
              //           child: const Text(
              //             "Offer Close : 30/JUNE/2023",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               fontSize: 20,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                child: Card(
                  elevation: 10,
                  color: Colors.purple[50], // Light purple color
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      const Text(
                        "Services",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                aph_service = 'cab';
                                print(aph_service);
                                print(
                                    'aph_service inside button press :$aph_service');

                                // saveData(loginID);
                                SharedPreferencesHelper_service.saveData(
                                        aph_service)
                                    .then((_) {
                                  print('sp service saved...');
                                }).catchError((error) {
                                  print('sp service saving failed..');
                                  // Error occurred while saving the login ID
                                  // Handle the error as needed
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Cabservices()),
                                );
                              },
                              child: Container(
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.local_taxi_outlined,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("  Cab  "),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                aph_service = 'rental';
                                print(aph_service);
                                print(
                                    'aph_service inside button press :$aph_service');

                                // saveData(loginID);
                                SharedPreferencesHelper_service.saveData(
                                        aph_service)
                                    .then((_) {
                                  print('sp service saved...');
                                }).catchError((error) {
                                  print('sp service saving failed..');
                                  // Error occurred while saving the login ID
                                  // Handle the error as needed
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RentalServices()),
                                );
                              },
                              child: Container(
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.car_rental,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(" Rental "),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                aph_service = 'workshop';
                                print(aph_service);
                                print(
                                    'aph_service inside button press :$aph_service');

                                // saveData(loginID);
                                SharedPreferencesHelper_service.saveData(
                                        aph_service)
                                    .then((_) {
                                  print('sp service saved...');
                                }).catchError((error) {
                                  print('sp service saving failed..');
                                  // Error occurred while saving the login ID
                                  // Handle the error as needed
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WorkshopServices()),
                                );
                              },
                              child: Container(
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.miscellaneous_services_rounded,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("  workshop  "),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                aph_service = 'accessory';
                                print(aph_service);
                                print(
                                    'aph_service inside button press :$aph_service');

                                // saveData(loginID);
                                SharedPreferencesHelper_service.saveData(
                                        aph_service)
                                    .then((_) {
                                  print('sp service saved...');
                                }).catchError((error) {
                                  print('sp service saving failed..');
                                  // Error occurred while saving the login ID
                                  // Handle the error as needed
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccessoriesServices()),
                                );
                              },
                              child: Container(
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.shopping_bag,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("  Accessory  "),
                                  ],
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     // Add your onTap functionality here
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const Medias()),
                            //     );
                            //   },
                            //   child: const Column(
                            //     children: [
                            //       Icon(Icons.perm_media_outlined),
                            //       Text("Media"),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CarouselSlider(
                items: [
                  // Image.asset('assets/images/home/service2.jpg',fit: BoxFit.fill,),
                  // Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Image.network(
                  //         'https://www.shutterstock.com/image-photo/unrecognizable-client-receiving-keys-rent-vehicle-1898298019',
                  //         fit: BoxFit.fill)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1593465678160-f99a8371fcf6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                          fit: BoxFit.fill)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          'https://di-uploads-pod3.dealerinspire.com/toyotaofclermont/uploads/2019/04/auto-parts-1024x683.jpg',
                          fit: BoxFit.fill)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          'https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Cycling/Articles/Best+Online+Bike/bike+maintenance-carousel.jpg',
                          fit: BoxFit.fill)),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1490650404312-a2175773bbf5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGF4aXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                          fit: BoxFit.fill)),
                ],
                options: CarouselOptions(
                  height: 220.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 9.0,
              //     left: 5.0,
              //     right: 5.0,
              //     bottom: 9.0,
              //   ),
              //   child: Card(
              //     elevation: 5,
              //     child: Container(
              //       height: 200,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: const BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage("images/img1.png"),
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
