import 'dart:convert';
import 'dart:math' as math;

import 'package:autoprohub/PROVIDER/Services/Cab/addCabDetails.dart';
import 'package:autoprohub/SP/sp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../connection/connect.dart';
import 'addOffer.dart';

class ViewOffer extends StatefulWidget {
  ViewOffer({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<ViewOffer> createState() => _ViewOfferState();
}

class _ViewOfferState extends State<ViewOffer> {
  // var pro_id;
  // @override
  // void initState() {
  //   super.initState();
  //   myLogin();
  // }
  //
  // Future<void> myLogin() async {
  //   pro_id = await getLogin();
  // }

  var lid;
  @override
  void initState() {
    super.initState();
    getData();
    setState(() {});
    _refresh();
  }

  var flag;
  var offer_id;
  Future<dynamic> getData() async {
    var data = {
      'pro_id': widget.lid,
    };
    print(data);
    var response = await post(Uri.parse('${Con.url}viewOffer.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
      print(flag);
      return json.decode(response.body);
    } else
      throw Exception('Error returned');
  }

  Future<dynamic> deleteData() async {
    var data = {
      'offer_id': offer_id,
    };
    print(data);

    var response =
        await post(Uri.parse('${Con.url}deleteOffer.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['result'] == 'success') {
        setState(() {});
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Deleted Successfully...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
        // return json.decode(response.body);
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Failed to delete...',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color(0xfa8f7805),
        ));

        print(flag);
      }
    } else
      throw Exception('Error returned');
  }

  void nav() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddOffer()));
  }

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple,
        //   isExtended: true,
        onPressed: () {
          nav();
        },
        child: const Icon(Icons.add),
      ),
      // appBar: AppBar(
      //   title: const Text(
      //     'Offers',
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.home),
      //     )
      //   ],
      // ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print('Error ::${snapshot.error}');
            print('Inside builder ::${snapshot.hasData}');
            if (!snapshot.hasData) {
              return const Center(
                child: Center(child: Text('No Data')),
              );
            }
            //  return flag==0?lottieNothing():
            return flag == 0
                ? const Center(
                    child: Text("No Data to show.."),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Card(
                              elevation: 20,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      color: Colors.purple.withOpacity(0.3),
                                      height: 45,
                                      width: double.infinity,
                                      child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Delete Offer'),
                                                    content: const Text(
                                                        'Are you sure?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            offer_id = snapshot
                                                                    .data[index]
                                                                ['offer_id'];
                                                            deleteData();
                                                          },
                                                          child: const Text(
                                                              'Yes')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text('No')),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            //  color: Colors.red,
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                    Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  height: 350,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color:
                                                      const Color(0xffa2e7ef),
                                                  child: Image.network(
                                                    '${Con.url}offer/${snapshot.data[index]['offer']}',
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Valid From : ',
                                                    // style: heading1,
                                                  ),
                                                  Text(
                                                    ' ${snapshot.data[index]['start_date']}',
                                                    // style: heading1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Valid To:',
                                                    // style: heading1,
                                                  ),
                                                  Text(
                                                    '${snapshot.data[index]['end_date']}',
                                                    // style: heading1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
          }),
    );
  }
}
