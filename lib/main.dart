import 'package:autoprohub/User/hamber.dart';
import 'package:autoprohub/User/rev_rat_feedbk_pg.dart';
import 'package:flutter/material.dart';

import 'User/accessoriesservices.dart';

void main(){

  print("hello..nj");
  runApp(const myapp());

}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Accessoriesservices(),

      // home: ReviewRatingFeedbackPage(),


    );
  }
}
