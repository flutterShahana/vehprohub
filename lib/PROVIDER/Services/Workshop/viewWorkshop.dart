import 'dart:convert';

import 'package:autoprohub/PROVIDER/Services/Workshop/addCarServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';
import 'ServiceList/serviceList.dart';
import 'addBikeService.dart';

class ViewWorkshop extends StatefulWidget {
  ViewWorkshop({super.key, required this.type});
  var type;
  @override
  State<ViewWorkshop> createState() => _ViewWorkshopState();
}

class _ViewWorkshopState extends State<ViewWorkshop> {
  var lid;
  var flag = 0;
  var work_id;
  var amt = TextEditingController();
  var avgTime = TextEditingController();
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

  Future<dynamic> getData() async {
    var data = {
      'pro_id': lid.toString(),
      'type': widget.type,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}viewWorkshop.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
      print(flag);
      return json.decode(response.body);
    } else
      throw Exception('Error returned');
  }

  Future<dynamic> deleteData() async {
    var data = {
      'work_id': work_id,
    };

    var response =
        await post(Uri.parse('${Con.url}deleteWorkshop.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['result'] == 'success') {
        setState(() {});
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Deleted Successfully...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
        // return json.decode(response.body);
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Failed to delete...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
      }
    } else
      throw Exception('Error returned');
  }

  Future<dynamic> editData() async {
    var data = {
      'work_id': work_id,
      'amt': amt.text,
      'avgTime': avgTime.text,
    };

    var response =
        await post(Uri.parse('${Con.url}editWorkshopDetails.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['result'] == 'success') {
        setState(() {});
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Edited Successfully...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
        // return json.decode(response.body);
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Failed to edit...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
      }
    } else
      throw Exception('Error returned');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (widget.type == 'bike') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddBikeServices()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCarServices()));
                }
              },
              child: Icon(Icons.add),
            ),
            body: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print('Error ::${snapshot.error}');
                  print('Inside builder ::${snapshot.hasData}');
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Center(child: Text('No Data')),
                    );
                  }
                  //  return flag==0?lottieNothing():
                  return flag == 0
                      ? const Center(
                          child: Text("Nothing to show.."),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Text(
                                        '${snapshot.data[index]['serviceName']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Amount:${snapshot.data[index]['amount']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Average Time:${snapshot.data[index]['avgTime']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Visibility(
                                        visible: snapshot.data[index]
                                                    ['serviceName'] ==
                                                'Basic Services'
                                            ? true
                                            : false,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 20,
                                            child: ListView.builder(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                shrinkWrap: true,
                                                itemCount:
                                                    basic_services_car.length,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                      basic_services_car[
                                                          index]);
                                                }),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: snapshot.data[index]
                                                    ['serviceName'] ==
                                                'Mid Range Services'
                                            ? true
                                            : false,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 20,
                                            child: ListView.builder(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                shrinkWrap: true,
                                                itemCount: midRange_services_car
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                      midRange_services_car[
                                                          index]);
                                                }),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: snapshot.data[index]
                                                    ['serviceName'] ==
                                                'Major Services'
                                            ? true
                                            : false,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 20,
                                            child: ListView.builder(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                shrinkWrap: true,
                                                itemCount:
                                                    major_services_car.length,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                      major_services_car[
                                                          index]);
                                                }),
                                          ),
                                        ),
                                      ),
                                      ButtonBar(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                amt.text = snapshot.data[index]
                                                    ['amount'];
                                                avgTime.text = snapshot
                                                    .data[index]['avgTime'];
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Edit Details'),
                                                        content: Container(
                                                          height: 150,
                                                          child: Column(
                                                            children: [
                                                              TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                controller: amt,
                                                                decoration: const InputDecoration(
                                                                    label: Text(
                                                                        'New amount')),
                                                              ),
                                                              TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                controller:
                                                                    avgTime,
                                                                decoration: const InputDecoration(
                                                                    label: Text(
                                                                        'New Time')),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                work_id = snapshot
                                                                            .data[
                                                                        index]
                                                                    ['work_id'];
                                                                editData();
                                                              },
                                                              child: const Text(
                                                                  'Edit')),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Cancel')),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text('Edit')),
                                          ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Delete Product'),
                                                        content: const Text(
                                                            'Are you sure?'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                work_id = snapshot
                                                                            .data[
                                                                        index]
                                                                    ['work_id'];
                                                                deleteData();
                                                              },
                                                              child: const Text(
                                                                  'Yes')),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'No')),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text('Delete')),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                })));
  }
}
