import 'package:autoprohub/PROVIDER/Services/Cab/addCabDetails.dart';
import 'package:autoprohub/PROVIDER/Services/Cab/viewCabs.dart';
import 'package:flutter/material.dart';

class Cabs extends StatefulWidget {
  const Cabs({Key? key}) : super(key: key);

  @override
  State<Cabs> createState() => _CabsState();
}

class _CabsState extends State<Cabs> {
  // List cabList=['Car','Auto','Goods','Traveller'];
  void nav(String type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewCabs(
                  type: type,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/kamshotthat.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Car');
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                            .withOpacity(0.3), // Change the button color here
                      ),
                      child: const Text(
                        'Car',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Auto');

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.3),
                      ),
                      child: const Text(
                        'Auto',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Goods');

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.withOpacity(0.3),
                      ),
                      child: const Text(
                        'Goods',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: 80.0,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Traveller');

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.3),
                      ),
                      child: const Text(
                        'Traveller',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
