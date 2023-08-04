import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class CabRequestCancelled extends StatefulWidget {
  const CabRequestCancelled({Key? key}) : super(key: key);

  @override
  State<CabRequestCancelled> createState() => _CabRequestCancelledState();
}

class _CabRequestCancelledState extends State<CabRequestCancelled> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  Future<dynamic> getData() async {
    var data = {'user_id': lid.toString(), 'req_status': 'cancelled'};
    var response = await post(
        Uri.parse('${Con.url}USER/BOOKINGS/viewMyCabBooking.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
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
                            '# ${snapshot.data[index]['book_id']}',
                          ),
                          subtitle: ListView(
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
