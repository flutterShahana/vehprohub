import 'package:autoprohub/User/hamber.dart';
import 'package:flutter/material.dart';

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
      home: Hamber(),

      // home: ReviewRatingFeedbackPage(),


    );
  }
}
