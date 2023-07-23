import 'dart:convert';

import 'package:autoprohub/User/Services/Cab/cabBooking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class CabDetailPage extends StatefulWidget {
  CabDetailPage({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.rate,
    required this.size,
    required this.person,
    required this.cab_id,
    required this.type,
  });
  var image, name, rate, size, person, cab_id, description, type;
  @override
  State<CabDetailPage> createState() => _CabDetailPageState();
}

class _CabDetailPageState extends State<CabDetailPage> {
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
                        Visibility(
                          visible: widget.type != 'Goods' ? true : false,
                          child: Padding(
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
                                    Icon(Icons
                                        .airline_seat_recline_extra_rounded),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${widget.person}',
                                      style: TextStyle(
                                          //  backgroundColor: Colors.yellow,
                                          fontSize: 15,
                                          color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.type == 'Goods' ? true : false,
                          child: Padding(
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
                                    Icon(Icons.photo_size_select_small),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${widget.size}',
                                      style: TextStyle(
                                          //  backgroundColor: Colors.yellow,
                                          fontSize: 15,
                                          color: Colors.black87),
                                    )
                                  ],
                                ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CabBooking(
                                            cab_id: widget.cab_id,
                                            rate: widget.rate,
                                          )));
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
