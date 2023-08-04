import 'dart:convert';
import 'dart:math' show asin, cos, pi, pow, sin, sqrt;
import 'package:autoprohub/User/Services/Workshop/workshopBooking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';
import '../Cab/currentLocation.dart';

class NearByWorkshop extends StatefulWidget {
  NearByWorkshop({
    super.key,
    required this.veh_type,
    required this.service_type,
    required this.currentLat,
    required this.currentLong,
    required this.wsname,
  });
  var veh_type, service_type, currentLat, currentLong;
  var wsname;
  @override
  State<NearByWorkshop> createState() => _NearByWorkshopState();
}

class _NearByWorkshopState extends State<NearByWorkshop> {
  var flag = 0;
  var status;
  var lat, long;
  var res;
  int? count;

  double? distance;
  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    print('-----------------------------');
    print('vehicle type:${widget.veh_type}');
    print('vehicle type:${widget.service_type}');
    print('wsname :${widget.wsname}');
    print('-----------------------------------------');

    lat = widget.currentLat;
    long = widget.currentLong;

    print('inside init fn');
    print('-----------------------------');
    print('My Latitude :$lat');
    print('My Longitude :$long');
    print('-----------------------------------------');
    getData();
    _refresh();
    setState(() {});
  }

  Future<dynamic> getData() async {
    print('---------inside getData fn of nearby workshop--------');
    var data = {
      'vehType': widget.veh_type,
      'service': widget.wsname,
    };
    print(data);
    var response = await post(
        Uri.parse('${Con.url}USER/userViewWorkshopService.php'),
        body: data);
    print(
        '--------------all nearby workshop response.body ---------------------------');
    print(response.body);
    print(response.statusCode);
    print('-----------------------------------------');
    jsonDecode(response.body)[0]['result'] == 'success'
        ? {
            flag = 1,
            res = jsonDecode(response.body),
            print('********************'),
            print(res),
            print('**************')
          }
        : flag = 0;
    return jsonDecode(response.body);
  }

  final double maxDistance = 100.0;
  List<Map<String, dynamic>> getNearbyStations() {
    List<Map<String, dynamic>> nearbyStations = [];
    if (res != null) {
      for (var station in res) {
        double stationLatitude = double.parse(station["lati"]);
        double stationLongitude = double.parse(station["longi"]);
        double distance =
            calculateDistance(lat, long, stationLatitude, stationLongitude);

        if (distance <= maxDistance) {
          nearbyStations.add(station);
        }
      }
    }
    count = nearbyStations.length;
    print(count);
    print(nearbyStations);
    return nearbyStations;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const radius = 6371.0; // Radius of the Earth in kilometers

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);
    double a = pow(sin(dLat / 2), 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);
    double c = 2 * asin(sqrt(a));
    double distance = radius * c;

    return distance;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180.0);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> nearbyStations = getNearbyStations();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Nearby ${widget.veh_type} ${widget.service_type}')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: nearbyStations.length > 0
              ? ListView.builder(
                  itemCount: nearbyStations.length,
                  itemBuilder: (context, index) {
                    print('count=$count');
                    print(lat);
                    print(long);
                    print(nearbyStations[index]['lati']);
                    print(nearbyStations[index]['longi']);
                    if (nearbyStations.length > 0) {
                      distance = calculateDistance(
                          lat,
                          long,
                          double.parse(nearbyStations[index]["lati"]),
                          double.parse(nearbyStations[index]["longi"]));
                      print('distance:$distance km');
                    } else {
                      print('no data');
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        child: Container(
                          height: 220,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.miscellaneous_services),
                                title: Text(
                                  'By: ${nearbyStations[index]['username']} ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount: ₹ ${nearbyStations[index]['amount']}',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      'Average Time: ${nearbyStations[index]['avgTime']}',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text('Distance:${distance?.round()} km'
                                        // "Distance: ${calculateDistance(double.parse(lat), double.parse(long), double.parse(snapshot.data[index]["lati"]), double.parse(snapshot.data[index]["longi"])).toString()} km",
                                        ),
                                    Text(
                                        'Location:${nearbyStations[index]['location']} '
                                        // "Distance: ${calculateDistance(double.parse(lat), double.parse(long), double.parse(snapshot.data[index]["lati"]), double.parse(snapshot.data[index]["longi"])).toString()} km",
                                        ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WorkshopBooking(
                                                  work_id: nearbyStations[index]
                                                      ['work_id'],
                                                  service: nearbyStations[index]
                                                      ['serviceName'],
                                                  amt: nearbyStations[index]
                                                      ['amount'],
                                                  avgTime: nearbyStations[index]
                                                      ['avgTime'],
                                                )));
                                  },
                                  child: Text('Book Now'))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text('Nothing to show'),
                ),
        ),
      ),
    );
  }
}
