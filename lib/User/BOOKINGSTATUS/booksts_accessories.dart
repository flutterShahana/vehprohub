import 'package:autoprohub/User/BOOKINGSTATUS/accesory_cancelled.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/accesory_completed_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/accessory_unsuccesful_sts.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/accessory_upcoming.dart';
import 'package:flutter/material.dart';

class BookStatusAccesories extends StatefulWidget {
  const BookStatusAccesories({Key? key}) : super(key: key);

  @override
  State<BookStatusAccesories> createState() => _BookStatusAccesoriesState();
}

class _BookStatusAccesoriesState extends State<BookStatusAccesories> {
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

                  Tab(text: "Upcoming.A"),
                  Tab(text: "Cancelled.A"),
                  Tab(text: "Completed.A"),
                  Tab(text: "Unsuccessful.A"),
                ],
                isScrollable: true,
              ) ,
            ),
            const Expanded(
              child:
              TabBarView(
                children: [
                  AccesoryUpcomingsts(),
                  AccesoryCancelledsts(),
                  AccesoryCompletedsts(),
                  AccesoryUnsuccesfulsts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
