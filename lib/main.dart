import 'package:autoprohub/FIRSTLOG/loginpage.dart';
import 'package:autoprohub/FIRSTLOG/mapmapmapmap.dart';
import 'package:autoprohub/FIRSTLOG/otp_page.dart';
import 'package:autoprohub/User/hamber.dart';
import 'package:flutter/material.dart';

import 'FIRSTLOG/resetpasswordpg.dart';

void main(){
  print("hello..nj");
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_pg(),

      // home: ReviewRatingFeedbackPage(),


    );
  }
}
