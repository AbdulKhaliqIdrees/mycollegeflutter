import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycollegeflutter/screens/student_item.dart';
import 'package:mycollegeflutter/widgets/text_field.dart';

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

  final firestore = FirebaseFirestore.instance;

  createdata() async {
    try {
      // String id = DateTime.now().millisecondsSinceEpoch.toString();

      // firestore.collection("Class").doc(id).set({
      //   "Name": name.text,
      //   "RollNo": rollno.text,
      //   "StudyProgram": studyprogram.text,
      //   "Email": email.text,
      // });
      firestore.collection("Class").add({
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
      firestore.collection("Class").doc(name.text).update({
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
      firestore.collection("Class").doc(name.text).delete();
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
          child: Column(
            children: [
              MyTextField(name, "Student Name"),
              MyTextField(rollno, "Student RollNo"),
              MyTextField(studyprogram, "Study Program"),
              MyTextField(email, "Email"),
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
                    onPressed: () {
                      createdata();
                      name.clear();
                      rollno.clear();
                      studyprogram.clear();
                      email.clear();
                    },
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
                    stream: FirebaseFirestore.instance
                        .collection("Class")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot x =
                                snapshot.data!.docs[index];
                            return StudentItem(x);
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
