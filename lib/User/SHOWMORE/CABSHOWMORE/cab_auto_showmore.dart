import 'package:flutter/material.dart';

import 'BOOKNOW/cab_booknow.dart';

class CabAutoShowmore extends StatefulWidget {
  const CabAutoShowmore({Key? key}) : super(key: key);

  @override
  State<CabAutoShowmore> createState() => _CabAutoShowmoreState();
}

class _CabAutoShowmoreState extends State<CabAutoShowmore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("AUTORIKSHA BOOKING"),
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
                          const Text("MINI AUTO",style: TextStyle(
                            backgroundColor: Colors.yellow,

                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          Text("2-3 Seater"),
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
                          const Text("AUTO",style: TextStyle(
                            backgroundColor: Colors.yellow,

                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          Text("5-6 Seater"),
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

                          const Text("CAR AUTO",style: TextStyle(
                            backgroundColor: Colors.yellow,
                            fontSize: 20,
                            fontWeight:FontWeight.w500,
                          ),),
                          Text("3-4 Seater"),
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
