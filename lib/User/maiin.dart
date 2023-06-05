// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class FormController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   int currentIndex = 0;
//
//   List<User> userList = [
//     User(name: "a", email: "a"),
//     User(name: "d", email: "b"),
//     User(name: "c", email: "c"),
//   ];
//
//   void updateForm() {
//     User user = User(name: nameController.text, email: emailController.text);
//     userList[currentIndex] = user;
//     update();
//   }
//
//   void updateTextControllers(User user) {
//     nameController.text = user.name;
//     emailController.text = user.email;
//     update();
//   }
//
//   void addUserToList(name, email) {
//     userList.add(User(name: name, email: email));
//     update();
//   }
//
//   void updateLanguageInformation() {
//     for (var user in userList) {
//       print("Name: ${user.name} Email: ${user.email}");
//     }
//   }
// }
//
// class Episode5 extends StatefulWidget {
//   @override
//   _Episode5State createState() => _Episode5State();
// }
//
// class _Episode5State extends State<Episode5> {
//   final form = GlobalKey<FormState>();
//   final controller = Get.find<FormController>();
//   static var _focusNode = new FocusNode();
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
//       rows: controller.userList
//           .map(
//             (user) => DataRow(
//           cells: [
//             DataCell(
//               Text(user.name),
//             ),
//             DataCell(
//               Text(user.email),
//             ),
//             DataCell(
//               IconButton(
//                 onPressed: () {
//                   controller.currentIndex =
//                       controller.userList.indexOf(user);
//                   controller.updateTextControllers(user);
//                 },
//                 icon: Icon(
//                   Icons.edit,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )
//           .toList(),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Data add to List Table using Form"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Obx(() => bodyData()), // Obx widget for reactive UI update
//             Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Form(
//                 key: form,
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         controller: controller.nameController,
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
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: controller.emailController,
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
//                       SizedBox(height: 10),
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
//                                         form.currentState.save();
//                                         controller.addUserToList(
//                                           controller.nameController.text,
//                                           controller.emailController.text,
//                                         );
//                                       },
//                                     ),
//                                     TextButton(
//                                       child: Text("Update"),
//                                       onPressed: () {
//                                         form.currentState.save();
//                                         controller.updateForm();
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
//                                         form.currentState.save();
//                                         controller.updateLanguageInformation();
//                                         Navigator.pop(context);
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
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Testing List View Data From second page to first page"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: GetBuilder<FormController>(
//               builder: (controller) => ListView.builder(
//                 itemCount: controller.userList.length,
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text(controller.userList[index].name),
//                   subtitle: Text(controller.userList[index].email),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Episode5(),
//                 ),
//               );
//             },
//             child: Text("Open Form"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class User {
//   String name;
//   String email;
//
//   User({this.name, this.email});
// }
//
// void main() {
//   Get.put(FormController());
//   runApp(MyApp());
// }
