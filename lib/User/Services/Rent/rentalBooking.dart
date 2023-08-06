import 'dart:convert';

import 'package:autoprohub/User/Services/Rent/rentalService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class RentalBooking extends StatefulWidget {
  RentalBooking({super.key, required this.rental_id, required this.rent});
  var rental_id, rent;
  @override
  State<RentalBooking> createState() => _RentalBookingState();
}

class _RentalBookingState extends State<RentalBooking> {
  final _formkey = GlobalKey<FormState>();
  var days = TextEditingController();
  var pickDate = TextEditingController();
  var pickTime = TextEditingController();
  var flag = 0;
  var status;
  var amt;
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

        pickTime.text = formattedTime;
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
        pickDate.text = formattedDate;
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
  }

  Future<dynamic> sentData() async {
    var data = {
      'rental_id': widget.rental_id,
      'user_id': lid.toString(),
      'days': days.text,
      'pickDate': pickDate.text,
      'pickTime': pickTime.text,
      'pay': amt.toString(),
      'date': DateTime.now().toString(),
    };
    var response =
        await post(Uri.parse('${Con.url}USER/rentalBooking.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RentalServices()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RentalServices()));
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
                    'Fill the details to book your Rental',
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
                    controller: days,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('No. of Days'),
                    ),
                  ),
                  TextFormField(
                    controller: pickDate,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Pick up Date'),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  TextFormField(
                    controller: pickTime,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('Pick up Time'),
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
                                  var rent = int.parse(widget.rent);
                                  var dayCount = int.parse(days.text);
                                  amt = rent * dayCount;
                                  return AlertDialog(
                                    title: Text('Booking Confirmation'),
                                    // content: Text('Total Amount to pay: $amt'),
                                    content: Container(
                                      height: 150,
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
                                                Text('Per Day:'),
                                                Text('₹ ${widget.rent}')
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
                                                Text('No.of Days:'),
                                                Text('${days.text}')
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.blue,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Total:'),
                                                Text('₹ $amt /-')
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            if (days.text.isNotEmpty &&
                                                pickDate.text.isNotEmpty &&
                                                pickTime.text.isNotEmpty) {
                                              setState(() {
                                                sentData();
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'All Fields required..')));
                                            }
                                          },
                                          child: Text('Ok')),
                                      TextButton(
                                          onPressed: () {
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
