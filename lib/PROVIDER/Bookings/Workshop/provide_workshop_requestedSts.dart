import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/wsPay.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/wsPay_advance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class ProviderWorkshopRequestedSts extends StatefulWidget {
  const ProviderWorkshopRequestedSts({Key? key}) : super(key: key);

  @override
  State<ProviderWorkshopRequestedSts> createState() =>
      _ProviderWorkshopRequestedStsState();
}

class _ProviderWorkshopRequestedStsState
    extends State<ProviderWorkshopRequestedSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var reply;

  var status, advance, booikingId, balance;
  Future<dynamic> getData() async {
    var data = {'pro_id': lid.toString(), 'req_status': 'requested'};
    var response =
        await post(Uri.parse('${Con.url}viewWorkshopBookings.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  Future updateRequest() async {
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
                                Row(
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

                                            reply = 'accepted';

                                            setState(() {
                                              updateRequest();
                                            });
                                          },
                                          child: Text('Accept')),
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                          onPressed: () {
                                            booikingId = snapshot.data[index]
                                                ['work_book_id'];
                                            print('Booking Id:$booikingId');
                                            print(
                                                'WS ID: ${snapshot.data[index]['work_id'].toString()}');

                                            reply = 'rejected';

                                            setState(() {
                                              updateRequest();
                                            });
                                          },
                                          child: Text('Reject')),
                                    ),
                                  ],
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
