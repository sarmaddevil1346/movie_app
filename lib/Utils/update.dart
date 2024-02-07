// import 'package:flutter/material.dart';
//
// import '../Models/userModel.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List contactList = [];
//   TextEditingController nameEditingController = TextEditingController();
//   TextEditingController numberEditingController = TextEditingController()
//
//   int selectedIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Contact App"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//
//
//                   setState(() {
//                     contactList.add(
//                       ContactModel(
//                         name: text,
//                         password: pass,
//                       ),
//                     );
//
//                   });
//                 },
//                 child: const Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//
//
//                   setState(() {
//                     contactList[selectedIndex] = text;
//                     contactList[selectedIndex] = number;
//                     selectedIndex = -1;
//
//                     nameEditingController.text = "";
//                     numberEditingController.text = "";
//                   });
//                 },
//                 child: const Text("update"),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: contactList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: const CircleAvatar(),
//                   title: Text(contactList[index].name),
//                   subtitle: Text(contactList[index].phone.toString()),
//                   trailing: SizedBox(
//                     width: 70,
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               contactList.removeAt(index);
//                             });
//                           },
//                           child: const Icon(Icons.edit),
//                         ),
//                         InkWell(
//                             onTap: () {
//                               setState(() {
//                                 nameEditingController.text =
//                                     contactList[index].name;
//                                 numberEditingController.text =
//                                     contactList[index].phone;
//                                 selectedIndex = index;
//                               });
//                             },
//                             child: const Icon(Icons.delete)),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
