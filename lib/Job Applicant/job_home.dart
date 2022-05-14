import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/Job%20Applicant/profile.dart';
import 'package:job_portal/Job%20Applicant/resume_Upload.dart';
import 'package:job_portal/Job%20Applicant/showresume.dart';

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
                itemCount: snapshot.data!. docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(resume());
                        },
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(doc['name']),
                            subtitle: Text(doc['qual']),
                            trailing: Text(doc['date']),
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
