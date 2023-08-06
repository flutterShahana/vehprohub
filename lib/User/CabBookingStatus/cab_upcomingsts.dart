import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:autoprohub/User/CabBookingStatus/cabPay.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class CabUpcomingSts extends StatefulWidget {
  const CabUpcomingSts({Key? key}) : super(key: key);

  @override
  State<CabUpcomingSts> createState() => _CabUpcomingStsState();
}

class _CabUpcomingStsState extends State<CabUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;

  Future<dynamic> getData() async {
    var data = {'user_id': lid.toString(), 'req_status': 'accepted'};
    var response = await post(
        Uri.parse('${Con.url}USER/BOOKINGS/viewMyCabBooking.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  Future<dynamic> cancel() async {
    var data = {
      'booking_id': booikingId,
    };
    print(data);
    var response = await post(
        Uri.parse('${Con.url}USER/Bookings/cancelBooking_cab.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking cancelled Successfully..')));
      Navigator.pop(context);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => AccessoriesServices()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to cancel booking...')));
      Navigator.pop(context);

      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => AccessoriesServices()));
    }
    //return jsonDecode(response.body);
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
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          title: Text(
                            'Booking ID :# ${snapshot.data[index]['book_id']}',
                          ),
                          subtitle: ListView(
                            padding: EdgeInsets.all(15),
                            shrinkWrap: true,
                            children: [
                              Text(
                                'Cab ID :# ${snapshot.data[index]['cab_id']}',
                                style: tileTitle,
                              ),
                              Text(
                                'Type : ${snapshot.data[index]['type']}',
                                style: tileText,
                              ),
                              Text(
                                'Source: ${snapshot.data[index]['source']}',
                                style: tileText,
                              ),
                              Text(
                                'Destination: ${snapshot.data[index]['dest']}',
                                style: tileText,
                              ),
                              Text(
                                'Date:# ${snapshot.data[index]['bookingDate']}',
                                style: tileText,
                              ),
                              Text(
                                'Time: ${snapshot.data[index]['bookingTime']}',
                                style: tileText,
                              ),
                              Divider(),
                              Text(
                                'For Enquiry: ',
                                style: tileText,
                              ),
                              ListTile(
                                title: Text(
                                  'Ph: ${snapshot.data[index]['pro_phone']}',
                                  style: tileText,
                                ),
                              ),
                              Visibility(
                                visible:
                                    snapshot.data[index]['pay_status'] == 'paid'
                                        ? false
                                        : true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                          onPressed: () {
                                            if (int.parse(snapshot.data[index]
                                                    ['tot_hr']) ==
                                                0) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Total running time not marked by the Cab Service'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Ok'))
                                                      ],
                                                    );
                                                  });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    var total_amt = int.parse(
                                                        snapshot.data[index]
                                                            ['rate']);
                                                    var total_hrs = int.parse(
                                                        snapshot.data[index]
                                                            ['tot_hr']);
                                                    var toPay =
                                                        total_amt * total_hrs;
                                                    print(toPay);
                                                    return AlertDialog(
                                                      title: Container(
                                                        height: 300,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Total Amount:'),
                                                                Text(
                                                                    '₹ ${snapshot.data[index]['rate']}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Time Taken:'),
                                                                Text(
                                                                    '${snapshot.data[index]['tot_hr']} hr')
                                                              ],
                                                            ),
                                                            Divider(),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('Total :'),
                                                                Text('₹ $toPay')
                                                              ],
                                                            ),
                                                            Divider(),
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  booikingId = snapshot
                                                                              .data[
                                                                          index]
                                                                      [
                                                                      'book_id'];
                                                                  print(
                                                                      'Booking Id:$booikingId');
                                                                  print(
                                                                      'Cab ID: ${snapshot.data[index]['cab_id'].toString()}');
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => CabPay(
                                                                                bookingID: booikingId,
                                                                                amt: toPay.toString(),
                                                                              )));
                                                                },
                                                                child: Text(
                                                                    'Pay')),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            }
                                          },
                                          child: Text('Pay')),
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Confirm Cancellation'),
                                                    title: Text(
                                                        'Do you want to cancel ..'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            booikingId =
                                                                snapshot.data[
                                                                        index]
                                                                    ['book_id'];
                                                            cancel();
                                                          },
                                                          child: Text('Yes')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('No')),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text('Cancel')),
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
