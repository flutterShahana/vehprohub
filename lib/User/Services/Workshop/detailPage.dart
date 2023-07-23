import 'dart:convert';

import 'package:autoprohub/User/Services/Workshop/workshopBooking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class WorkshopDetailPage extends StatefulWidget {
  WorkshopDetailPage(
      {super.key, required this.veh_type, required this.service_type});
  var veh_type, service_type;
  @override
  State<WorkshopDetailPage> createState() => _WorkshopDetailPageState();
}

class _WorkshopDetailPageState extends State<WorkshopDetailPage> {
  var flag = 0;
  @override
  void initState() {
    super.initState();
    print('inside init fn');
    getData();
  }

  Future<dynamic> getData() async {
    print('inside getData fn');
    var data = {
      'vehType': widget.veh_type,
      'service': widget.service_type,
    };
    print(data);
    var response = await post(
        Uri.parse('${Con.url}USER/userViewWorshopService.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    print('Response: ${response.body}');

    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(title: Text('${widget.veh_type} ${widget.service_type}')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('Error:${snapshot.error}');
                print('Inside list : ${snapshot.hasData}');
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data..'),
                  );
                }

                return flag == 0
                    ? Center(child: Text('Nothing to show'))
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 20,
                              child: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading:
                                          Icon(Icons.miscellaneous_services),
                                      title: Text(
                                        'By: ${snapshot.data[index]['username']} ',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amount: ₹ ${snapshot.data[index]['amount']}',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Text(
                                            'Average Time: ${snapshot.data[index]['avgTime']}',
                                            style: TextStyle(fontSize: 17),
                                          )
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
                                                        work_id:
                                                            snapshot.data[index]
                                                                ['work_id'],
                                                        service:
                                                            snapshot.data[index]
                                                                ['serviceName'],
                                                        amt:
                                                            snapshot.data[index]
                                                                ['amount'],
                                                        avgTime:
                                                            snapshot.data[index]
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
                      );
              }),
        ),
      ),
    );
  }
}
