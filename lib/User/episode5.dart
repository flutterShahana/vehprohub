// import 'package:flutter/material.dart';
//
// class Episode5 extends StatefulWidget {
//   @override
//   _Episode5State createState() => _Episode5State();
// }
//
// class _Episode5State extends State<Episode5> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   final form = GlobalKey<FormState>();
//   static var _focusNode = new FocusNode();
//   int currentIndex = 0;
//
//   List<User> userList = [
//     User(name: "a", email: "a"),
//     User(name: "d", email: "b"),
//     User(name: "c", email: "c"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Widget bodyData() => DataTable(
//       onSelectAll: (b) {},
//       sortColumnIndex: 0,
//       sortAscending: true,
//       columns: <DataColumn>[
//         DataColumn(label: Text("Name"), tooltip: "To Display name"),
//         DataColumn(label: Text("Email"), tooltip: "To Display Email"),
//         DataColumn(label: Text("Update"), tooltip: "Update data"),
//       ],
//       rows: userList.map((user) => DataRow(
//         cells: [
//           DataCell(
//             Text(user.name),
//           ),
//           DataCell(
//             Text(user.email),
//           ),
//           DataCell(
//             IconButton(
//               onPressed: () {
//                 currentIndex = userList.indexOf(user);
//                 _updateTextControllers(user);
//               },
//               icon: Icon(
//                 Icons.edit,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       )).toList(),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Data add to List Table using Form"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             bodyData(),
//             Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Form(
//                 key: form,
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         controller: nameController,
//                         focusNode: _focusNode,
//                         keyboardType: TextInputType.text,
//                         autocorrect: false,
//                         maxLines: 1,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'This field is required';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           hintText: 'Name',
//                           labelStyle: TextStyle(
//                             decorationStyle: TextDecorationStyle.solid,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.text,
//                         autocorrect: false,
//                         maxLines: 1,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'This field is required';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           hintText: 'Email',
//                           labelStyle: TextStyle(
//                             decorationStyle: TextDecorationStyle.solid,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Column(
//                         children: <Widget>[
//                           Center(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     TextButton(
//                                       child: Text("Add"),
//                                       onPressed: () {
//                                         if (form.currentState.validate()) {
//                                           form.currentState.save();
//                                           addUserToList(
//                                             nameController.text,
//                                             emailController.text,
//                                           );
//                                         }
//                                       },
//                                     ),
//                                     TextButton(
//                                       child: Text("Update"),
//                                       onPressed: () {
//                                         if (form.currentState.validate()) {
//                                           form.currentState.save();
//                                           updateForm();
//                                         }
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     ElevatedButton(
//                                       child: Text("Save and Exit"),
//                                       onPressed: () {
//                                         if (form.currentState.validate()) {
//                                           form.currentState.save();
//                                           addUserToList(
//                                             nameController.text,
//                                             emailController.text,
//                                           );
//                                           Navigator.pop(context, userList);
//                                         }
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void updateForm() {
//     setState(() {
//       User user = User(name: nameController.text, email: emailController.text);
//       userList[currentIndex] = user;
//     });
//   }
//
//   void _updateTextControllers(User user) {
//     setState(() {
//       nameController.text = user.name;
//       emailController.text = user.email;
//     });
//   }
//
//   void addUserToList(name, email) {
//     setState(() {
//       userList.add(User(name: name, email: email));
//     });
//   }
// }
//
// class User {
//   String name;
//   String email;
//
//   User({this.name, this.email});
// }
