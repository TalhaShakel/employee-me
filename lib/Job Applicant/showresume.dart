import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/Job%20Applicant/resume_Upload.dart';
import 'package:job_portal/Job%20Applicant/showresume.dart';

class applied extends StatelessWidget {
  applied({Key? key}) : super(key: key);
  var uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applied Jobs"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('resume').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot? doc;
                  snapshot.data!.docs[index]["uid"] == uid.toString()
                      ? doc = snapshot.data!.docs[index]
                      : print(
                          "pokaaa ${snapshot.data!.docs[index].reference.update({})} ");

                  return doc?["name"] != null
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(resume());
                              },
                              child: Card(
                                elevation: 10,
                                child: ListTile(
                                  title: Text(doc?['name']),
                                  subtitle: Text(doc?['coverletter']),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(doc!['email']),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container();
                });
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}
