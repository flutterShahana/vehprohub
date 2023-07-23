import 'package:autoprohub/User/BOOKINGSTATUS/bookingsts_workshop.dart';
import 'package:autoprohub/User/AccBookingStatus/booksts_accessories.dart';
import 'package:autoprohub/User/RentalBookingStatus/booksts_rentalveh.dart';
import 'package:autoprohub/User/CabBookingStatus/booksts_cab.dart';
import 'package:flutter/material.dart';

class BookSts extends StatefulWidget {
  const BookSts({Key? key}) : super(key: key);

  @override
  State<BookSts> createState() => _BookStsState();
}

class _BookStsState extends State<BookSts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Status"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/free.jpg"),
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
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => const BookStsCab(),
                      );
                    },
                    child: const Text(
                      'Cab Vehicle Booking',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            const BookStatusRental(),
                      );
                    },
                    child: const Text(
                      'Rental Vehicle Booking',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            const BookStatusAccesories(),
                      );
                    },
                    child: const Text(
                      'Accessories Booking',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            const BookStatusWorkshop(),
                      );
                    },
                    child: const Text(
                      'Workshop Booking',
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
