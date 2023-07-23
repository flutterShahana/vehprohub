import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class ProviderAccessoryUpcomingSts extends StatefulWidget {
  const ProviderAccessoryUpcomingSts({Key? key}) : super(key: key);

  @override
  State<ProviderAccessoryUpcomingSts> createState() =>
      _ProviderAccessoryUpcomingStsState();
}

class _ProviderAccessoryUpcomingStsState
    extends State<ProviderAccessoryUpcomingSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;
  var reply;
  Future<dynamic> getData() async {
    var data = {'pro_id': '1', 'req_status': 'accepted'};
    var response =
        await post(Uri.parse('${Con.url}viewAccBookings.php'), body: data);
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
        await post(Uri.parse("${Con.url}updateAccRequest.php"), body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
  }

  @override
  void initState() {
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

                                          reply = 'completed';

                                          setState(() {
                                            updateRequest();
                                          });
                                        },
                                        child: Text('Mark completed')),
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
