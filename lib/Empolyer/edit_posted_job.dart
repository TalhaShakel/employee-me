import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/test.dart';
import 'package:job_portal/widgets/textfeilds.dart';

class edit_posted_job extends StatelessWidget {
  var name;
  String? update;
  var SALARY, Address, EXPERIENCE, QUALIFICATION, DATE;

  TextEditingController name1 = TextEditingController();

  var jobal = TextEditingController();

  var jobqual = TextEditingController();

  var jobexp = TextEditingController();

  var jobadre = TextEditingController();
  edit_posted_job(
      {this.update,
      this.name,
      this.Address,
      this.SALARY,
      this.EXPERIENCE,
      this.QUALIFICATION,
      this.DATE});

  update2() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    try {
      await FirebaseFirestore.instance
          .collection("posted-job")
          .doc(update)
          .update({
        "name": name1.text,
        "Job_Address": jobadre.text,
        "Job_Experience": jobexp.text,
        "Job_Salary": jobal.text,
        "qual": jobqual.text,
      });
      Get.back();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    name1.text = name;
    jobadre.text = Address;
    jobexp.text = EXPERIENCE;
    jobqual.text = QUALIFICATION;
    jobal.text = SALARY;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          jobfiels(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter a valid Name';
                }
                return null;
              },
              label: "Job Name",
              controler: name1),
          jobfiels(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter a valid Name';
                }
                return null;
              },
              label: "Job Salary",
              controler: jobal),
          jobfiels(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter a valid Name';
                }
                return null;
              },
              label: "Job Qualification",
              controler: jobqual),
          jobfiels(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter a valid Name';
                }
                return null;
              },
              label: "Job Experience",
              controler: jobexp),
          jobfiels(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter a valid Name';
                }
                return null;
              },
              label: "Job Address",
              controler: jobadre),
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: ElevatedButton(
                onPressed: () {
                  update2(); // Get.to(kaadu());
                  // poka();
                },
                child: Text("update")),
          )
        ],
      ),
    );
  }
}
