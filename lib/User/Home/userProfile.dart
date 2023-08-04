import 'dart:convert';

import 'package:autoprohub/PROVIDER/Home_Pro/addDP.dart';
import 'package:autoprohub/PROVIDER/Home_Pro/pro_editProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var lid, flag;
  var name, email, phone, password, pic;

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
            name = jsonDecode(response.body)[0]['username'],
            email = jsonDecode(response.body)[0]['email'],
            phone = jsonDecode(response.body)[0]['phone'],
            password = jsonDecode(response.body)[0]['password'],
            pic = jsonDecode(response.body)[0]['image'],
            print('********************'),
            print(name),
            print(email),
            print(phone),
            print(password),
            print(pic),
            print('**************')
          }
        : flag = 0;

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
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            children: [
              const SizedBox(height: 40),
              pic == ''
                  ? CircleAvatar(
                      backgroundColor: Colors.purpleAccent.withOpacity(0.5),
                      radius: 70,
                      child: IconButton(
                        icon: Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Colors.white,
                          size: 45,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddDP()));
                        },
                      ),
                      //   backgroundImage: AssetImage('assets/images/user.JPG'),
                    )
                  : Center(
                      child: ClipOval(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDP()));
                          },
                          child: Container(
                            height: 180,
                            width: 180,
                            child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage('${Con.url}/dp/$pic')),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              itemProfile('Name', '$name', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '$phone', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile('Email', '$email', CupertinoIcons.mail),
              const SizedBox(height: 10),
              itemProfile('Password', '$password', CupertinoIcons.lock),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditProfile(lid: widget.lid)));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple),
                    child: const Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
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
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
