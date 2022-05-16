import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Empolyer/edit_posted_job.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/Job%20Applicant/test.dart';
import 'package:job_portal/widgets/heading.dart';

class postedjob extends StatelessWidget {
  postedjob({Key? key}) : super(key: key);
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("View Posted Job"), actions: [
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
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('posted-job').snapshots(),
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
                    print(doc?["name"]);
                    var p = snapshot.data!.docs[index].id;

                    // print("pokaaa ${snapshot.data!.docs[index]["name"]}");

                    return doc?["name"] != null
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  // height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    elevation: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            h1(head: (doc?['name'])),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  Get.to(edit_posted_job(
                                                    name: doc?["name"],
                                                    Address:
                                                        doc?['Job_Address'],
                                                    SALARY: doc?['Job_Salary'],
                                                    EXPERIENCE:
                                                        doc?['Job_Experience'],
                                                    QUALIFICATION: doc?['qual'],
                                                    DATE: doc?['date'],
                                                    update: doc?.id,
                                                  ));
                                                },
                                                icon: Icon(Icons.edit)),
                                          ],
                                        ),
                                        Text(
                                            "Address \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${doc?['Job_Address']}"),
                                        Text(
                                            "SALARY \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${doc?['Job_Salary']}"),
                                        Text(
                                            "EXPERIENCE \t\t\t\t\t\t\t\t\t${doc?['Job_Experience']}"),
                                        Text(
                                            "QUALIFICATION \t\t\t\t${doc?['qual']}"),
                                        Text(
                                            "DATE \t\t\t\t\t\t${doc?['date']}"),
                                        Center(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Get.to(kaadu(
                                                  id: doc?.reference.id,
                                                ));
                                              },
                                              child:
                                                  Text("View People Resumes")),
                                        )
                                      ],
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
        ));
  }
}
