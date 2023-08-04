import 'dart:convert';

import 'package:autoprohub/SP/sp.dart';
import 'package:autoprohub/User/Services/Accessory/nearbyAccessories.dart';
import 'package:autoprohub/User/Services/Cab/nearbyCabs.dart';
import 'package:autoprohub/User/Services/Rent/nearbyRentals.dart';
import 'package:autoprohub/User/Services/Workshop/nearbyWorkshop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../Location/location_controller.dart';
import '../../CONNECTION/connect.dart';

class UpdateLocation extends StatefulWidget {
  UpdateLocation({
    super.key,
  });

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  var myLatitude;
  var myLongitude;
  var place;

  String? mapLocation;
  String myLoc = '-- Tap the button below to get your location --';
  var lid, flag;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print(lid);
      });
    });
  }

  Future<dynamic> sentData() async {
    var data = {
      'pro_id': lid.toString(),
      'lati': myLatitude.toString(),
      'longi': myLongitude.toString(),
      'location': myLoc,
      'place': place,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}updateLocation.php'), body: data);
    print(response.body);
    print(response.statusCode);
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location updated successfully..')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update...')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<LocationController>(
            init: LocationController(),
            builder: (controller) {
              return Scaffold(
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://100map.net/img/en/a2p_london.png'))),
                  child: Center(
                    child: Container(
                        child: Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          // child: textformfield(controller: mapLocation, hint:'',fcolor: Colors.black,fsize: 20.sp,bordercolor: Colors.black,hpad: 20.w,vpad: 30.h,radius: 0.0,fillcolor: Colors.transparent),
                          child: Text(
                            '$myLoc',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: myLoc ==
                                      '-- Tap the button below to get your location --'
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                  color: Color(0xFFFFCE56),
                                ))),
                            onPressed: myLoc ==
                                    '-- Tap the button below to get your location --'
                                ? () {
                                    controller.getCurrentLocation();
                                    // mapLocation.text= controller.currentLocation == null ? '--No Location Selected--' :
                                    // controller.currentLocation!;
                                    mapLocation =
                                        controller.currentLocation == null
                                            ? myLoc
                                            : controller.currentLocation!;
                                    setState(() {
                                      myLoc = mapLocation!;
                                      myLatitude = controller.myLat;
                                      myLongitude = controller.myLong;
                                      place = controller.locality;
                                    });
                                    print(myLatitude);
                                    print(myLongitude);
                                    print(myLoc);
                                    print(place);

                                    //style: blackTextPlay,
                                    // mapLocation=controller.currentLocation!;
                                    // print(controller.currentLocation!);
                                    // print(mapLocation);
                                  }
                                : null,
                            child: Center(
                              child: myLoc ==
                                      '-- Tap the button below to get your location --'
                                  ? ListTile(
                                      title: Text(
                                        'Click to get Your current Location',
                                        // style: normalTextPlay,
                                      ),
                                      leading: Icon(Icons.location_on_outlined),
                                    )
                                  : ListTile(
                                      title: Text(
                                        'Got current Location',
                                        // style: normalTextPlay,
                                      ),
                                      leading: Icon(Icons.location_on_outlined),
                                    ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: myLoc ==
                                  '-- Tap the button below to get your location --'
                              ? false
                              : true,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                    color: Color(0xFFFFCE56),
                                  ))),
                              onPressed: () {
                                print(
                                    '----------------lid-inside search button: $lid----------------------');
                                print(
                                    '----------------myLatitude-inside search button: $myLatitude----------------------');
                                print(
                                    '----------------myLongitude-inside search button: $myLongitude----------------------');
                              },
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    sentData();
                                  },
                                  title: Text(
                                    'Update',
                                    // style: normalTextPlay,
                                  ),
                                  leading: Icon(Icons.location_on),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              );
            }));
  }
}
