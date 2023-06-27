import 'package:flutter/material.dart';

Widget inputfield(TextEditingController name){
  return TextField(
    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: Colors.white)),
      hintText: "아ㅓ미ㅏㅇ럼",
    ),
    controller: name,
    maxLength: 9,
  );
}