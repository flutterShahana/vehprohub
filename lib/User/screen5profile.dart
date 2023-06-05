import 'package:flutter/material.dart';

class Screenprofile extends StatefulWidget {
  const Screenprofile({Key? key}) : super(key: key);

  @override
  State<Screenprofile> createState() => _ScreenprofileState();
}

class _ScreenprofileState extends State<Screenprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Profile'),

      ),


    );
  }
}
