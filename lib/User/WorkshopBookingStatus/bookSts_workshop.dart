import 'package:autoprohub/User/RentalBookingStatus/rentalrequeststs.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalcompletedsts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/rentalunsuccesfulsts.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalupcomingsts.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/workshopCancelledsts.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/workshopRequeststs.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/workshopUpcomingsts.dart';
import 'package:autoprohub/User/WorkshopBookingStatus/workshopcompletedsts.dart';
import 'package:flutter/material.dart';

class BookStatusWorkshop extends StatefulWidget {
  const BookStatusWorkshop({Key? key}) : super(key: key);

  @override
  State<BookStatusWorkshop> createState() => _BookStatusWorkshopState();
}

class _BookStatusWorkshopState extends State<BookStatusWorkshop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                  Tab(text: "Cancelled"),
                ],
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  WorkshopUpcomingSts(),
                  WorkshopRequestSts(),
                  WorkshopCompletedSts(),
                  WorkshopCancelledSts()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
