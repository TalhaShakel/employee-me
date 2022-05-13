import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curretndata();
  }

  var auth = FirebaseAuth.instance.currentUser?.uid;
  curretndata() async {
    print(auth.toString() + "  UID");
    try {
      final userCredentials =
          await FirebaseFirestore.instance.collection("user").doc(auth).get();
      print(userCredentials.data());

      name = userCredentials.data()?["name"];
      email = userCredentials.data()?["email"];
      password = userCredentials.data()?["password"];
    } catch (e) {
      print("ERROR kdkf$e");
    }

    print("object ${name + email + password} ");
    setState(() {});
  }

  var name;

  var email;

  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          profilw_data(text: "Email", text2: "$email"),
          profilw_data(text: "name", text2: "$name"),
          profilw_data(text: "Password", text2: "$password")
        ],
      ),
    );
  }
}

class profilw_data extends StatelessWidget {
  final String text2;

  IconData? icon;

  profilw_data({Key? key, this.icon, required this.text, required this.text2})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 70,
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              text2.toUpperCase(),
              style: new TextStyle(
                fontSize: 20.0,
                letterSpacing: 1,
              ),
            ),
            subtitle: Text(
              text.toUpperCase(),
              style: new TextStyle(
                fontSize: 13.0,
                letterSpacing: 1,
              ),
            ),
          )
          // Text(
          //   text.toUpperCase(),
          //   style: new TextStyle(
          //       fontSize: 20.0, fontFamily: 'Roboto', color: orangeColors),
          // ),
          ),
    );
  }
}
