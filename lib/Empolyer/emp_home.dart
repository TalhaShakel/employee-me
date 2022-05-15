import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/Empolyer/view_posted_job.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/widgets/button.dart';
import 'package:job_portal/widgets/heading.dart';
import 'package:job_portal/widgets/textfeilds.dart';

class Emp_Home extends StatelessWidget {
  const Emp_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employer"), actions: [
        IconButton(
            enableFeedback: false,
            onPressed: () {
              Get.to(profile());
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                  onPressed: () {
                    Get.to(postedjob());
                  },
                  height: 90.0,
                  width: 140.0,
                  text: "View Posted jobs"),
              SizedBox(
                width: 40,
              ),
              button(
                  onPressed: () {
                    Get.to(post_A_job());
                  },
                  height: 90.0,
                  width: 140.0,
                  text: "Post A New job")
            ],
          )
        ],
      ),
    );
  }
}

class post_A_job extends StatelessWidget {
  TextEditingController Job_Name = TextEditingController();

  TextEditingController Job_Salary = TextEditingController();

  TextEditingController Job_Qualification = TextEditingController();

  TextEditingController Job_Experience = TextEditingController();

  TextEditingController Job_Address = TextEditingController();
  userStore() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    try {
      await db.collection("posted-job").add({
        "uid": auth.toString(),
        "name": Job_Name.text,
        "Job_Salary": Job_Salary.text,
        "Job_Experience": Job_Experience.text,
        "Job_Address": Job_Address.text,
        "date": DateTime.now().toString(),
        "qual": Job_Qualification.text
      });
      Fluttertoast.showToast(
          msg: "require job is posted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 6,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      print("User is register");
    } catch (e) {
      print("ERROR");
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

  final _formKey = GlobalKey<FormState>();

  post_A_job({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Post A Job"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              jobfiels(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Job Name",
                  controler: Job_Name),
              jobfiels(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Job Salary",
                  controler: Job_Salary),
              jobfiels(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Job Qualification",
                  controler: Job_Qualification),
              jobfiels(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Job Experience",
                  controler: Job_Experience),
              jobfiels(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Job Address",
                  controler: Job_Address),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 19),
                child: Card(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Description"),
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              button(
                  onPressed: () {
                    userStore();
                    if (_formKey.currentState!.validate()) {
                      Get.to(Emp_Home());
                      Fluttertoast.showToast(
                          msg: "require job is posted",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 6,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  height: 40.0,
                  width: 150.0,
                  text: "Post"),
            ],
          ),
        ),
      ),
    );
  }
}
