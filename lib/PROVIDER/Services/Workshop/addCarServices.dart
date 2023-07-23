import 'dart:convert';

import 'package:autoprohub/PROVIDER/Services/Workshop/ServiceList/serviceList.dart';
import 'package:autoprohub/PROVIDER/Services/Workshop/workshops.dart';
import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AddCarServices extends StatefulWidget {
  AddCarServices({Key? key}) : super(key: key);
  var bookingID;
  var amt;
  @override
  State<AddCarServices> createState() => _AddCarServicesState();
}

class _AddCarServicesState extends State<AddCarServices> {
  var flag = 0;
  var status;
  var serviceName;
  var amt = TextEditingController();
  var timeTaken = TextEditingController();
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print('lid=$lid');
      });
    });
  }

  Future<dynamic> sentData() async {
    var data = {
      'pro_id': lid.toString(),
      'service': serviceName,
      'amt': amt.text,
      'timeTaken': timeTaken.text,
      'type': 'car'
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}addWorkshopService.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Item Added Successfully..')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Workshop()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add ...')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Workshop()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Car Services'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Basic Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          return Text(basic_services_car[index]);
                        }),
                  ),
                ),
                Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: color,
                          ),
                      onPressed: () {
                        serviceName = 'Basic Services';
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: amt,
                                        decoration: InputDecoration(
                                            hintText: '--Amount--'),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: timeTaken,
                                        decoration: InputDecoration(
                                            hintText: '--Average Time --'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        sentData();
                                      },
                                      child: Text('Add')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'))
                                ],
                              );
                            });
                        // sendData(_image!);
                      },
                      child: const Center(
                          child: Text(
                        'Add',
                      ))),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Mid Range Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          return Text(midRange_services_car[index]);
                        }),
                  ),
                ),
                Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: color,
                          ),
                      onPressed: () {
                        serviceName = 'Mid Range Services';
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: amt,
                                        decoration: InputDecoration(
                                            hintText: '--Amount--'),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: timeTaken,
                                        decoration: InputDecoration(
                                            hintText: '--Average Time --'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        sentData();
                                      },
                                      child: Text('Add')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'))
                                ],
                              );
                            });
                        // sendData(_image!);
                      },
                      child: const Center(
                          child: Text(
                        'Add',
                      ))),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Major Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          return Text(major_services_car[index]);
                        }),
                  ),
                ),
                Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: color,
                          ),
                      onPressed: () {
                        serviceName = 'Major Services';
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: amt,
                                        decoration: InputDecoration(
                                            hintText: '--Amount--'),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: timeTaken,
                                        decoration: InputDecoration(
                                            hintText: '--Average Time --'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        sentData();
                                      },
                                      child: Text('Add')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'))
                                ],
                              );
                            });
                        // sendData(_image!);
                      },
                      child: const Center(
                          child: Text(
                        'Add',
                      ))),
                ),
              ],
            ),
          ],
        ));
  }
}
