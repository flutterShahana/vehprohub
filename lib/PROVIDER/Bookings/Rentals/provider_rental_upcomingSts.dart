import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class ProviderRentalUpcomingSts extends StatefulWidget {
  const ProviderRentalUpcomingSts({Key? key}) : super(key: key);

  @override
  State<ProviderRentalUpcomingSts> createState() =>
      _ProviderRentalUpcomingStsState();
}

class _ProviderRentalUpcomingStsState extends State<ProviderRentalUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;
  var reply;
  var lid;
  Future<dynamic> getData() async {
    var data = {'pro_id': lid.toString(), 'req_status': 'accepted'};
    var response =
        await post(Uri.parse('${Con.url}viewRentalBookings.php'), body: data);
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
        await post(Uri.parse("${Con.url}updateRentalRequest.php"), body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
  }

  Future updateVehicleReceivalStatus(id) async {
    var data = {
      'booikingId': id.toString(),
    };
    print(data);
    var response = await post(
        Uri.parse("${Con.url}updateVehicleReceivalStatus.php"),
        body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
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
                            'Booking ID :# ${snapshot.data[index]['rent_book_id']}',
                          ),
                          subtitle: ListView(
                            padding: EdgeInsets.all(15),
                            shrinkWrap: true,
                            children: [
                              Text(
                                'Rental ID :# ${snapshot.data[index]['rental_id']}',
                                style: tileTitle,
                              ),
                              Text(
                                'Type : ${snapshot.data[index]['type']}',
                                style: tileText,
                              ),
                              Text(
                                'Days: ${snapshot.data[index]['days']}',
                                style: tileText,
                              ),
                              Text(
                                'Pick Up Date: ${snapshot.data[index]['pick_up_date']}',
                                style: tileText,
                              ),
                              Text(
                                'Pick Up Time: ${snapshot.data[index]['pick_up_time']}',
                                style: tileText,
                              ),
                              Text(
                                'Rent:# ${snapshot.data[index]['rent']}/day',
                                style: tileText,
                              ),
                              Text(
                                'Payment Status: ${snapshot.data[index]['pay_status']}',
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
                              Visibility(
                                visible: snapshot.data[index]['pay_status'] ==
                                            'advance paid' &&
                                        snapshot.data[index]
                                                ['veh_receive_status'] ==
                                            'pending'
                                    ? true
                                    : false,
                                child: Container(
                                    height: 120,
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Mark Vehicle receival to get full payment',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                updateVehicleReceivalStatus(
                                                    snapshot.data[index]
                                                        ['rent_book_id']);
                                              });
                                            },
                                            child:
                                                const Text('vehicle received'))
                                      ],
                                    )),
                              ),
                              Visibility(
                                visible:
                                    snapshot.data[index]['pay_status'] == 'paid'
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
                                                ['rent_book_id'];
                                            print('Booking Id:$booikingId');
                                            print(
                                                'Rental ID: ${snapshot.data[index]['rental_id'].toString()}');

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
                  )
                : Center(child: Text('Nothing to show'));
          }),
    );
  }
}
