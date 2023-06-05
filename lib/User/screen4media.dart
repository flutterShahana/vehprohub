import 'package:flutter/material.dart';
class Screenmedia extends StatefulWidget {
  const Screenmedia({Key? key}) : super(key: key);

  @override
  State<Screenmedia> createState() => _ScreenmediaState();
}

class _ScreenmediaState extends State<Screenmedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDIA'),

      ),

    );
  }
}
