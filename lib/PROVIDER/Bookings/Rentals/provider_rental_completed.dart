import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class ProviderRentalCompletedSts extends StatefulWidget {
  const ProviderRentalCompletedSts({Key? key}) : super(key: key);

  @override
  State<ProviderRentalCompletedSts> createState() =>
      _ProviderRentalCompletedStsState();
}

class _ProviderRentalCompletedStsState
    extends State<ProviderRentalCompletedSts> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  Future<dynamic> getData() async {
    var data = {'pro_id': '2', 'req_status': 'completed'};
    var response =
        await post(Uri.parse('${Con.url}viewRentalBookings.php'), body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
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
                            '# ${snapshot.data[index]['rent_book_id']}',
                          ),
                          subtitle: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(
                                'Rental ID :# ${snapshot.data[index]['rental_id']}',
                                style: tileTitle,
                              ),
                              Text(
                                'Type : ${snapshot.data[index]['type']}',
                                style: tileText,
                              ),
                              Text(
                                'Days: ${snapshot.data[index]['days']}',
                                style: tileText,
                              ),
                              Text(
                                'Pick Up Date: ${snapshot.data[index]['pick_up_date']}',
                                style: tileText,
                              ),
                              Text(
                                'Pick Up Time: ${snapshot.data[index]['pick_up_time']}',
                                style: tileText,
                              ),
                              Text(
                                'Rent:# ${snapshot.data[index]['rent']}/day',
                                style: tileText,
                              ),
                              Text(
                                'Enquiry: ${snapshot.data[index]['phone']}',
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
