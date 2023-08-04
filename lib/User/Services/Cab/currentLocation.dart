import 'package:autoprohub/SP/sp.dart';
import 'package:autoprohub/User/Services/Accessory/nearbyAccessories.dart';
import 'package:autoprohub/User/Services/Cab/nearbyCabs.dart';
import 'package:autoprohub/User/Services/Rent/nearbyRentals.dart';
import 'package:autoprohub/User/Services/Workshop/nearbyWorkshop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Location/location_controller.dart';

class CurrentLocation extends StatefulWidget {
  CurrentLocation({
    super.key,
    required this.vehType,
  });
  var vehType;
  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  var myLatitude;
  var myLongitude;

  String? mapLocation;
  String myLoc = '-- Tap the button below to get your location --';
  var aph_service, wsname;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper_service.getSavedData().then((value) {
      setState(() {
        aph_service = value;

        print('aph_service: $aph_service');
      });
    });
    SharedPreferencesHelper_WSname.getSavedData().then((value) {
      setState(() {
        wsname = value;

        print('WSname: $wsname');
      });
    });
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
                                    });
                                    print(myLatitude);
                                    print(myLongitude);

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
                                    '----------------aph service-inside search button: $aph_service----------------------');
                                print(
                                    '----------------wsname-inside search button: $wsname----------------------');
                                switch (aph_service) {
                                  case 'cab':
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NearByCabs(
                                                vehType: widget.vehType,
                                                currentLat: myLatitude,
                                                currentLong: myLongitude)));
                                    break;
                                  case 'rental':
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NearByRentals(
                                                vehType: widget.vehType,
                                                currentLat: myLatitude,
                                                currentLong: myLongitude)));
                                    break;
                                  case 'accessory':
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NearByAccessories(
                                                    vehType: widget.vehType,
                                                    currentLat: myLatitude,
                                                    currentLong: myLongitude)));
                                    break;
                                  case 'workshop':
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NearByWorkshop(
                                                    service_type: aph_service,
                                                    wsname: wsname,
                                                    veh_type: widget.vehType,
                                                    currentLat: myLatitude,
                                                    currentLong: myLongitude)));
                                    break;
                                }
                              },
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    'Search nearby ',
                                    // style: normalTextPlay,
                                  ),
                                  leading: Icon(Icons.search_sharp),
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
