import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/wsPay.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/wsPay_advance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class ProviderWorkshopUpcomingSts extends StatefulWidget {
  const ProviderWorkshopUpcomingSts({Key? key}) : super(key: key);

  @override
  State<ProviderWorkshopUpcomingSts> createState() =>
      _ProviderWorkshopUpcomingStsState();
}

class _ProviderWorkshopUpcomingStsState
    extends State<ProviderWorkshopUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var reply;

  var status, advance, booikingId, balance;
  Future<dynamic> getData() async {
    var data = {'pro_id': lid.toString(), 'req_status': 'accepted'};
    var response =
        await post(Uri.parse('${Con.url}viewWorkshopBookings.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  Future updateRequest() async {
    print('**************Update request*************');
    var data = {'booikingId': booikingId.toString(), 'reply': reply};
    print(data);
    var response =
        await post(Uri.parse("${Con.url}updateWSRequest.php"), body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
  }

  Future updateServiceFinishStatus(id) async {
    var data = {
      'booikingId': id.toString(),
    };
    print(data);
    var response = await post(
        Uri.parse("${Con.url}updateServiceFinishStatus.php"),
        body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
  }

  var lid;
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
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Booking ID :# ${snapshot.data[index]['work_book_id']}',
                            ),
                            subtitle: ListView(
                              padding: EdgeInsets.all(15),
                              shrinkWrap: true,
                              children: [
                                Text(
                                  'Workshop Service ID :# ${snapshot.data[index]['work_id']}',
                                  style: tileTitle,
                                ),
                                Text(
                                  'Type : ${snapshot.data[index]['type']}',
                                  style: tileText,
                                ),
                                Text(
                                  'Service: ${snapshot.data[index]['serviceName']}',
                                  style: tileText,
                                ),
                                Text(
                                  'Average time: ${snapshot.data[index]['avgTime']}',
                                  style: tileText,
                                ),
                                Text(
                                  'Booking For: ${snapshot.data[index]['booking_date']}',
                                  style: tileText,
                                ),
                                Text(
                                  'Requested Time:# ${snapshot.data[index]['booking_time']}',
                                  style: tileText,
                                ),
                                Divider(),
                                Text(
                                  'Total Amount: ₹ ${snapshot.data[index]['amount']}',
                                  style: tileText,
                                ),
                                Divider(),
                                RichText(
                                  text: TextSpan(
                                      text: ' Payment Status:  ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${snapshot.data[index]['pay_status']}',
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ]),
                                ),
                                Divider(),
                                Text(
                                  'For Enquiry: ',
                                  style: tileText,
                                ),
                                ListTile(
                                  leading: Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                  title: Text(
                                    'Customer: ${snapshot.data[index]['username']}',
                                    style: tileText,
                                  ),
                                  subtitle: Text(
                                    'Ph: ${snapshot.data[index]['phone']}',
                                    style: tileText,
                                  ),
                                ),
                                Visibility(
                                  visible: snapshot.data[index]['pay_status'] ==
                                              'advance paid' &&
                                          snapshot.data[index]
                                                  ['service_completion'] ==
                                              'pending'
                                      ? true
                                      : false,
                                  child: Container(
                                      height: 120,
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Mark Service Completion to get full payment',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  updateServiceFinishStatus(
                                                      snapshot.data[index]
                                                          ['work_book_id']);
                                                });
                                              },
                                              child: const Text(
                                                  'Service finished'))
                                        ],
                                      )),
                                ),
                                Visibility(
                                  visible: snapshot.data[index]['pay_status'] ==
                                          'paid'
                                      ? true
                                      : false,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {
                                              booikingId = snapshot.data[index]
                                                  ['work_book_id'];
                                              print('Booking Id:$booikingId');
                                              print(
                                                  'WS ID: ${snapshot.data[index]['work_id'].toString()}');

                                              reply = 'completed';

                                              setState(() {
                                                updateRequest();
                                              });
                                            },
                                            child: Text('Mark completed')),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: Text('Nothing to show'));
          }),
    );
  }
}
