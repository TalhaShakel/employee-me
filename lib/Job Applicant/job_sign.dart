import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/job_login.dart';
import 'package:job_portal/widgets/button.dart';
import 'package:job_portal/widgets/heading.dart';

import '../widgets/textfeilds.dart';

class Job_Sign extends StatelessWidget {
  const Job_Sign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    TextEditingController password = TextEditingController();
    createuser() async {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        var uid = auth.currentUser?.uid;
        await FirebaseFirestore.instance
            .collection("user")
            .doc(uid.toString())
            .set({
          "email": email.text,
          "password": password.text,
          "name": name.text,
          "field": "emp",
        });
        Get.to(job_Log());
        Fluttertoast.showToast(
            msg: "User is created",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 6,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } catch (e) {
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 6,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            h1(head: "Job Applicant"),
            textfeild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter a valid Name';
                  }
                  return null;
                },
                label: "Name",
                controler: name),
            textfeild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter a valid eamil';
                  } else if (!value.contains("@")) {
                    return 'enter a valid eamil';
                  }
                  return null;
                },
                label: "Email",
                controler: email),
            textfeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else if (value.length < 6) {
                    return "Password must be atleast 6 characters long";
                  } else {
                    return null;
                  }
                },
                label: "Password",
                controler: password),
            button(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    createuser();
                  }
                },
                height: 40.0,
                width: 150.0,
                text: "Register")
          ],
        ),
      ),
    );
  }
}
