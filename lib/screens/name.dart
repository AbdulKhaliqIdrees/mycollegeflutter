import 'package:flutter/material.dart';
class Name extends StatefulWidget{
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}
class _NameState extends State<Name> {
 TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
       return Padding(
              padding: EdgeInsets.only(bottom:8.0),
              child: TextField(
                controller:name,
                decoration: InputDecoration(
                  labelText: "Name",
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