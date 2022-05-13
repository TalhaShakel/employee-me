// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class crud extends StatelessWidget {
//   var name = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextFormField(
//             controller: name,
//           ),
//           TextFormField(
//             controller: name,
//           ),
//           TextFormField(
//             controller: name,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 await FirebaseFirestore.instance
//                     .collection("user")
//                     .doc("my-id2")
//                     .set({
//                   "data": name.text,
//                   "data1": name.text,
//                   "data2": name.text
//                 });
//               },
//               child: Text("data")),
//           ElevatedButton(
//               onPressed: () {
//                 Get.to(show());
//               },
//               child: Text("data"))
//         ],
//       ),
//     );
//   }
// }

// class show extends StatelessWidget {
//   var el;

//   show({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Future getDocs() async {
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection("user").get();
//       for (int i = 0; i < querySnapshot.docs.length; i++) {
//         var a = querySnapshot.docs[i]["data$i"];
//         print(a.id["name"]);
//       }
//     }

//     // Future readuser() {
//     //   FirebaseFirestore.instance
//     //       .collection("user")
//     //       .get()
//     //       .then((value) => value.docs.forEach((element) {
//     //             print(element.data().toString());
//     //             var el2 = element.data();
//     //             return element.data();
//     //           }));
//     // }
//     Future<Future<QuerySnapshot<Map<String, dynamic>>>> downloadData() async {
//       final ll = FirebaseFirestore.instance.collection("user").get();
//       return ll; // return your response
//     }

//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           // StreamBuilder(builder: (context, snapshot) {
//           //   if (snapshot.hasData) {
//           //     final user = snapshot.data!;
//           //     print(snapshot.data.toString());
//           //     return ListView(
//           //       children: [
//           //         ListTile(
//           //           title: Text(user.toString()),
//           //         )
//           //       ],
//           //     );
//           //   } else {
//           //     return ElevatedButton(
//           //         onPressed: () {
//           //           getDocs();
//           //         },
//           //         child: Text("data"));
//           //   }
//           // })
//           // ElevatedButton(
//           //     onPressed: () {
//           //       readuser;
//           //     },
//           //     child: Text("data")),
//           FutureBuilder<String>(
//             future: downloadData(), // function where you call your api
//             builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//               // AsyncSnapshot<Your object type>
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: Text('Please wait its loading...'));
//               } else {
//                 if (snapshot.hasError)
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 else
//                   return Center(
//                       child: new Text(
//                           '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
