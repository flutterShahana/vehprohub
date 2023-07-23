import 'package:autoprohub/PROVIDER/Bookings/Cab/provider_cab_accepted.dart';
import 'package:autoprohub/PROVIDER/Bookings/Cab/provider_cab_completed.dart';
import 'package:autoprohub/PROVIDER/Bookings/Cab/provider_cab_requests.dart';
import 'package:autoprohub/PROVIDER/Bookings/Cab/provider_cab_upcomingSts.dart';
import 'package:autoprohub/User/CabBookingStatus/cab_request_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/cab_unsuccesful_sts.dart';
import 'package:autoprohub/User/CabBookingStatus/cab_upcomingsts.dart';
import 'package:flutter/material.dart';

import '../../../User/CabBookingStatus/cab_completed_sts.dart';

class ProviderBookStsCab extends StatefulWidget {
  const ProviderBookStsCab({Key? key}) : super(key: key);

  @override
  State<ProviderBookStsCab> createState() => _ProviderBookStsCabState();
}

class _ProviderBookStsCabState extends State<ProviderBookStsCab> {
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
                  Tab(text: "\t\t\t\t\tUpcoming\t\t\t\t\t"),
                  Tab(text: "\t\t\t\t\tRequests\t\t\t\t\t"),
                  Tab(text: "\t\t\t\t\tCompleted\t\t\t\t\t"),
                  //Tab(text: "Unsuccessful"),
                ],
                isScrollable: true,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ProviderCabUpcomingSts(),
                  ProviderCabRequestSts(),
                  ProviderCabCompletedSts(),
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
