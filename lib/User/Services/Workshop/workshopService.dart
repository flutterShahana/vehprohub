import 'dart:convert';

import 'package:autoprohub/User/Services/Accessory/showAllAccessories.dart';
import 'package:autoprohub/User/Services/Cab/showAllCabs.dart';
import 'package:autoprohub/User/Services/Rent/showAllRentals.dart';
import 'package:autoprohub/User/Services/Workshop/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../../CONNECTION/connect.dart';
import '../../../PROVIDER/Services/Workshop/ServiceList/serviceList.dart';
import '../../../SP/sp.dart';
import '../../Ratings/viewRating.dart';

class WorkshopServices extends StatefulWidget {
  const WorkshopServices({Key? key}) : super(key: key);

  @override
  State<WorkshopServices> createState() => _WorkshopServicesState();
}

class _WorkshopServicesState extends State<WorkshopServices> {
  double _rating = 0;

  var car_flag = 0;
  var bike_flag = 0;
  var luxCar_flag = 0;
  var luxBike_flag = 0;
  var flag;
  var wsname;
  @override
  void initState() {
    super.initState();
    // Veh();
    _refresh();
  }

  // void Veh() {
  //   getData('car');
  //   getData('bike');
  //   setState(() {});
  // }

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  void navToDetailPage(String veh, String service) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WorkshopDetailPage(veh_type: veh, service_type: service)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          isExtended: true,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewRatings(service_type: 'Workshop')));
          },
          label: Text('Feedback'),
          // icon: Icon(Icons.add)
        ),
        backgroundColor: const Color(0xffece4e4),
        appBar: AppBar(
          title: const Text("Workshop Services"),
          backgroundColor: Colors.purple[200],
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabCarShowmore()));
                },
                icon: const Icon(Icons.filter_list_alt))
          ],
        ),
        body: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        SearchBarAnimation(
                          textEditingController: TextEditingController(),
                          isOriginalAnimation: false,
                          enableKeyboardFocus: true,
                          buttonBorderColour: Colors.black45,
                          buttonWidget: const Icon(Icons.search),
                          onFieldSubmitted: (String value) {
                            debugPrint('onFieldSubmitted value $value');
                          },
                          trailingWidget: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                          secondaryButtonWidget: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 150,
                          // width: 100,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            //image: AssetImage("images/cabtop.jpg"),
                            image: NetworkImage(
                              'https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Cycling/Articles/Best+Online+Bike/bike+maintenance-carousel.jpg',
                            ),
                            fit: BoxFit.fill,
                          )),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.red.shade100,
                          child: const Text(
                            "VEHICLE WORKSHOP SERVICES",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Vehicle Types",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text(
                          "Car",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // OutlinedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ShowAllAccessories(
                      //                   vehType: 'car',
                      //                 )));
                      //   },
                      //   child: const Text('Show more'),
                      // ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15.0),
                    children: [
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Basic Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Basic Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Car', 'Basic Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount: basic_services_car.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(basic_services_car[index]),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mid Range Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Mid Range Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Car', 'Mid Range Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount: midRange_services_car.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(
                                                  midRange_services_car[index]),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Major Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Major Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Car', 'Major Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount: major_services_car.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(major_services_car[index]),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text(
                          "Bike",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // OutlinedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ShowAllAccessories(
                      //                   vehType: 'car',
                      //                 )));
                      //   },
                      //   child: const Text('Show more'),
                      // ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15.0),
                    children: [
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Basic Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Basic Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Bike', 'Basic Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount: basic_services_bike.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(basic_services_bike[index]),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mid Range Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Mid Range Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Bike', 'Mid Range Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount:
                                            midRange_services_bike.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(
                                                  '${midRange_services_bike[index]}'),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 270,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Major Services',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          wsname = 'Major Services';
                                          print(wsname);
                                          print(
                                              'wsname inside button press :$wsname');

                                          // saveData(loginID);
                                          SharedPreferencesHelper_WSname
                                                  .saveData(wsname)
                                              .then((_) {
                                            print('sp wsname saved...');
                                          }).catchError((error) {
                                            print('sp wsname saving failed..');
                                            // Error occurred while saving the login ID
                                            // Handle the error as needed
                                          });
                                          navToDetailPage(
                                              'Bike', 'Major Services');
                                        },
                                        child: Text('More>>'))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 20,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(15.0),
                                        shrinkWrap: true,
                                        itemCount: major_services_bike.length,
                                        itemBuilder: (context, index) {
                                          return Wrap(
                                            children: [
                                              Icon(Icons
                                                  .miscellaneous_services_outlined),
                                              Text(
                                                  "${major_services_bike[index]}"),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
