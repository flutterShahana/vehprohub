import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalPay.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalPay_advance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class RentalUpcomingSts extends StatefulWidget {
  const RentalUpcomingSts({Key? key}) : super(key: key);

  @override
  State<RentalUpcomingSts> createState() => _RentalUpcomingStsState();
}

class _RentalUpcomingStsState extends State<RentalUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var advance, booikingId, balance;
  Future<dynamic> getData() async {
    var data = {'user_id': lid.toString(), 'req_status': 'accepted'};
    var response = await post(
        Uri.parse('${Con.url}USER/BOOKINGS/viewMyRentalBooking.php'),
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
        Uri.parse('${Con.url}USER/Bookings/cancelBooking_rental.php'),
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
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Booking ID:# ${snapshot.data[index]['rent_book_id']}',
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
                                  'Rate: ₹ ${snapshot.data[index]['rent']}/day',
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
                                  title: Text(
                                    'Ph: ${snapshot.data[index]['pro_phone']}',
                                    style: tileText,
                                  ),
                                ),
                                Visibility(
                                  visible: snapshot.data[index]['pay_status'] ==
                                          'pending'
                                      ? true
                                      : false,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    var total_amt = int.parse(
                                                        snapshot.data[index]
                                                            ['rent']);
                                                    var qnty = int.parse(
                                                        snapshot.data[index]
                                                            ['days']);
                                                    var toPay =
                                                        total_amt * qnty;
                                                    advance = toPay * 0.3;
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
                                                                Text('Amount:'),
                                                                Text(
                                                                    '₹ ${snapshot.data[index]['rent']}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'No.of days :'),
                                                                Text(
                                                                    '${snapshot.data[index]['days']} No.')
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
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Advance :'),
                                                                Text(
                                                                    '₹ $advance')
                                                              ],
                                                            ),
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  booikingId = snapshot
                                                                              .data[
                                                                          index]
                                                                      [
                                                                      'rent_book_id'];
                                                                  print(
                                                                      'Booking Id:$booikingId');
                                                                  print(
                                                                      'Rental ID: ${snapshot.data[index]['rental_id'].toString()}');
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => RentalPay_Advance(
                                                                                bookingID: booikingId,
                                                                                amt: advance.toString(),
                                                                              )));
                                                                },
                                                                child: Text(
                                                                    'Pay')),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text('Pay Advance')),
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
                                                              booikingId = snapshot
                                                                          .data[
                                                                      index][
                                                                  'rent_book_id'];
                                                              setState(() {
                                                                cancel();
                                                              });
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
                                Visibility(
                                  visible: snapshot.data[index]
                                                  ['veh_receive_status'] ==
                                              'received' &&
                                          snapshot.data[index]['pay_status'] ==
                                              'advance paid'
                                      ? true
                                      : false,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    var total_amt = int.parse(
                                                        snapshot.data[index]
                                                            ['rent']);
                                                    var qnty = int.parse(
                                                        snapshot.data[index]
                                                            ['days']);
                                                    var advanceAmt = int.parse(
                                                        snapshot.data[index]
                                                            ['advance_amt']);
                                                    var toPay =
                                                        total_amt * qnty;
                                                    balance =
                                                        toPay - advanceAmt;
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
                                                                Text('₹ $toPay')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Advance Paid:'),
                                                                Text(
                                                                    '₹ ${snapshot.data[index]['advance_amt']}')
                                                              ],
                                                            ),
                                                            Divider(),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Balance :'),
                                                                Text(
                                                                    '₹ $balance')
                                                              ],
                                                            ),
                                                            Divider(),
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  booikingId = snapshot
                                                                              .data[
                                                                          index]
                                                                      [
                                                                      'rent_book_id'];
                                                                  print(
                                                                      'Booking Id:$booikingId');
                                                                  print(
                                                                      'Rental ID: ${snapshot.data[index]['rental_id'].toString()}');
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => RentalPay(
                                                                                bookingID: booikingId,
                                                                                amt: balance.toString(),
                                                                                advance: advanceAmt.toString(),
                                                                              )));
                                                                },
                                                                child: Text(
                                                                    'Pay')),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text('Complete Payment')),
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
