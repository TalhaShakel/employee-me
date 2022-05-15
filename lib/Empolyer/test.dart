import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class kaadu extends StatelessWidget {
  const kaadu({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  poka();
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
