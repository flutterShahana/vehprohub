import 'package:autoprohub/User/RentalBookingStatus/rentalrequeststs.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalcompletedsts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/rentalunsuccesfulsts.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalupcomingsts.dart';
import 'package:flutter/material.dart';

class BookStatusRental extends StatefulWidget {
  const BookStatusRental({Key? key}) : super(key: key);

  @override
  State<BookStatusRental> createState() => _BookStatusRentalState();
}

class _BookStatusRentalState extends State<BookStatusRental> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //
        // appBar: AppBar(
        //
        //   title: Text('Services'),
        //   // bottom:
        //

        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 45,
              // // width: 300,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                // borderRadius: BorderRadius(),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.blue[400],
                  // borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "Requested"),
                  Tab(text: "Completed"),
                ],
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RentalUpcomingSts(),
                  RentalRequestSts(),
                  RentalCompletedSts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
