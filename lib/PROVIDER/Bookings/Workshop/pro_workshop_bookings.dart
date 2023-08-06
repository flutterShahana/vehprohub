import 'package:autoprohub/PROVIDER/Bookings/Rentals/provider_rental_completed.dart';
import 'package:autoprohub/PROVIDER/Bookings/Rentals/provider_rental_requests.dart';
import 'package:autoprohub/PROVIDER/Bookings/Rentals/provider_rental_upcomingSts.dart';
import 'package:autoprohub/PROVIDER/Bookings/Workshop/provide_workshop_completedSts.dart';
import 'package:autoprohub/PROVIDER/Bookings/Workshop/provide_workshop_requestedSts.dart';
import 'package:autoprohub/PROVIDER/Bookings/Workshop/provide_workshop_upcomingSts.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalrequeststs.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalcompletedsts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/rentalunsuccesfulsts.dart';
import 'package:autoprohub/User/RentalBookingStatus/rentalupcomingsts.dart';
import 'package:flutter/material.dart';

class ProviderBookStatusWorkshop extends StatefulWidget {
  const ProviderBookStatusWorkshop({Key? key}) : super(key: key);

  @override
  State<ProviderBookStatusWorkshop> createState() =>
      _ProviderBookStatusWorkshopState();
}

class _ProviderBookStatusWorkshopState
    extends State<ProviderBookStatusWorkshop> {
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
                ],
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProviderWorkshopUpcomingSts(),
                  ProviderWorkshopRequestedSts(),
                  ProviderWorkshopCompletedSts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
