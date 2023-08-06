import 'dart:convert';

import 'package:autoprohub/Auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../CONNECTION/connect.dart';

class AccountcreateUser extends StatefulWidget {
  AccountcreateUser({Key? key, required this.userType}) : super(key: key);
  var userType;
  @override
  State<AccountcreateUser> createState() => _AccountcreateUserState();
}

class _AccountcreateUserState extends State<AccountcreateUser> {
  var uname = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();
  var type = TextEditingController();
  var cpass = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;

  Future<void> Register() async {
    var data = {
      "uname": uname.text,
      'email': email.text,
      "type": widget.userType,
      "phone": phone.text,
      "pass": pass.text,
    };
    print("inside send data 1");
    var response = await post(Uri.parse('${Con.url}register.php'), body: data);
    print(response.body);
    print(response.statusCode);
    print("inside send data");
    if (jsonDecode(response.body)['result'] == 'success') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registered....')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to register !!....')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/fwstudio.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hey there!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Create an Account ',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.emoji_transportation,
                      size: 100.0,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name required';
                          }
                        },
                        controller: uname,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.mail),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email required';
                            }
                            String emailPattern =
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Basic email regex pattern
                            RegExp regExp = RegExp(emailPattern);
                            if (!regExp.hasMatch(value)) {
                              return 'Invalid email address';
                            }

                            return null;
                          }),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        controller: phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Phone number should be 10 digits.';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                          controller: pass,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: ' Password',
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
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Password should be at least 6 characters.';
                            }
                          }),
                    ),
                    const SizedBox(height: 18.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        controller: cpass,
                        obscureText: !_passwordVisible2,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible2 = !_passwordVisible2;
                              });
                            },
                            child: Icon(
                              _passwordVisible2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password required';
                          }
                        },
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
                            if (_formKey.currentState!.validate()) {
                              if (pass.text == cpass.text) {
                                setState(() {
                                  Register();
                                  print('ready to add fields');
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Password mismatch found....')));
                              }
                            }
                            // else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //           content:
                            //               Text('All fields required !!!....')));
                            // }
                          },
                          child: const Text(
                            'Register',
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
                            "Already have an account yet? / ",
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white38,
                            ),
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
