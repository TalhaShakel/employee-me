import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Empolyer/emp_sign.dart';
import 'package:job_portal/Job%20Applicant/job_login.dart';
import 'package:job_portal/widgets/crud.dart';

import 'Empolyer/emp_log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcome(),
    );
  }
}

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(job_Log());
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                  child: Text("Job Applicant")),
              ElevatedButton(
                onPressed: () {
                  Get.to(Empolyer_Log());
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                child: Text("Empolyer"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
