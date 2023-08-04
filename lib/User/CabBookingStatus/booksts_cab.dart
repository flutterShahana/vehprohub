import 'package:autoprohub/User/CabBookingStatus/cab_request_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/cab_unsuccesful_sts.dart';
import 'package:autoprohub/User/CabBookingStatus/cab_upcomingsts.dart';
import 'package:flutter/material.dart';

import 'cab_completed_sts.dart';
import 'cab_request_cancelled.dart';

class BookStsCab extends StatefulWidget {
  const BookStsCab({Key? key}) : super(key: key);

  @override
  State<BookStsCab> createState() => _BookStsCabState();
}

class _BookStsCabState extends State<BookStsCab> {
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
              // height: 750,
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
                  //Tab(text: "Unsuccessful"),
                ],
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CabUpcomingSts(),
                  CabRequestSts(),
                  CabCompletedSts(),
                  CabRequestCancelled()
                  // CabUnsuccessfulsts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
