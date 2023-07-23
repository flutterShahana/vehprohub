import 'package:autoprohub/PROVIDER/Bookings/Accessories/provider_accessory_completed_sts.dart';
import 'package:autoprohub/PROVIDER/Bookings/Accessories/provider_accessory_request_sts.dart';
import 'package:autoprohub/PROVIDER/Bookings/Accessories/provider_accessory_upcoming.dart';
import 'package:autoprohub/User/AccBookingStatus/accessory_request_sts.dart';
import 'package:autoprohub/User/AccBookingStatus/accesory_completed_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/accessory_unsuccesful_sts.dart';
import 'package:autoprohub/User/AccBookingStatus/accessory_upcoming.dart';
import 'package:flutter/material.dart';

class ProviderBookStatusAccesories extends StatefulWidget {
  const ProviderBookStatusAccesories({Key? key}) : super(key: key);

  @override
  State<ProviderBookStatusAccesories> createState() =>
      _ProviderBookStatusAccesoriesState();
}

class _ProviderBookStatusAccesoriesState
    extends State<ProviderBookStatusAccesories> {
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
                  ProviderAccessoryUpcomingSts(),
                  ProviderAccessoryRequestSts(),
                  ProviderAccessoryCompletedSts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
