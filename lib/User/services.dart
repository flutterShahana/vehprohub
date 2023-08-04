import 'package:autoprohub/User/Services/Accessory/accessoriesService.dart';
import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:flutter/material.dart';

import 'Services/Cab/cabServices.dart';
import 'Services/Rent/rentalService.dart';
import 'Services/Workshop/workshopService.dart';
// import 'package:myapp1/pjt1/accessoriesservices.dart';
// import 'package:myapp1/pjt1/cabServices.dart';
// import 'package:myapp1/pjt1/rentalservices.dart';
// import 'package:myapp1/pjt1/workshopservices.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Services'),
          // bottom:
        ),
        body: Column(
          children: [
            Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                // borderRadius: BorderRadius(),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.green[300],
                  // borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "Cab",
                  ),
                  Tab(
                    text: "Rent",
                  ),
                  Tab(
                    text: "Workshop",
                  ),
                  Tab(
                    text: "Accessory",
                  )
                ],
                isScrollable: true,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Cabservices(),
                  RentalServices(),
                  WorkshopServices(),
                  AccessoriesServices(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
