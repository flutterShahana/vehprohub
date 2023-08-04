import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var lid, flag;
  // var name, email, phone, password;
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future<dynamic> getUserData() async {
    print(
        '------userprofile------inside getUserData fn of view user data by user----------');
    var data = {
      'user_id': widget.lid,
    };
    print(data);
    var response = await post(
        Uri.parse(
          '${Con.url}USER/userProfile.php',
        ),
        body: data);
    print(response.body);
    print(response.statusCode);
    print('----------------------------------');

    jsonDecode(response.body)[0]['result'] == 'success'
        ? {
            flag = 1,
            name.text = jsonDecode(response.body)[0]['username'],
            email.text = jsonDecode(response.body)[0]['email'],
            phone.text = jsonDecode(response.body)[0]['phone'],
            password.text = jsonDecode(response.body)[0]['password'],
            print('********************'),
            print(name.text),
            print(email.text),
            print(phone.text),
            print(password.text),
            print('**************')
          }
        : flag = 0;

    return jsonDecode(response.body);
  }

  Future<dynamic> updateProfile() async {
    print(
        '------userprofile------inside getUserData fn of view user data by user----------');
    var data = {
      'user_id': widget.lid,
      'name': name.text,
      'phone': phone.text,
      'email': email.text,
      'password': password.text
    };
    print(data);
    var response = await post(
        Uri.parse(
          '${Con.url}USER/updateProfile.php',
        ),
        body: data);
    print(response.body);
    print(response.statusCode);
    print('----------------------------------');

    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully..')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update...')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    }
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();

    getUserData();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  body: Container(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Text(
              'Edit Profile',
              style: TextStyle(
                  //  backgroundColor: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            const SizedBox(height: 40),
            itemProfile(name, 'Name', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile(phone, 'Phone', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(email, 'Email', CupertinoIcons.mail),
            const SizedBox(height: 10),
            itemProfile(password, 'Password', CupertinoIcons.lock),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    updateProfile();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple),
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(TextEditingController ctrl, String? lbl, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        //  title: Text(title),
        title: TextFormField(
          keyboardType: TextInputType.text,
          controller: ctrl,
          decoration: InputDecoration(
            label: Text('$lbl'),
            border: InputBorder.none,
          ),
        ),

        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
