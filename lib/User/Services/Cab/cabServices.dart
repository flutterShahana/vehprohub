import 'dart:convert';

import 'package:autoprohub/User/Services/Cab/showAllCabs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../../CONNECTION/connect.dart';
import '../../Ratings/viewRating.dart';

class Cabservices extends StatefulWidget {
  const Cabservices({Key? key}) : super(key: key);

  @override
  State<Cabservices> createState() => _CabservicesState();
}

class _CabservicesState extends State<Cabservices> {
  double _rating = 0;

  var car_flag = 0;
  var auto_flag = 0;
  var goods_flag = 0;
  var traveller_flag = 0;
  var flag;
  @override
  void initState() {
    super.initState();

    Veh();
    _refresh();
  }

  void Veh() {
    getData('car');
    getData('auto');
    getData('traveller');
    getData('goods');
    setState(() {});
  }

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  Future<dynamic> getData(String vehType) async {
    var data = {'vehType': vehType};
    var response =
        await post(Uri.parse('${Con.url}USER/userViewCabs.php'), body: data);
    print('*************CAB SERVICES****************');
    print(response.body);
    print('**********************************');

    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
    switch (vehType) {
      case 'car':
        car_flag = flag;
        break;
      case 'auto':
        auto_flag = flag;
        break;
      case 'goods':
        goods_flag = flag;
        break;
      case 'traveller':
        traveller_flag = flag;
        break;
    }
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewRatings(service_type: 'Cab')));
        },
        label: Text('Feedback'),
        // icon: Icon(Icons.add)
      ),
      backgroundColor: const Color(0xffece4e4),
      appBar: AppBar(
        title: const Text("Cab Services"),
        backgroundColor: Colors.purple[200],
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabCarShowmore()));
              },
              icon: const Icon(Icons.filter_list_alt))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      SearchBarAnimation(
                        textEditingController: TextEditingController(),
                        isOriginalAnimation: false,
                        enableKeyboardFocus: true,
                        buttonBorderColour: Colors.black45,
                        buttonWidget: const Icon(Icons.search),
                        onFieldSubmitted: (String value) {
                          debugPrint('onFieldSubmitted value $value');
                        },
                        trailingWidget: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                        secondaryButtonWidget: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 150,
                        // width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          // image: AssetImage("images/cabtop.jpg"),
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1490650404312-a2175773bbf5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGF4aXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Container(
                        height: 30,
                        width: 310,
                        color: Colors.red.shade100,
                        child: const Text(
                          "VEHICLE CAB SERVICES",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Vehicle Types",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: car_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text(
                          "Car",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllCabs(
                                        vehType: 'car',
                                      )));
                        },
                        child: const Text('Show more'),
                      ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: car_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                  child: Card(
                    color: const Color(0xfff3f0f0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180,
                          child: FutureBuilder(
                              future: getData('car'),
                              builder: (context, snapshot) {
                                if (snapshot.hasError)
                                  print('Error:${snapshot.error}');
                                print(
                                    'Inside cab view(checking hasData): ${snapshot.hasData}');
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text('No Data..'),
                                  );
                                }

                                return car_flag == 0
                                    ? const Center(
                                        child: Text('Nothing to show'))
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.symmetric(),
                                            child: Card(
                                              elevation: 10,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 140,
                                                    height: 80,
                                                    // color: Colors.yellow[200],
                                                    // color: Colors.purple[100],
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            // height:80,
                                                            width: 100,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Text(
                                                                    '${snapshot.data[index]['name']}'),
                                                                (snapshot.data[index]
                                                                            [
                                                                            'person'] ==
                                                                        1)
                                                                    ? Text(
                                                                        'Ideal for ${snapshot.data[index]['person']} person')
                                                                    : Text(
                                                                        'Ideal for ${snapshot.data[index]['person']} persons'),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Container(
                                                    height: 89,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            '${Con.url}/cabs/${snapshot.data[index]['image']}'),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: auto_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "AutoRikshaw",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllCabs(
                                        vehType: 'auto',
                                      )));
                        },
                        child: const Text('Show more'),
                      ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: auto_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                  child: Card(
                    color: const Color(0xfff3f0f0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: auto_flag == 1 ? true : false,
                          child: SizedBox(
                            height: 180,
                            child: FutureBuilder(
                                future: getData('auto'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError)
                                    print('Error:${snapshot.error}');
                                  print(
                                      'Inside cab view(checking hasData): ${snapshot.hasData}');
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text('No Data..'),
                                    );
                                  }

                                  return auto_flag == 0
                                      ? const Center(
                                          child: Text('Nothing to show'))
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(),
                                              child: Card(
                                                elevation: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 140,
                                                      height: 80,
                                                      //  color:
                                                      //            Colors.yellow[200],
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                              // height:80,
                                                              width: 100,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                      '${snapshot.data[index]['name']}'),
                                                                  (snapshot.data[index]
                                                                              [
                                                                              'person'] ==
                                                                          1)
                                                                      ? Text(
                                                                          'Ideal for ${snapshot.data[index]['person']} person')
                                                                      : Text(
                                                                          'Ideal for ${snapshot.data[index]['person']} persons'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Container(
                                                      height: 89,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${Con.url}/cabs/${snapshot.data[index]['image']}'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: traveller_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Traveller",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllCabs(
                                        vehType: 'traveller',
                                      )));
                        },
                        child: const Text('Show more'),
                      ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: traveller_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                  child: Card(
                    color: const Color(0xfff3f0f0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: traveller_flag == 1 ? true : false,
                          child: SizedBox(
                            height: 180,
                            child: FutureBuilder(
                                future: getData('traveller'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError)
                                    print('Error:${snapshot.error}');
                                  print(
                                      'Inside cab view(checking hasData): ${snapshot.hasData}');
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text('No Data..'),
                                    );
                                  }

                                  return traveller_flag == 0
                                      ? const Center(
                                          child: Text('Nothing to show'))
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(),
                                              child: Card(
                                                elevation: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 140,
                                                      height: 80,
                                                      //  color:
                                                      //      Colors.yellow[200],
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                              // height:80,
                                                              width: 100,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                      '${snapshot.data[index]['name']}'),
                                                                  (snapshot.data[index]
                                                                              [
                                                                              'person'] ==
                                                                          1)
                                                                      ? Text(
                                                                          'Ideal for ${snapshot.data[index]['person']} person')
                                                                      : Text(
                                                                          'Ideal for ${snapshot.data[index]['person']} persons'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Container(
                                                      height: 89,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${Con.url}/cabs/${snapshot.data[index]['image']}'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: goods_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          "Goods",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllCabs(
                                        vehType: 'goods',
                                      )));
                        },
                        child: const Text('Show more'),
                      ),

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 18,
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: goods_flag == 1 ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 0.0, bottom: 0.0),
                  child: Card(
                    color: const Color(0xfff3f0f0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: goods_flag == 1 ? true : false,
                          child: SizedBox(
                            height: 180,
                            child: FutureBuilder(
                                future: getData('goods'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError)
                                    print('Error:${snapshot.error}');
                                  print(
                                      'Inside cab view(checking hasData): ${snapshot.hasData}');
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text('No Data..'),
                                    );
                                  }

                                  return goods_flag == 0
                                      ? const Center(
                                          child: Text('Nothing to show'))
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(),
                                              child: Card(
                                                elevation: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 140,
                                                      height: 80,
                                                      //  color:
                                                      //    Colors.yellow[200],
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                              // height:80,
                                                              width: 100,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                      '${snapshot.data[index]['name']}'),
                                                                  Text(
                                                                      'Size: ${snapshot.data[index]['size']} ')
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Container(
                                                      height: 89,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${Con.url}/cabs/${snapshot.data[index]['image']}'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
