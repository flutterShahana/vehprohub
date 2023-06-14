import 'package:flutter/material.dart';

class WorkshopShowmore extends StatefulWidget {
  const WorkshopShowmore({Key? key}) : super(key: key);

  @override
  State<WorkshopShowmore> createState() => _WorkshopShowmoreState();
}

class _WorkshopShowmoreState extends State<WorkshopShowmore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cabservices",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 4 : 2,
              childAspectRatio: 2 / 3, // Adjust this ratio as needed
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("CAR"
                              ,style: TextStyle(
                                backgroundColor: Colors.yellow,
                                fontSize: 20,
                                fontWeight:FontWeight.w500,
                              ),),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Image.asset(
                            "images/img2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add button action here
                          },
                          child: const Text('Click to book'),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        const Text("BIKE",style: TextStyle(
                          backgroundColor: Colors.yellow,

                          fontSize: 20,
                          fontWeight:FontWeight.w500,
                        ),),
                        Container(

                          height: 120,
                          width: double.infinity,
                          child: Image.asset(
                            "images/img2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add button action here
                          },
                          child: const Text('Click to book'),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        const Text("HEAVY VEHICLES",style: TextStyle(
                          backgroundColor: Colors.yellow,

                          fontSize: 20,
                          fontWeight:FontWeight.w500,
                        ),),
                        Container(
                          height: 120,
                          width: double.infinity,
                          child: Image.asset(
                            "images/img2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add button action here
                          },
                          child: const Text('Click to book'),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        const Text("EMERGENCY SERVICES ",style: TextStyle(
                          backgroundColor: Colors.yellow,

                          fontSize: 20,
                          fontWeight:FontWeight.w500,
                        ),),
                        Container(
                          height: 120,
                          width: double.infinity,
                          child: Image.asset(
                            "images/img2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add button action here
                          },
                          child: const Text('Click to book'),
                        ),
                      ],
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
