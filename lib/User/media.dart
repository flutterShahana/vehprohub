// import 'package:autoprohub/User/pictures.dart';
// import 'package:autoprohub/User/MEDIA/postss.dart';
// import 'package:autoprohub/User/MEDIA/videoos.dart';
// import 'package:flutter/material.dart';
//
//
// class Medias extends StatefulWidget {
//   const Medias({Key? key}) : super(key: key);
//
//   @override
//   State<Medias> createState() => _MediasState();
// }
//
// class _MediasState extends State<Medias> {
//   @override
//   Widget build(BuildContext context) {
//     return  DefaultTabController(
//       length:3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Media"),
//           backgroundColor: Colors.purple[200],
//         ),
//
//         // body: Container(
//         //     height: double.infinity ,
//         //     width: MediaQuery.of(context).size.width,
//         //
//         //     child:Center(
//         //       child: Column(
//         //         mainAxisAlignment: MainAxisAlignment.start,
//         //         crossAxisAlignment: CrossAxisAlignment.start,
//         //
//         //         children: [
//         //           const SizedBox(height: 12),
//         //           Padding(padding: const EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0,right: 10.0),
//         //
//         //             child: Card(
//         //               elevation: 10,
//         //               child: Column(
//         //                 children: [
//         //                   Container(
//         //                     height: 150,
//         //                     // width: 100,
//         //                     decoration: const BoxDecoration(
//         //
//         //                         image: DecorationImage(image:AssetImage("images/yoshi.png"),
//         //                           fit: BoxFit.fill,
//         //
//         //                         )
//         //                     ),
//         //                   ),
//         //                   Container(
//         //                     height:30,
//         //                     width:310 ,
//         //                     color: Colors.red.shade100,
//         //                     child: const Text("Offer Close : 30/JUNE/2023",
//         //                       textAlign: TextAlign.center,
//         //
//         //                       style:TextStyle(
//         //                         fontSize: 20,
//         //                         color: Colors.white,
//         //
//         //                       ),
//         //                     ),
//         //
//         //                   ),
//         //
//         //
//         //                 ],
//         //               ),
//         //             ),
//         //
//         //           ),
//         //         ],
//         //       ),
//         //     )
//         // ),
//
//         body:Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             Container(
//               // height: 45,
//               // width: 300,
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//                 // borderRadius: BorderRadius(),
//               ),
//               child:
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TabBar(
//                     indicator: BoxDecoration(
//                       color: Colors.blue[200],
//                       // borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     labelColor: Colors.white,
//                     unselectedLabelColor: Colors.black,
//                     tabs: const [
//
//                       Tab(text: "   Photos   ",),
//                       Tab(text: "   Videos   ",),
//                       Tab(text: "   Posts    ",),
//                       // Tab(text: "Accessory",)
//
//                     ],
//                     isScrollable: true,
//
//                   ),
//                 ],
//               ) ,
//             ),
//             const Expanded(
//               child:
//               TabBarView(
//                 children: [
//
//                   Pictures(),
//                   Videoss(),
//                   Posts(),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//
//
//       ),
//     );
//   }
// }

import 'package:autoprohub/User/pictures.dart';
import 'package:autoprohub/User/MEDIA/postss.dart';
import 'package:autoprohub/User/MEDIA/videoos.dart';
import 'package:flutter/material.dart';

class Medias extends StatefulWidget {
  const Medias({Key? key}) : super(key: key);

  @override
  State<Medias> createState() => _MediasState();
}

class _MediasState extends State<Medias> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Media"),
          backgroundColor: Colors.purple[200],
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu item selection
                if (value == 'photo') {
                  // Handle photo option
                } else if (value == 'video') {
                  // Handle video option
                } else if (value == 'post') {
                  // Handle post option
                }
              },

              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  child: ListTile(
                    leading: Icon(Icons.upload_file),
                    title: Text('Upload'),
                  ),
                ),



                const PopupMenuItem<String>(
                  value: 'photo',
                  child: ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'video',
                  child: ListTile(
                    leading: Icon(Icons.video_library),
                    title: Text('Video'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'post',
                  child: ListTile(
                    leading: Icon(Icons.note_alt_outlined),
                    title: Text('Post'),
                  ),
                ),
              ],
            ),
          ],
        ),


        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.blue[200],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: "   Photos   "),
                  Tab(text: "   Videos   "),
                  Tab(text: "   Posts    "),
                ],
                isScrollable: true,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Pictures(),
                  Videoss(),
                  Posts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

