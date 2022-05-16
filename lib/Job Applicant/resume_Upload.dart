import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/job_home.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/widgets/button.dart';
import 'package:job_portal/widgets/textfeilds.dart';
import 'package:file_picker/file_picker.dart';

class resume extends StatefulWidget {
  String? id;
  resume({Key? key, this.id}) : super(key: key);

  @override
  State<resume> createState() => _resumeState();
}

class _resumeState extends State<resume> {
  var name = TextEditingController();

  File? file;
  // final base = basename()

  TextEditingController email = TextEditingController();

  TextEditingController cover = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userStore() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    try {
      await db.collection("resume").add({
        "name": name.text,
        "email": email.text,
        "coverletter": cover.text,
        "uid": uid
      });
      print("User is register");
    } catch (e) {
      print("ERROR");
    }
  }

  userStore2() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await FirebaseAuth.instance.currentUser!.uid;

    try {
      await db.collection("posted-job").doc(widget.id).collection("apply").add(
          {"name": name.text, "email": email.text, "coverletter": cover.text});
      print("User is register");
    } catch (e) {
      print("ERROR");
    }
  }

  filepick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = File(result.files.single.path.toString());
      });
      print("fileeee" + file.toString());

      // Storage.FirebaseStorage _storage = await Storage.FirebaseStorage.instance;
      // final reference = await _storage.ref("pdf/${file?.path}").putFile(file!);
    } else {
      print("User canceled the picker");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Want to Apply For Job"),
        actions: [
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
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              jobfiels2(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Enter your name",
                  controler: name),
              jobfiels2(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a valid Name';
                    }
                    return null;
                  },
                  label: "Enter your Email",
                  controler: email),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40),
                child: Card(
                  child: TextFormField(
                    controller: cover,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter a valid description';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(labelText: "Write cover letter"),
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              button(
                  onPressed: () {
                    filepick();
                    
                    // uploadFile(file);
                  },
                  height: 40.0,
                  width: 150.0,
                  text: "Upload file"),
              Text(file != null ? "File is selected" : "FIle is not selected"),
              SizedBox(
                height: 10,
              ),
              button(
                  onPressed: () async {
                    await userStore2();
                    await userStore();
                    if (_formKey.currentState!.validate()) {
                      Get.to(job_Home());
                    }
                    Fluttertoast.showToast(
                        msg: "JOb is post",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 6,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
