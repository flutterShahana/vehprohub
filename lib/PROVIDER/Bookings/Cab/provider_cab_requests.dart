import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class ProviderCabRequestSts extends StatefulWidget {
  const ProviderCabRequestSts({Key? key}) : super(key: key);

  @override
  State<ProviderCabRequestSts> createState() => _ProviderCabRequestStsState();
}

class _ProviderCabRequestStsState extends State<ProviderCabRequestSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;
  var reply;
  Future<dynamic> getData() async {
    var data = {'pro_id': lid.toString(), 'req_status': 'requested'};
    var response =
        await post(Uri.parse('${Con.url}viewCabBookings.php'), body: data);
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
        await post(Uri.parse("${Con.url}updateCabRequest.php"), body: data);
    print(response.body);
    jsonDecode(response.body)['result'] == 'success'
        ? setState(() {})
        : Navigator.pop(context);

    return json.decode(response.body);
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
                            'Booking ID : # ${snapshot.data[index]['book_id']}',
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          booikingId =
                                              snapshot.data[index]['book_id'];
                                          print('Booking Id:$booikingId');
                                          print(
                                              'cab ID: ${snapshot.data[index]['cab_id'].toString()}');

                                          reply = 'accepted';

                                          setState(() {
                                            updateRequest();
                                          });
                                        },
                                        child: Text('Accept')),
                                  ),
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          booikingId =
                                              snapshot.data[index]['book_id'];
                                          print('Booking Id:$booikingId');
                                          print(
                                              'cab ID: ${snapshot.data[index]['cab_id'].toString()}');

                                          reply = 'rejected';

                                          setState(() {
                                            updateRequest();
                                          });
                                        },
                                        child: Text('Reject')),
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
