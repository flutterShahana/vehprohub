import 'dart:convert';

import 'package:autoprohub/User/Services/Cab/cabservices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class CabBooking extends StatefulWidget {
  CabBooking({super.key, required this.cab_id, required this.rate});
  var cab_id, rate;
  @override
  State<CabBooking> createState() => _CabBookingState();
}

class _CabBookingState extends State<CabBooking> {
  final _formkey = GlobalKey<FormState>();
  var source = TextEditingController();
  var dest = TextEditingController();
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
      'cab_id': widget.cab_id,
      'user_id': lid.toString(),
      'source': source.text,
      'dest': dest.text,
      'bookingDate': date.text,
      'bookingTime': time.text,
      'tot': widget.rate,
      'date': DateTime.now().toString(),
    };
    var response =
        await post(Uri.parse('${Con.url}USER/cabBooking.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Cabservices()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Cabservices()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    'Fill the details to book your Cab',
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
                      label: Text('Amount to Pay :${widget.rate}'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: source,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Source'),
                    ),
                  ),
                  TextFormField(
                    controller: dest,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Destination'),
                    ),
                  ),
                  TextFormField(
                    controller: date,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
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
                                      height: 80,
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
                                                Text('Per hour :'),
                                                Text('₹ ${widget.rate}')
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
                                            sentData();
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
