import 'package:autoprohub/User/BOOKINGSTATUS/bookingsts_workshop.dart';
import 'package:autoprohub/User/AccBookingStatus/booksts_accessories.dart';
import 'package:autoprohub/User/RentalBookingStatus/booksts_rentalveh.dart';
import 'package:autoprohub/User/CabBookingStatus/booksts_cab.dart';
import 'package:flutter/material.dart';

import 'Accessories/pro_acc_bookings.dart';
import 'Cab/pro_cab_bookings.dart';
import 'Rentals/pro_rental_bookings.dart';

class ProviderBookSts extends StatefulWidget {
  const ProviderBookSts({Key? key}) : super(key: key);

  @override
  State<ProviderBookSts> createState() => _ProviderBookStsState();
}

class _ProviderBookStsState extends State<ProviderBookSts> {
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
                        builder: (BuildContext context) =>
                            const ProviderBookStsCab(),
                      );
                    },
                    child: const Text(
                      'Cab Vehicle Bookings',
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
                            const ProviderBookStatusRental(),
                      );
                    },
                    child: const Text(
                      'Rental Vehicle Bookings',
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
                            const ProviderBookStatusAccesories(),
                      );
                    },
                    child: const Text(
                      'Accessories Bookings',
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
                      'Workshop Bookings',
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
