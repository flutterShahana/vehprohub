import 'dart:convert';

import 'package:autoprohub/User/Ratings/viewRating.dart';
import 'package:autoprohub/User/Services/Accessory/showAllAccessories.dart';
import 'package:autoprohub/User/Services/Cab/showAllCabs.dart';
import 'package:autoprohub/User/Services/Rent/showAllRentals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../../CONNECTION/connect.dart';

class AccessoriesServices extends StatefulWidget {
  const AccessoriesServices({Key? key}) : super(key: key);

  @override
  State<AccessoriesServices> createState() => _AccessoriesServicesState();
}

class _AccessoriesServicesState extends State<AccessoriesServices> {
  double _rating = 0;

  var car_flag = 0;
  var bike_flag = 0;
  var luxCar_flag = 0;
  var luxBike_flag = 0;
  var flag;
  @override
  void initState() {
    super.initState();
    Veh();
    _refresh();
  }

  void Veh() {
    getData('car');
    getData('bike');
    setState(() {});
  }

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future<dynamic> getData(String vehType) async {
    var data = {'vehType': vehType};
    var response = await post(
        Uri.parse('${Con.url}USER/userViewAccessories.php'),
        body: data);
    print('*************ACCESSORY SERVICES****************');
    print(response.body);
    print('**********************************');

    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;
    switch (vehType) {
      case 'Car':
        car_flag = flag;
        break;
      case 'Bike':
        bike_flag = flag;
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
                  builder: (context) =>
                      ViewRatings(service_type: 'Accessories')));
        },
        label: Text('Feedback'),
        // icon: Icon(Icons.add)
      ),
      backgroundColor: const Color(0xffece4e4),
      appBar: AppBar(
        title: const Text("Accessories Services"),
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
        child: RefreshIndicator(
          onRefresh: _refresh,
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
                            //image: AssetImage("images/cabtop.jpg"),
                            image: NetworkImage(
                                'https://di-uploads-pod3.dealerinspire.com/toyotaofclermont/uploads/2019/04/auto-parts-1024x683.jpg'),
                            fit: BoxFit.fill,
                          )),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.red.shade100,
                          child: const Text(
                            "VEHICLE ACCESSORIES SERVICES",
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
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10, right: 10),
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
                                    builder: (context) => ShowAllAccessories(
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
                                future: getData('Car'),
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
                                                      //    color: Colors.yellow[200],
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
                                                                      '₹ ${snapshot.data[index]['rate']}/unit ')
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
                                                              '${Con.url}/accessories/${snapshot.data[index]['image']}'),
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
                  visible: bike_flag == 1 ? true : false,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 10),
                          child: Text(
                            "Bike",
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
                                    builder: (context) => ShowAllAccessories(
                                          vehType: 'bike',
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
                  visible: bike_flag == 1 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 5.0, right: 0.0, bottom: 0.0),
                    child: Card(
                      color: const Color(0xfff3f0f0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: bike_flag == 1 ? true : false,
                            child: SizedBox(
                              height: 180,
                              child: FutureBuilder(
                                  future: getData('Bike'),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError)
                                      print('Error:${snapshot.error}');
                                    print(
                                        'Inside accessories bike view(checking hasData): ${snapshot.hasData}');
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: Text('No Data..'),
                                      );
                                    }

                                    return bike_flag == 0
                                        ? const Center(
                                            child: Text('Nothing to show'))
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(),
                                                child: Card(
                                                  elevation: 10,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 140,
                                                        height: 80,
                                                        // color:
                                                        //     Colors.yellow[200],
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          children: [
                                                            Flexible(
                                                              flex: 1,
                                                              fit:
                                                                  FlexFit.tight,
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
                                                                        '₹ ${snapshot.data[index]['rate']}/unit')
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
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                '${Con.url}/accessories/${snapshot.data[index]['image']}'),
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
      ),
    );
  }
}
