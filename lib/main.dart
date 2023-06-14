import 'package:flutter/material.dart';
import 'FIRSTLOG/logusrspin.dart';
import 'User/ProviderAPH/provider_drawer_pg_nav.dart';


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
      home: ProvderDrawerPg(),

      // home: ReviewRatingFeedbackPage(),


    );
  }
}
