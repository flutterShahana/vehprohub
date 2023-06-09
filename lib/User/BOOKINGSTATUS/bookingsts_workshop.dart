
import 'package:autoprohub/User/BOOKINGSTATUS/workshop_cancelledsts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/workshop_completed_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/workshop_unsuccessful_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/workshop_upcoming.dart';
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
        body:Column(
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
              child:
              TabBar(
                indicator: BoxDecoration(
                  color: Colors.blue[400],
                  // borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [

                  Tab(text: "Upcoming.W"),
                  Tab(text: "Cancelled.W"),
                  Tab(text: "Completed.W"),
                  Tab(text: "Unsuccessful.W"),
                ],
                isScrollable: true,
              ) ,
            ),
            const Expanded(
              child:
              TabBarView(
                children: [
                  WorkshopUpcomingsts(),
                  WorkshopCancelledsts(),
                  WorkshopCompletedsts(),
                  WorshopUnsuccessfulsts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
