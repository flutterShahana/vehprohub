import 'dart:convert';

import 'package:autoprohub/User/Services/Cab/cabservices.dart';
import 'package:autoprohub/User/Services/Workshop/workshopService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class WorkshopBooking extends StatefulWidget {
  WorkshopBooking({
    super.key,
    required this.work_id,
    required this.service,
    required this.amt,
    required this.avgTime,
  });
  var work_id, service, amt, avgTime;
  @override
  State<WorkshopBooking> createState() => _WorkshopBookingState();
}

class _WorkshopBookingState extends State<WorkshopBooking> {
  final _formkey = GlobalKey<FormState>();
  var date = TextEditingController();
  var time = TextEditingController();
  var flag = 0;
  var status;
  var lid;
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      print(picked); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedTime = picked.format(context);
      print(formattedTime);
      setState(() {
        _selectedTime = picked;

        time.text = formattedTime;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      print(picked); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      print(formattedDate);
      setState(() {
        //  _selectedDate = picked;
        date.text = formattedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print(lid);
      });
    });
    // setState(() {
    //   myLogin();
    // });
  }

  Future<dynamic> sentData() async {
    var data = {
      'work_id': widget.work_id,
      'user_id': lid.toString(),
      'bookingDate': date.text,
      'bookingTime': time.text,
      'date': DateTime.now().toString(),
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}USER/workShopBooking.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WorkshopServices()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WorkshopServices()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Fill the details to book your Workshop Service',
                    style: TextStyle(
                        //  backgroundColor: Colors.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Service Selected :${widget.service}'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: date,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('DD/MM/YYYY'),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  TextFormField(
                    controller: time,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Select Time'),
                    ),
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Booking Confirmation'),
                                    content: Container(
                                      height: 130,
                                      width: 350,
                                      child: Column(
                                        children: [
                                          // Icon(
                                          //   Icons
                                          //       .currency_rupee_sharp,
                                          //   size: 25,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Amount:'),
                                                Text('₹ ${widget.amt}')
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Average Time:'),
                                                Text('${widget.avgTime}')
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Service:'),
                                                Text('${widget.service}')
                                              ],
                                            ),
                                          ),

                                          Divider(
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            if (date.text.isNotEmpty &&
                                                time.text.isNotEmpty) {
                                              setState(() {
                                                sentData();
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'All fields required..')));
                                            }
                                          },
                                          child: Text('Proceed')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                    ],
                                  );
                                });
                          },
                          child: Text('Book Now')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
