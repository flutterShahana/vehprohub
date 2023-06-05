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

      home: Hamber(),


    );
  }
}
