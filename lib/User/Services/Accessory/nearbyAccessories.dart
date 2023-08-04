import 'dart:convert';
import 'dart:math' show asin, cos, pi, pow, sin, sqrt;

import 'package:autoprohub/User/Services/Cab/cabDetailPage.dart';
import 'package:autoprohub/User/Services/Rent/rentalDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import 'accessoriesDetailPage.dart';

class NearByAccessories extends StatefulWidget {
  NearByAccessories({
    super.key,
    required this.vehType,
    required this.currentLat,
    required this.currentLong,
  });
  var vehType, currentLat, currentLong;
  @override
  State<NearByAccessories> createState() => _NearByAccessoriesState();
}

class _NearByAccessoriesState extends State<NearByAccessories> {
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

  Future<dynamic> getData() async {
    var data = {'vehType': widget.vehType};
    var response = await post(
        Uri.parse('${Con.url}USER/userViewAccessories.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
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

  final double maxDistance = 50.0;
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
  void initState() {
    lat = widget.currentLat;
    long = widget.currentLong;

    getData();
    _refresh();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> nearbyStations = getNearbyStations();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: widget.vehType != null
            ? Text('${widget.vehType.toUpperCase()} ACCESSORIES')
            : Text('ACCESSORIES BOOKING'),
      ),
      // body: Card(
      //     child: Container(
      //   child: Center(child: Text('${widget.vehType}--->$status')),
      // ))),
      body: nearbyStations.length > 0
          ? ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount:
              //       MediaQuery.of(context).size.width >= 600 ? 4 : 2,
              //   childAspectRatio: 2 / 3,
              // ),
              shrinkWrap: true,
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
                  print(distance);
                } else {
                  print('no data');
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      // color: Colors.teal,
                      height: 180,
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 150,
                            child: Image.network(
                              "${Con.url}accessories/${nearbyStations[index]['image']}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${nearbyStations[index]['name']}',
                                          style: TextStyle(
                                            //  backgroundColor: Colors.yellow,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${nearbyStations[index]['brand']}',
                                          style: TextStyle(
                                            //  backgroundColor: Colors.yellow,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  ' ₹ ${nearbyStations[index]['rate']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                              children: [
                                                TextSpan(
                                                  text: '/unit',
                                                  style: TextStyle(
                                                      color: Colors.blue[100]),
                                                )
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 10,
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
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccessoriesDetailPage(
                                                      image:
                                                          nearbyStations[index]
                                                              ['image'],
                                                      description:
                                                          nearbyStations[index]
                                                              ['description'],
                                                      name: nearbyStations[index]
                                                          ['name'],
                                                      rate:
                                                          nearbyStations[index]
                                                              ['rate'],
                                                      brand:
                                                          nearbyStations[index]
                                                              ['brand'],
                                                      acc_id:
                                                          nearbyStations[index]
                                                              ['acc_id'],
                                                      quantity:
                                                          nearbyStations[index]
                                                              ['quantity'],
                                                      type: nearbyStations[index]
                                                          ['type'])));
                                    },
                                    child: const Text('See Details'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: Text('Nothing to show'),
            ),
    ));
  }
}
