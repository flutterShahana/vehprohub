import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
      ),
      body:ListView(
          children: [
            Card(
              child:ListTile(
                title: Text("aaaa"),
                subtitle: Text("aaaaaaaaaaaaaaaaaaaaaa"),
                leading: Image.asset("images/img1.png"),

              ),
            ),

            Card(
              child:ListTile(
                title: Text("bbb"),
                subtitle: Text("aaaaaaaaaaaaaaaaaaaaaa"),
                leading: Image.asset("images/img2.png"),

              ),
            ),

            Card(
              child:ListTile(
                title: Text("ccc"),
                subtitle: Text("aaaaaaaaaaaaaaaaaaaaaa"),
                leading: Image.asset("images/yoshi.png"),

              ),
            ),


          ],
        ),

    );
  }
}
