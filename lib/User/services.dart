import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:autoprohub/User/workshopservices.dart';
import 'package:flutter/material.dart';

import 'cabservices.dart';
// import 'package:myapp1/pjt1/accessoriesservices.dart';
// import 'package:myapp1/pjt1/cabservices.dart';
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
        body:Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [

              Container(
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  // borderRadius: BorderRadius(),
                ),
                child:
                TabBar(
                  indicator: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [

                    Tab(text: "Cab",),
                    Tab(text: "Rent",),
                    Tab(text: "Workshop",),
                    Tab(text: "Accessory",)

                  ],
                  isScrollable: true,

                ) ,
              ),
              const Expanded(
                  child:
                  TabBarView(
                    children: [

                      Cabservices(),
                      Rentalservices(),
                      WorkshopServices(),
                      Accessoriesservices(),



                    ],
                  ),
              ),
            ],
          ),
       ),


      ),
    );
  }
}







