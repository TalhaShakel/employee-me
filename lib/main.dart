import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Empolyer/emp_sign.dart';
import 'package:job_portal/Job%20Applicant/test.dart';
import 'package:job_portal/Job%20Applicant/job_login.dart';
import 'package:job_portal/widgets/button.dart';
import 'package:job_portal/widgets/crud.dart';
import 'package:job_portal/widgets/heading.dart';

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
      theme: ThemeData(
          // textButtonTheme: ,
          buttonColor: Colors.blue,
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey),
      themeMode: ThemeMode.dark,
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
      // backgroundColor: Colors.orange,
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 58.0),
                child: h1(head: "Employ me"),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // h1(head: "head"),
                  button(
                      onPressed: () {
                        Get.to(job_Log());
                      },
                      // style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                      height: 40.0,
                      width: 150.0,
                      text: ("Job Applicant")),
                  button(
                    onPressed: () {
                      Get.to(Empolyer_Log());
                    },
                    height: 40.0,
                    width: 150.0,
                    text: ("Empolyer"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
