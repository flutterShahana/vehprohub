import 'package:autoprohub/PROVIDER/Services/Rent/addRentDetails.dart';
import 'package:autoprohub/PROVIDER/Services/Rent/viewRentals.dart';
import 'package:flutter/material.dart';

class Rentals extends StatefulWidget {
  const Rentals({Key? key}) : super(key: key);

  @override
  State<Rentals> createState() => _RentalsState();
}

class _RentalsState extends State<Rentals> {
  void nav(String type){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRentals(type: type,)));
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
                      nav('Car');
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change the button color here
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
                      nav('Bike');

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));

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
                SizedBox(
                  height: 30.0,
                  child: ElevatedButton(
                    onPressed: () {
                      nav('Luxury Car');
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Luxury Car',
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
                      nav('Luxury Bike');
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Luxury Bike',
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
