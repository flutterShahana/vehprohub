import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/cabservices.dart';
import 'package:autoprohub/User/media.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:autoprohub/User/workshopservices.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.purpleAccent[200],
      ),

      body: Container(
          height: double.infinity ,
          width: MediaQuery.of(context).size.width,

          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 12),

                Padding(padding: const EdgeInsets.only(top:5.0),
                  child: Container(
                    // color: Colors.cyanAccent,
                    height:35,
                    width: MediaQuery.of(context).size.width,

                    child: const Text("   All in ONE Service here...",

                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.black,

                      ),
                    ),

                  ),
                ),

                Padding(padding: const EdgeInsets.only(top:5.0),
                  child: Container(
                    // color: Colors.cyanAccent,
                    height:40,
                    width: MediaQuery.of(context).size.width,

                    child: const Text("   Hi Neeraj...",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        color: Colors.black,

                      ),
                    ),

                  ),
                ),


                Padding(padding: const EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0,right: 10.0),

                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          // width: 100,
                          decoration: const BoxDecoration(

                              image: DecorationImage(image:AssetImage("images/yoshi.png"),
                                fit: BoxFit.fill,

                              )
                          ),
                        ),
                        Container(
                          height:30,
                          width:310 ,
                          color: Colors.red.shade100,
                          child: const Text("Offer Close : 30/JUNE/2023",
                            textAlign: TextAlign.center,

                            style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,

                            ),
                          ),

                        ),


                      ],
                    ),
                  ),

                ),


                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.purple[50], // Light purple color
                    child: Column(
                      children: [
                        const Text(
                          "Services",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Cabservices()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.local_taxi_outlined),
                                  Text("  Cab  "),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Rentalservices()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.car_rental),
                                  Text(" Rental "),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WorkshopServices()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.miscellaneous_services_rounded),
                                  Text("  wokshop  "),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Accessoriesservices()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.shopping_bag),
                                  Text("  Accessory  "),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add your onTap functionality here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Medias()),
                                );
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.perm_media_outlined),
                                  Text("Media"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 9.0,left:5.0,right: 5.0,bottom: 9.0,),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/img1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
