import 'package:autoprohub/PROVIDER/Services/Accessories/addAccessoriesDetails.dart';
import 'package:autoprohub/PROVIDER/Services/Accessories/viewAccessories.dart';
import 'package:autoprohub/PROVIDER/Services/Rent/addRentDetails.dart';
import 'package:autoprohub/PROVIDER/Services/Workshop/addCarServices.dart';
import 'package:autoprohub/PROVIDER/Services/Workshop/viewWorkshop.dart';
import 'package:flutter/material.dart';

import 'addBikeService.dart';

class Workshop extends StatefulWidget {
  const Workshop({Key? key}) : super(key: key);

  @override
  State<Workshop> createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // nav('car');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewWorkshop(type: 'car')));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Change the button color here
                    ),
                    child: const Text(
                      'Car',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  child: ElevatedButton(
                    onPressed: () {
                      //  nav('bike');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewWorkshop(type: 'bike')));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Bike',
                      style: TextStyle(
                        fontSize: 18,
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
