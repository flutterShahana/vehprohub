import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';
import 'accessory_pay_sts.dart';

class AccessoryUpcomingSts extends StatefulWidget {
  const AccessoryUpcomingSts({Key? key}) : super(key: key);

  @override
  State<AccessoryUpcomingSts> createState() => _AccessoryUpcomingStsState();
}

class _AccessoryUpcomingStsState extends State<AccessoryUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;
  var amt = TextEditingController();
  var selected_payType;
  var selectedIndex;
  var _selectedPay;
  var count, updated_qnty;

  List<String> pay = [
    'assets/images/Rectangle 83.png',
    'assets/images/Rectangle 82.png',
    'assets/images/Rectangle 81.png',
    'assets/images/other2.png',
  ];

  Future<dynamic> getData() async {
    var data = {'user_id': lid.toString(), 'req_status': 'accepted'};
    var response = await post(
        Uri.parse('${Con.url}USER/BOOKINGS/viewMyAccBooking.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  // Future<dynamic> sentData() async {
  //   updated_qnty = int.parse(qnty.text) - count;
  //   var data = {
  //     'acc_id': widget.acc_id,
  //     'user_id': '1',
  //     'qnty': count.toString(),
  //     'updated_qnty': updated_qnty.toString(),
  //     'date': DateTime.now().toString(),
  //   };
  //   print(data);
  //   var response =
  //   await post(Uri.parse('${Con.url}USER/accBooking.php'), body: data);
  //   print(response.body);
  //   print(response.statusCode);
  //   status = response.statusCode;
  //   jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
  //   if (flag == 1) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Request sent Successfully..')));
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => AccessoriesServices()));
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Failed to sent request...')));
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => AccessoriesServices()));
  //   }
  //   //return jsonDecode(response.body);
  // }
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
                            '# ${snapshot.data[index]['acc_book_id']}',
                          ),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(
                                'Accessory ID :# ${snapshot.data[index]['acc_id']}',
                                style: tileTitle,
                              ),
                              Text(
                                'Type : ${snapshot.data[index]['type']}',
                                style: tileText,
                              ),
                              Text(
                                'Name: ${snapshot.data[index]['name']}',
                                style: tileText,
                              ),
                              Text(
                                'Brand: ${snapshot.data[index]['brand']}',
                                style: tileText,
                              ),
                              Text(
                                'Quantity: ${snapshot.data[index]['quantity']}',
                                style: tileText,
                              ),
                              Text(
                                'Rate:# ${snapshot.data[index]['rate']}',
                                style: tileText,
                              ),
                              Text(
                                'Enquiry: ${snapshot.data[index]['pro_phone']}',
                                style: tileText,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          booikingId = snapshot.data[index]
                                              ['acc_book_id'];
                                          print('Booking Id:$booikingId');
                                          print(
                                              'Accessory ID: ${snapshot.data[index]['acc_id'].toString()}');

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccessoryPay(
                                                        bookingID: booikingId,
                                                        amt: snapshot
                                                            .data[index]['tot'],
                                                      )));
                                        },
                                        child: Text('Pay to proceed')),
                                  ),
                                ],
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
