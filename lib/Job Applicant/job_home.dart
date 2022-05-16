import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/Job%20Applicant/resume_Upload.dart';
import 'package:job_portal/Job%20Applicant/showresume.dart';
import 'package:job_portal/Job%20Applicant/test.dart';
import 'package:job_portal/widgets/heading.dart';

class job_Home extends StatelessWidget {
  const job_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Applicant"),
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
      body: Column(
        children: [
          view_job(),
          ElevatedButton(
              onPressed: () {
                Get.to(applied());
              },
              child: Text("View post job"))
        ],
      ),
    );
  }
}

class view_job extends StatelessWidget {
  const view_job({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posted-job').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                h1(head: (doc['name'])),

                                // IconButton(
                                //     onPressed: () {
                                // Get.to(edit_posted_job(
                                //   name: doc?["name"],
                                //   Address:
                                //       doc?['Job_Address'],
                                //   SALARY: doc?['Job_Salary'],
                                //   EXPERIENCE:
                                //       doc?['Job_Experience'],
                                //   QUALIFICATION: doc?['qual'],
                                //   DATE: doc?['date'],
                                //   update: doc?.id,
                                // ));
                                //         },
                                //         icon: Icon(Icons.edit)),
                                //   ],
                                // ),
                                Text(
                                    "Address \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${doc['Job_Address']}"),
                                Text(
                                    "SALARY \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${doc['Job_Salary']}"),
                                Text(
                                    "EXPERIENCE \t\t\t\t\t\t\t\t\t${doc['Job_Experience']}"),
                                Text("QUALIFICATION \t\t\t\t${doc['qual']}"),
                                Text("DATE \t\t\t\t\t\t${doc['date']}"),
                                Center(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Get.to(resume(
                                          id: doc.id,
                                        ));
                                      },
                                      child: Text("Apply")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}
