import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/widgets/heading.dart';

class kaadu extends StatelessWidget {
  var id;
  kaadu({Key? key, this.id}) : super(key: key);

  poka() async {
    final userr = FirebaseFirestore.instance.collection("posted-job");
    var id;
    await userr.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
        id = doc.data();
      });
    });
    print(id.toString() + "poka");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View people resume"),
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('posted-job')
                    .doc("$id")
                    .collection("apply")
                    .snapshots(),
                builder: (context, snapshot) {
                  print(id);
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          print(snapshot.data?.docs.length);
                          QueryDocumentSnapshot? doc =
                              snapshot.data?.docs[index];
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                elevation: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    h1(head: "${doc?["name"]}"),
                                    Text(
                                      "${doc?["email"]}",
                                      style: TextStyle(fontSize: 21),
                                    ),
                                    Text("${doc?["coverletter"]}")
                                  ],
                                ),
                              ));
                        });
                  } else {
                    return Text("data");
                  }
                })));
  }
}
