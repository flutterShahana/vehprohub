import 'dart:convert';

import 'package:autoprohub/Location/location_controller.dart';
import 'package:autoprohub/User/Services/Cab/cabDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import 'currentLocation.dart';
import 'nearbyCabs.dart';

class ShowAllCabs extends StatefulWidget {
  ShowAllCabs({super.key, required this.vehType});
  var vehType;
  @override
  State<ShowAllCabs> createState() => _ShowAllCabsState();
}

class _ShowAllCabsState extends State<ShowAllCabs> {
  var flag = 0;
  var status;

  Future<dynamic> getData() async {
    var data = {'vehType': widget.vehType};
    var response =
        await post(Uri.parse('${Con.url}USER/userViewCabs.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        isExtended: true,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CurrentLocation(
                        vehType: widget.vehType,
                      )));
        },
        label: const Text(' Show nearby '),
        // icon: Icon(Icons.add)
      ),

      appBar: AppBar(
        title: widget.vehType != null
            ? Text('${widget.vehType.toUpperCase()} BOOKING')
            : const Text('Nearby Cab'),
      ),
      // body: Card(
      //     child: Container(
      //   child: Center(child: Text('${widget.vehType}--->$status')),
      // ))),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return const Text('No data available');
              } else {
                return ListView.builder(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount:
                    //       MediaQuery.of(context).size.width >= 600 ? 4 : 2,
                    //   childAspectRatio: 2 / 3,
                    // ),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            // color: Colors.teal,
                            height: 150,
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 150,
                                  child: Image.network(
                                    "${Con.url}cabs/${snapshot.data[index]['image']}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 90,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${snapshot.data[index]['name']}',
                                                style: const TextStyle(
                                                  //  backgroundColor: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        ' ₹ ${snapshot.data[index]['rate']}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                                    children: [
                                                      TextSpan(
                                                        text: '/hour',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blue[100]),
                                                      )
                                                    ]),
                                              ),
                                              const SizedBox(
                                                height: 10,
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
                                                    builder: (context) => CabDetailPage(
                                                        image: snapshot.data[index]
                                                            ['image'],
                                                        description:
                                                            snapshot.data[index]
                                                                ['description'],
                                                        name: snapshot.data[index]
                                                            ['name'],
                                                        rate: snapshot.data[index]
                                                            ['rate'],
                                                        size: snapshot.data[index]
                                                            ['size'],
                                                        person:
                                                            snapshot.data[index]
                                                                ['person'],
                                                        cab_id:
                                                            snapshot.data[index]
                                                                ['cab_id'],
                                                        type: snapshot.data[index]
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
                    });
              }
            } else {
              return const Text('No data available');
            }
          }),
    ));
  }
}
