import 'package:flutter/material.dart';

class Email extends StatefulWidget{
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => _StudentIDState();
}

class _StudentIDState extends State<Email> {
TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:  EdgeInsets.only(bottom:8.0),
              child: TextField(
                controller: email,
                decoration:  InputDecoration(
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
            );
            
  }
}