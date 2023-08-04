import 'package:autoprohub/PROVIDER/Services/Accessories/accesories.dart';
import 'package:autoprohub/PROVIDER/Services/Rent/rentals.dart';
import 'package:autoprohub/PROVIDER/Services/Workshop/workshops.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Location/location_controller.dart';
import '../Services/Cab/cabs.dart';

class HomeProvider extends StatefulWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  State<HomeProvider> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  var index;
  var myLatitude;
  var myLongitude;
  var locationContent;

  void nav(int index) {
    switch (index) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Cabs()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Rentals()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Accessories()));

        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Workshop()));

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/kamshotthat.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 80.0,
                          child: ElevatedButton(
                            onPressed: () {
                              nav(1);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(
                                  0.3), // Change the button color here
                            ),
                            child: const Text(
                              'Cab service provider',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                          child: ElevatedButton(
                            onPressed: () {
                              nav(2);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.withOpacity(0.3),
                            ),
                            child: const Text(
                              'Rental service provider',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                          child: ElevatedButton(
                            onPressed: () {
                              nav(3);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.withOpacity(0.3),
                            ),
                            child: const Text(
                              'Accessories service provider',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                          child: ElevatedButton(
                            onPressed: () {
                              nav(
                                4,
                              );
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withOpacity(0.3),
                            ),
                            child: const Text(
                              'Workshop service provider',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
