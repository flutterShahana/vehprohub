import 'dart:convert';

import 'package:autoprohub/User/Services/Accessory/accessoriesService.dart';
import 'package:autoprohub/User/Services/Cab/cabBooking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AccessoriesDetailPage extends StatefulWidget {
  AccessoriesDetailPage({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.rate,
    required this.brand,
    required this.quantity,
    required this.acc_id,
    required this.type,
  });
  var image, name, rate, brand, quantity, acc_id, description, type;
  @override
  State<AccessoriesDetailPage> createState() => _AccessoriesDetailPageState();
}

class _AccessoriesDetailPageState extends State<AccessoriesDetailPage> {
  var qnty = TextEditingController();
  var flag = 0;
  var status, count, updated_qnty;
  var lid;
  var amtToPay;
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
    updated_qnty = int.parse(widget.quantity) - count;
    print('****************INSIDE SENTDATA***************');
    print('lid:$lid');
    var data = {
      'acc_id': widget.acc_id,
      'user_id': lid.toString(),
      'qnty': count.toString(),
      'updated_qnty': updated_qnty.toString(),
      'date': DateTime.now().toString(),
      'amtToPay': amtToPay.toString()
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}USER/accBooking.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AccessoriesServices()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AccessoriesServices()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: NetworkImage(
                    '${Con.url}Cabs/${widget.image}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.name}',
                      style: TextStyle(
                        //  backgroundColor: Colors.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: ' ₹ ${widget.rate}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                          children: [
                            TextSpan(
                              text: '/hour',
                              style: TextStyle(color: Colors.blue[100]),
                            )
                          ]),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Specification',
                      style: TextStyle(
                        //  backgroundColor: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              //  padding: EdgeInsets.all(20),//padding inside container
                              height: 80,
                              width: 80,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon(Icons
                                  //     .airline_seat_recline_extra_rounded),
                                  Text(
                                    'Brand',
                                    style: TextStyle(
                                        //  backgroundColor: Colors.yellow,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.brand}',
                                    style: TextStyle(
                                        //  backgroundColor: Colors.yellow,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              //  padding: EdgeInsets.all(20),//padding inside container
                              height: 80,
                              width: 80,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon(Icons.numbers),
                                  Text(
                                    'Quantity',
                                    style: TextStyle(
                                        //  backgroundColor: Colors.yellow,
                                        fontSize: 15,
                                        color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.quantity} ',
                                    style: TextStyle(
                                        //  backgroundColor: Colors.yellow,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        //  backgroundColor: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.description}',
                      style: TextStyle(
                          //  backgroundColor: Colors.yellow,
                          fontSize: 12,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 20,
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
                                      title: Text(
                                          'Quantity ${widget.quantity} left'),
                                      // content: Text('quantity required '),
                                      content: TextFormField(
                                        controller: qnty,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText:
                                                '--Enter quantity required--'),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              count = int.parse(qnty.text);
                                              print(qnty.text);
                                              print(count);
                                              if (count != null ||
                                                  count != '') {
                                                var q =
                                                    int.parse(widget.quantity);
                                                if (count < q) {
                                                  print(
                                                      'count less than or equal to stock count..so proceeding..');
                                                  var a =
                                                      int.parse(widget.rate);
                                                  print('a = $a');
                                                  var b = int.parse(qnty.text);
                                                  print('b = $b');
                                                  amtToPay = a * b;
                                                  print('amtToPay = $amtToPay');

                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Booking Confirmation'),
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
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Unit Price:'),
                                                                      Text(
                                                                          '₹ ${widget.rate}')
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Quantity:'),
                                                                      Text(
                                                                          '${qnty.text} No.')
                                                                    ],
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Total:'),
                                                                      Text(
                                                                          '₹ $amtToPay /-')
                                                                    ],
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                      .blue,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  sentData();
                                                                },
                                                                child: Text(
                                                                    'Proceed')),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Cancel')),
                                                          ],
                                                        );
                                                      });
                                                } else {
                                                  print(
                                                      'count should not be less than stock count');

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Quantity specified - Out of Range...')));
                                                }
                                              } else
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Quantity not specified...')));
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

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             CabBooking(cab_id: widget.acc_id)));
                            },
                            child: Text('Book Now')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
