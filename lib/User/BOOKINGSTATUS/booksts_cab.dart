import 'package:autoprohub/User/BOOKINGSTATUS/cab_cancelled_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/cab_completed_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/cab_unsuccesful_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/cab_upcomingsts.dart';
import 'package:flutter/material.dart';

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

                  Tab(text: "Upcoming"),
                  Tab(text: "Cancelled"),
                  Tab(text: "Completed"),
                  Tab(text: "Unsuccessful"),
                ],
                isScrollable: true,
              ) ,
            ),
            const Expanded(
              child:
              TabBarView(
                children: [
                  CabUpcomingSts(),
                  CabCancelledSts(),
                  CabCompletedSts(),
                  CabUnsuccessfulsts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
