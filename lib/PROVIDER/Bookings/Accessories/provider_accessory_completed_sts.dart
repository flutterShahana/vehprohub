import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class ProviderAccessoryCompletedSts extends StatefulWidget {
  const ProviderAccessoryCompletedSts({Key? key}) : super(key: key);

  @override
  State<ProviderAccessoryCompletedSts> createState() =>
      _ProviderAccessoryCompletedStsState();
}

class _ProviderAccessoryCompletedStsState
    extends State<ProviderAccessoryCompletedSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var lid;
  Future<dynamic> getData() async {
    var data = {'pro_id': lid.toString(), 'req_status': 'completed'};
    print(data);
    var response =
        await post(Uri.parse('${Con.url}viewAccBookings.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print(lid);
      });
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Center(child: Text('No data available'));
              }
            }
            return flag == 1
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          title: Text(
                            'Booking ID :# ${snapshot.data[index]['acc_book_id']}',
                          ),
                          subtitle: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(15),
                            children: [
                              Text(
                                'Accessory ID :# ${snapshot.data[index]['acc_id']}',
                                style: tileTitle,
                              ),
                              Text(
                                'Type : ${snapshot.data[index]['type']}',
                                style: tileText,
                              ),
                              Text(
                                'Name: ${snapshot.data[index]['name']}',
                                style: tileText,
                              ),
                              Text(
                                'Brand: ${snapshot.data[index]['brand']}',
                                style: tileText,
                              ),
                              Text(
                                'Quantity: ${snapshot.data[index]['quantity']}',
                                style: tileText,
                              ),
                              Text(
                                'Rate:# ${snapshot.data[index]['rate']}',
                                style: tileText,
                              ),
                              Divider(),
                              Text(
                                'Customer: ',
                                style: tileText,
                              ),
                              ListTile(
                                leading: Container(
                                  height: 30,
                                  width: 30,
                                ),
                                title: Text(
                                  '${snapshot.data[index]['username']}',
                                  style: tileText,
                                ),
                                subtitle: Text(
                                  'Ph: ${snapshot.data[index]['phone']}',
                                  style: tileText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: Text('Nothing to show'));
          }),
    );
  }
}
