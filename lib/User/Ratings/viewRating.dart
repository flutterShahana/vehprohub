import 'dart:convert';

import 'package:autoprohub/User/Ratings/addRating.dart';
import 'package:autoprohub/User/Services/Workshop/workshopBooking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connect.dart';

class ViewRatings extends StatefulWidget {
  ViewRatings({super.key, required this.service_type});
  var service_type;
  @override
  State<ViewRatings> createState() => _ViewRatingsState();
}

class _ViewRatingsState extends State<ViewRatings> {
  var flag = 0;
  @override
  void initState() {
    super.initState();

    print('inside init fn');
    getData();
    setState(() {});
  }

  Future<dynamic> getData() async {
    print('inside getData fn');
    var data = {
      'service': widget.service_type,
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}USER/viewRating.php'), body: data);
    print(response.body);
    print(response.statusCode);
    print('Response: ${response.body}');

    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddRatings(service: widget.service_type)));
            },
            label: Text('Rate Us'),
            icon: Icon(Icons.add)),
        appBar: AppBar(
            toolbarHeight: 150,
            title: Text(
                'Our Customer Stories\n${widget.service_type} Service- Ratings and Reviews')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('Error:${snapshot.error}');
                print('Inside list : ${snapshot.hasData}');
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data..'),
                  );
                }

                return flag == 0
                    ? Center(child: Text('Nothing to show'))
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var count = int.parse(snapshot.data[index]['star']);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 20,
                              child: Container(
                                height:
                                    ((snapshot.data[index]['feedback'].length) >
                                            30)
                                        ? 160
                                        : ((snapshot.data[index]['feedback']
                                                    .length) >
                                                20)
                                            ? 130
                                            : 120,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text(
                                        ' ${snapshot.data[index]['username']} ',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              for (int i = 1; i <= 5; i++)
                                                (i <= count)
                                                    ? const Icon(Icons.star,
                                                        color: Colors.yellow)
                                                    : const Icon(
                                                        Icons.star_border,
                                                        color: Colors.yellow)
                                            ],
                                          ),
                                          Text(
                                            '${snapshot.data[index]['feedback']}',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      trailing: Text(
                                        '${snapshot.data[index]['date']}',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              }),
        ),
      ),
    );
  }
}
