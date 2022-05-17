import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/widgets/heading.dart';
import 'package:job_portal/widgets/textfeilds.dart';
import 'package:url_launcher/url_launcher.dart';

class kaadu extends StatelessWidget {
  var id;

  var name = TextEditingController();

  var email = TextEditingController();

  var description = TextEditingController();
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
                          return GestureDetector(
                            onTap: () {
                              name.text = "${doc?["name"]}";
                              description.text = "${doc?["name"]}";
                              email.text = "${doc?["email"]}";
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text('Resume'),
                                        content: Column(
                                          // shrinkWrap: true,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                  label: Text("Name")),
                                              controller: name,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  label: Text("Email")),
                                              controller: email,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  label: Text("coverletter")),
                                              controller: description,
                                            ),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  print(doc?["resumeurl"]);
                                                  final Uri _url = Uri.parse(
                                                      doc?["resumeurl"]);
                                                  // var _url =
                                                  //     "$doc?['resumeurl']";
                                                  if (await canLaunchUrl(
                                                      _url)) {
                                                    await launchUrl(_url);
                                                  }
                                                },
                                                child: Text("Download resume"))
                                          ],
                                        ),
                                      ));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      h1(head: "Name:  ${doc?["name"]}"),
                                      Text(
                                        "Email: ${doc?["email"]}",
                                        style: TextStyle(fontSize: 21),
                                      ),
                                      Text(
                                        "description: ${doc?["coverletter"]}",
                                        style: TextStyle(fontSize: 21),
                                      )
                                    ],
                                  ),
                                )),
                          );
                        });
                  } else {
                    return Text("data");
                  }
                })));
  }
}
