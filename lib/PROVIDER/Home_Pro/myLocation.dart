import 'dart:convert';

import 'package:autoprohub/PROVIDER/Home_Pro/updateLocation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';

class MyLocation extends StatefulWidget {
  MyLocation({super.key, required this.lid});
  var lid;
  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  var lid, flag;
  var lati, longi, location;

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future<dynamic> getUserData() async {
    print(
        '------userprofile------inside getUserData fn of view user data by user----------');
    var data = {
      'user_id': widget.lid,
    };
    print(data);
    var response = await post(
        Uri.parse(
          '${Con.url}USER/userProfile.php',
        ),
        body: data);
    print(response.body);
    print(response.statusCode);
    print('----------------------------------');

    jsonDecode(response.body)[0]['result'] == 'success'
        ? {
            flag = 1,
            lati = jsonDecode(response.body)[0]['lati'],
            longi = jsonDecode(response.body)[0]['longi'],
            location = jsonDecode(response.body)[0]['location'],
            print('********************'),
            print(lati),
            print(longi),
            print(location),
            print('**************'),
            (lati == '' || longi == '') ? flag = 0 : flag = 1,
            print('FLAG>>>>>>>>>>>> $flag')
          }
        : {flag = 0, print('FLAG>>>>>>>>>>>> $flag')};

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();

    getUserData();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        isExtended: true,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateLocation()));
        },
        label: const Text('Update Location '),
        // icon: Icon(Icons.add)
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://100map.net/img/en/a2p_london.png'))),
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 79,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50,
                      )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              flag == 1
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: Colors.grey.withOpacity(.2),
                                // spreadRadius: 2,
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20),
                        ),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          '-- Loation not updated --',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    ));
  }
}
