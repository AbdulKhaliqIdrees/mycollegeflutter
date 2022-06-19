import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget{
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  createdata() async {
  try{
    FirebaseFirestore.instance
    .collection("Class")
    .doc(name.text)
    .set({
      "Name":name.text,
      "Email":email.text,
    });
  }catch(e){
    print(e);
  }  
  }
  updatedata() async {
    try{
      FirebaseFirestore.instance
    .collection("Class")
    .doc(name.text)
    .update({
      "Name":name.text,
      "Email":email.text,
    });
    }catch(e){
      print(e);
    }
  }
  deletedata() async {
  try{
    FirebaseFirestore.instance
    .collection("Class")
    .doc(name.text)
    .delete();
  }catch(e){
    print(e);
  }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text("Create"),
          textColor: Colors.white,
          onPressed: (() {
            createdata();
            name.clear();
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
            email.clear();
          }),
        ),
      ],
    );
  }
}