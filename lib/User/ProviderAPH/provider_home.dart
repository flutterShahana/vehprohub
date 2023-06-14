import 'package:flutter/material.dart';

class HomeProvider extends StatefulWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  State<HomeProvider> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title:Text("HOME") ,
      ),
    );
  }
}
