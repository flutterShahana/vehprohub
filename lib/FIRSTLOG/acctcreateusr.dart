import 'package:autoprohub/FIRSTLOG/loginpage.dart';
import 'package:flutter/material.dart';

class AccountcreateUser extends StatefulWidget {
  const AccountcreateUser({Key? key}) : super(key: key);

  @override
  State<AccountcreateUser> createState() => _AccountcreateUserState();
}

class _AccountcreateUserState extends State<AccountcreateUser> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fwstudio.jpg"),
            fit: BoxFit.fill,
          ),
        ),
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
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: ' Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
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
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
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
                  const Text("Already have an account yet? / ",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login_pg()));

                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white38,
                      primary: Colors.black,
                    ),
                    child: const Text(
                        "Login"
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
