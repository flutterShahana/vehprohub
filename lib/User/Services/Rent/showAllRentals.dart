import 'dart:convert';

import 'package:autoprohub/User/Services/Cab/cabDetailPage.dart';
import 'package:autoprohub/User/Services/Rent/rentalDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class ShowAllRentals extends StatefulWidget {
  ShowAllRentals({super.key, required this.vehType});
  var vehType;
  @override
  State<ShowAllRentals> createState() => _ShowAllRentalsState();
}

class _ShowAllRentalsState extends State<ShowAllRentals> {
  var flag = 0;
  var status;
  Future<dynamic> getData() async {
    var data = {'vehType': widget.vehType};
    var response =
        await post(Uri.parse('${Con.url}USER/userViewRentals.php'), body: data);
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
      appBar: AppBar(
        title: widget.vehType != null
            ? Text('${widget.vehType.toUpperCase()} BOOKING')
            : Text('CAB BOOKING'),
      ),
      // body: Card(
      //     child: Container(
      //   child: Center(child: Text('${widget.vehType}--->$status')),
      // ))),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Text('No data available');
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
                                    "${Con.url}rentals/${snapshot.data[index]['image']}",
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
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${snapshot.data[index]['name']}',
                                                style: TextStyle(
                                                  //  backgroundColor: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        ' ₹ ${snapshot.data[index]['rent']}',
                                                    style: TextStyle(
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
                                              SizedBox(
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
                                                    builder: (context) => RentalDetailPage(
                                                        image:
                                                            snapshot.data[index]
                                                                ['image'],
                                                        description:
                                                            snapshot.data[index]
                                                                ['description'],
                                                        name: snapshot.data[index]
                                                            ['name'],
                                                        rate: snapshot.data[index]
                                                            ['rent'],
                                                        fuel:
                                                            snapshot.data[index]
                                                                ['fuel'],
                                                        rent_id:
                                                            snapshot.data[index]
                                                                ['rent_id'],
                                                        type:
                                                            snapshot.data[index]
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
              return Text('No data available');
            }
          }),
    ));
  }
}
