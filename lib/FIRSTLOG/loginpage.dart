import 'package:autoprohub/FIRSTLOG/acctcreateusr.dart';
import 'package:autoprohub/FIRSTLOG/forgotpassword.dart';
import 'package:flutter/material.dart';

import 'logusrspin.dart';

class Login_pg extends StatefulWidget {
  const Login_pg({Key? key}) : super(key: key);

  @override
  State<Login_pg> createState() => _Login_pgState();
}

class _Login_pgState extends State<Login_pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),

              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Pass_Forgot()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white38,
                    primary: Colors.blueGrey, // Set the text color to red
                  ),
                  child: const Text('Forgot your password ?',
                  textAlign: TextAlign.center,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserServiceProvider()));
                    },
                    child: const Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),

              const SizedBox(height: 15.0),

              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    const Text("Don't have an account yet? / ",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountcreateUser()));

                      },
                      child: const Text(
                        "Register"
                      ),
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
