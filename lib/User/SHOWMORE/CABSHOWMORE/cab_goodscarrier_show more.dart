import 'package:flutter/material.dart';

import 'BOOKNOW/cab_booknow.dart';

class CabGoodscarrierShowmore extends StatefulWidget {
  const CabGoodscarrierShowmore({Key? key}) : super(key: key);

  @override
  State<CabGoodscarrierShowmore> createState() => _CabGoodscarrierShowmoreState();
}

class _CabGoodscarrierShowmoreState extends State<CabGoodscarrierShowmore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("GOODS CARRIER BOOKING"),
      ),

      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 4 : 2,
              childAspectRatio: 2 / 3,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          const Text("MINI GOODS CARRIER",style: TextStyle(
                            backgroundColor: Colors.yellow,

                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          // Text("3-4 Seater"),
                          Container(

                            height: 120,
                            width: double.infinity,
                            child: Image.asset(
                              "images/carmini.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabBooknow()));
                              },
                              child: const Text('Click to book'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          const Text("GOODS CARRIER",style: TextStyle(
                            backgroundColor: Colors.yellow,

                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          // Text("7-8 Seater"),
                          Container(

                            height: 120,
                            width: double.infinity,
                            child: Image.asset(
                              "images/carseven.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabBooknow()));
                              },
                              child: const Text('Click to book'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      child: Column(
                        children: [

                          const Text("BIG GOODS CARRIER",style: TextStyle(
                            backgroundColor: Colors.yellow,

                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          Text("9-11 Seater"),

                          Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.asset(
                              "images/seatnine.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CabBooknow()));
                              },
                              child: const Text('Click to book'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
