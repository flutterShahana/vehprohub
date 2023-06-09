// import 'package:flutter/material.dart';
//
// class CabUnsuccessfulsts extends StatefulWidget {
//   const CabUnsuccessfulsts({Key? key}) : super(key: key);
//
//   @override
//   State<CabUnsuccessfulsts> createState() => _CabUnsuccessfulstsState();
// }
//
// class _CabUnsuccessfulstsState extends State<CabUnsuccessfulsts> {
//   List<String> items = ['Item 1', 'Item 2', 'Item 3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Cab Unsuccessful Status'),
//       // ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             // Handle the first item separately
//             return ListTile(
//               title: Text(
//                 items.first,
//               ),
//             );
//           } else {
//             return ListTile(
//               title: Text(items[index]),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CabUnsuccessfulsts extends StatefulWidget {
  const CabUnsuccessfulsts({Key? key}) : super(key: key);

  @override
  State<CabUnsuccessfulsts> createState() => _CabUnsuccessfulstsState();
}

class _CabUnsuccessfulstsState extends State<CabUnsuccessfulsts> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3','Item 4', 'Item 5', 'Item 6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Handle the first item separately
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  items.first,
                ),
              ),
            );
          } else {
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          }
        },
      ),
    );
  }
}

