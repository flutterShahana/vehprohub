import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/cabservices.dart';
import 'package:autoprohub/User/filterpage.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:autoprohub/User/review.dart';
import 'package:autoprohub/User/workshopservices.dart';
import 'package:flutter/material.dart';


class ServiceFull extends StatefulWidget {
  const ServiceFull({Key? key}) : super(key: key);

  @override
  State<ServiceFull> createState() => _ServiceFullState();
}

class _ServiceFullState extends State<ServiceFull> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FilterPage()),
              );
            },
            icon: const Icon(Icons.filter_list_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cabservices()),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/yoshi.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.blue.shade200,
                          child: const Text(
                            "Cab Services",
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
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Rentalservices()),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/yoshi.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.blue.shade200,
                          child: const Text(
                            "Vehicle Rental Services",
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
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkshopServices()),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/yoshi.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.blue.shade200,
                          child: const Text(
                            "Vehicle Workshop Services",
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
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Accessoriesservices()),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/yoshi.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 310,
                          color: Colors.blue.shade200,
                          child: const Text(
                            "Vehicle Accessory Services",
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
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: Card(
                  // color: Colors.cyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Feedback",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                                weight:20,

                            ),
                          ],


                        ),


                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Card(
                                elevation: 10,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 160,
                                      width: 300,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/img2.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Enter your Feedback here ...........",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 9.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Review()));

                      },
                      child: const Text("   Add Your Feedback   "),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),





    );
  }
}
