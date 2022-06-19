import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApBar extends StatefulWidget {
  const ApBar({Key? key}) : super(key: key);

  @override
  State<ApBar> createState() => _ApBarState();
}

class _ApBarState extends State<ApBar> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController studyprogram = TextEditingController();
  TextEditingController email = TextEditingController();

  createdata() async {
    try {
      FirebaseFirestore.instance.collection("Class").doc(name.text).set({
        "Name": name.text,
        "RollNo": rollno.text,
        "StudyProgram": studyprogram.text,
        "Email": email.text,
      });
    } catch (e) {
      print(e);
    }
  }

  updatedata() async {
    try {
      FirebaseFirestore.instance.collection("Class").doc(name.text).update({
        "Name": name.text,
        "RollNo": rollno.text,
        "StudyProgram": studyprogram.text,
        "Email": email.text,
      });
    } catch (e) {
      print(e);
    }
  }

  deletedata() async {
    try {
      FirebaseFirestore.instance.collection("Class").doc(name.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students Record"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child:TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: rollno,
                decoration: InputDecoration(
                  labelText: "Student RollNo",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: studyprogram,
                decoration: InputDecoration(
                  labelText: "Study Program",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Create"),
                  textColor: Colors.white,
                  onPressed: (() {
                    createdata();
                    name.clear();
                    rollno.clear();
                    studyprogram.clear();
                    email.clear();
                  }),
                ),
                RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Update"),
                  textColor: Colors.white,
                  onPressed: (() {
                    updatedata();
                    name.clear();
                    rollno.clear();
                    studyprogram.clear();
                    email.clear();
                  }),
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Delete"),
                  textColor: Colors.white,
                  onPressed: (() {
                    deletedata();
                    name.clear();
                    rollno.clear();
                    studyprogram.clear();
                    email.clear();
                  }),
                ),
              ],
            ),
            Container(
              height: 1000,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection("Class").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot x = snapshot.data!.docs[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  x["Name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text(
                                  x["RollNo"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  x["StudyProgram"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  x["Email"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
