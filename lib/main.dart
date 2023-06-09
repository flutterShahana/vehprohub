// import 'package:autoprohub/User/cabservices.dart';
// import 'package:autoprohub/User/cabservices.dart';
import 'package:autoprohub/User/accessoriesservices.dart';
import 'package:autoprohub/User/BOOKINGSTATUS/bookingsts.dart';
import 'package:autoprohub/User/rentalservices.dart';
import 'package:autoprohub/User/workshopservices.dart';
import 'package:autoprohub/User/hamber.dart';
import 'package:flutter/material.dart';

void main(){

  print("helooo..nj");
  runApp(myapp());

}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Accessoriesservices(),

      home: Hamber(),


    );
  }
}
