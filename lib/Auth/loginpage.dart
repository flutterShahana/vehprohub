import 'dart:convert';

import 'package:autoprohub/Auth/acctcreateusr.dart';
import 'package:autoprohub/FIRSTLOG/forgotpassword.dart';
import 'package:autoprohub/PROVIDER/Home_Pro/pro_bottomNavBar.dart';
import 'package:autoprohub/User/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CONNECTION/connect.dart';
import '../SP/sp.dart';
import '../User/Home/bottomNavbarPage.dart';
import 'logusrspin.dart';

class Login_pg extends StatefulWidget {
  Login_pg({Key? key, required this.usertype}) : super(key: key);
  var usertype;
  @override
  State<Login_pg> createState() => _Login_pgState();
}

class _Login_pgState extends State<Login_pg> {
  var email = TextEditingController();
  var pswd = TextEditingController();
  var user;
  var flag = 0;
  var lati, longi, location, place, loginID;
  bool _passwordVisible = false;
  Future<dynamic> login() async {
    print('inside login function');
    var data = {
      "email": email.text,
      "pass": pswd.text,
      'type': widget.usertype
    };
    print('Sending Data : $data');
    var response = await post(Uri.parse('${Con.url}login.php'), body: data);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['message'] ==
          'User Successfully Logged In') {
        var approvalstatus = jsonDecode(response.body)['approval_status'];
        switch (approvalstatus) {
          case 'approved':
            flag = 1;
            break;
          case 'rejected':
            flag = 2;
            break;
          case 'requested':
            flag = 3;
            break;
        }
        //  flag = 1;
        print('flag value:$flag');
        loginID = jsonDecode(response.body)['login_id'];

        print(loginID);
        print('loginID inside sign in success :$loginID');

        // saveData(loginID);

        //myLocation();

        if (flag == 1) {
          SharedPreferencesHelper.saveData(loginID).then((_) {
            print('sp saved...');
          }).catchError((error) {
            print('sp saving failed..');
            // Error occurred while saving the login ID
            // Handle the error as needed
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Logging In ...')));
          if (widget.usertype == 'user') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBarPage()));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProviderBottomNavBarPage()));
          }
        } else if (flag == 2) {
          setState(() {});
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login denied..')));
        } else if (flag == 3) {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Waiting for registration approval...')));
        } else {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Invalid Credentials !! Login Failed...')));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Login()));
        }
      } else {
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Credentials !! Login Failed')));
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => Login(
        //
        //     )));
      }
      return jsonDecode(response.body);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  // Future<dynamic> myLocation() async {
  //   var data = {"login_id": login_id, 'type': widget.usertype};
  //   var response =
  //       await post(Uri.parse('${Con.url}myLocation.php'), body: data);
  //   print(response.body);
  //   print(response.statusCode);
  //
  //   if (response.statusCode == 200) {
  //     if (jsonDecode(response.body)['result'] == 'success') {
  //       lati = jsonDecode(response.body)['lati'];
  //       longi = jsonDecode(response.body)['longi'];
  //       location = jsonDecode(response.body)['location'];
  //       place = jsonDecode(response.body)['place'];
  //       print(login_id);
  //       print(lati);
  //       print(longi);
  //       print(location);
  //       print(place);
  //
  //       saveData(lati, longi, location, place, login_id);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/nnn.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_transportation,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.mail),
                      suffixIcon: Icon(Icons.alternate_email)),
                ),
              ),
              const SizedBox(height: 18.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: pswd,
                  obscureText: !_passwordVisible,
                  // obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pass_Forgot()));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                    backgroundColor:
                        Colors.white38, // Set the text color to red
                  ),
                  child: const Text(
                    'Forgot your password ?',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (email.text != "" && pswd.text != "") {
                        print('inside login button');
                        setState(() {
                          login();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('All fields required ...')));
                      }
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeProvider()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    const Text(
                      "Don't have an account yet? / ",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountcreateUser(
                                      userType: widget.usertype,
                                    )));
                      },
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
