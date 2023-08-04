import 'package:autoprohub/PROVIDER/Services/Accessories/addAccessoriesDetails.dart';
import 'package:autoprohub/PROVIDER/Services/Accessories/viewAccessories.dart';
import 'package:autoprohub/PROVIDER/Services/Rent/addRentDetails.dart';
import 'package:flutter/material.dart';

class Accessories extends StatefulWidget {
  const Accessories({Key? key}) : super(key: key);

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  void nav(String type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewAccessories(
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
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Car');
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange
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
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        nav('Bike');

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.3),
                      ),
                      child: const Text(
                        'Bike',
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
