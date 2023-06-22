// import 'package:autoprohub/FIRSTLOG/acctcreateusr.dart';
// import 'package:flutter/material.dart';
//
// class Pass_Forgot extends StatefulWidget {
//   const Pass_Forgot({Key? key}) : super(key: key);
//
//   @override
//   State<Pass_Forgot> createState() => _Pass_ForgotState();
// }
//
// class _Pass_ForgotState extends State<Pass_Forgot> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("images/pixab.jpg"),
//             fit: BoxFit.fill,
//           ),
//         ),
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Reset Password !',
//               style: TextStyle(
//                 fontSize: 32.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Forgot your password? \n That's okay,  \n it happens to \n everyone ! \n PLease provide your email to \n reset your password ",
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: Icon(Icons.mail_outline),
//                 ),
//               ),
//             ),
//             // const SizedBox(height: 18.0),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             //   child: TextFormField(
//             //     obscureText: true,
//             //     decoration: const InputDecoration(
//             //       labelText: 'Password',
//             //       filled: true,
//             //       fillColor: Colors.white,
//             //       prefixIcon: Icon(Icons.lock),
//             //     ),
//             //   ),
//             // ),
//
//             // const SizedBox(height: 10.0),
//             // TextButton(
//             //   onPressed: () {
//             //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
//             //   },
//             //   style: TextButton.styleFrom(
//             //     backgroundColor: Colors.white38,
//             //     primary: Colors.black,
//             //   ),
//             //   child: const Text(
//             //     'Forgot your password?',
//             //     textAlign: TextAlign.center,
//             //   ),
//             // ),
//
//             const SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 50.0,
//                 width: 200.0,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
//                   },
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             // const SizedBox(height: 15.0),
//             //
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 50.0),
//             //   child: Row(
//             //     children: [
//             //       const Text("Don't have an account yet? / ",
//             //       ),
//             //       TextButton(
//             //         onPressed: () {
//             //
//             //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountcreateUser()));
//             //
//             //
//             //         },
//             //         style: TextButton.styleFrom(
//             //           backgroundColor: Colors.white38,
//             //           primary: Colors.black,
//             //         ),
//             //         child: const Text(
//             //             "Register"
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:autoprohub/FIRSTLOG/otp_page.dart';
import 'package:flutter/material.dart';

class Pass_Forgot extends StatefulWidget {
  const Pass_Forgot({Key? key}) : super(key: key);

  @override
  State<Pass_Forgot> createState() => _Pass_ForgotState();
}

class _Pass_ForgotState extends State<Pass_Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/pixab.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Reset Password!',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your password? \n That's okay,  \n it happens to \n everyone ! \n Please provide your email to \n reset your password ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.mail_outline),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPPage()));
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
              ],
            ),
          ),
          Positioned(
            top: 40,
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


