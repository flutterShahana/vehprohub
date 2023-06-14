// import 'package:flutter/material.dart';
//
// class UserServiceProvider extends StatefulWidget {
//   const UserServiceProvider({Key? key}) : super(key: key);
//
//   @override
//   State<UserServiceProvider> createState() => _UserServiceProviderState();
// }
//
// class _UserServiceProviderState extends State<UserServiceProvider> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("images/juanagu.jpg"),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Center(
//           child: IntrinsicWidth(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Icon(
//                   Icons.emoji_transportation,
//                   size: 100.0,
//                   color: Colors.white,
//                 ),
//                 SizedBox(
//                   height: 80.0,
//                   child: ElevatedButton(
//                     onPressed: () {
//
//                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.green,
//                       );
//                       },
//                     child: const Text(
//                       'SIGNUP AS USER',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 80.0,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
//
//                     },
//                     child: const Text(
//                       'SIGN UP AS SERVICEPROVIDER ',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:autoprohub/FIRSTLOG/servicestypees.dart';
import 'package:flutter/material.dart';

class UserServiceProvider extends StatefulWidget {
  const UserServiceProvider({Key? key}) : super(key: key);

  @override
  State<UserServiceProvider> createState() => _UserServiceProviderState();
}

class _UserServiceProviderState extends State<UserServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/juanagu.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.emoji_transportation,
                  size: 100.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(width: 8.0),
                        Text(
                          'SIGNUP AS USER',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServicesFullTypes()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(width: 8.0),
                        Text(
                          'SIGNUP AS SERVICE PROVIDER',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
