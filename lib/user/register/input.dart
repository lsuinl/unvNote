import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/inputfield.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';

class InputInformationScreen extends StatefulWidget {
  final String type;
  final String title;

  const InputInformationScreen({
    required this.type,
    required this.title,
    Key? key}) : super(key: key);

  @override
  State<InputInformationScreen> createState() => _InputInformationScreenState();
}

TextEditingController texting = TextEditingController();

class _InputInformationScreenState extends State<InputInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Basic(
        paddings: 10,
        widgets: Column(
          children: [
            Text(widget.type, style: TextStyle(fontSize: 30.sp)),
            inputfield(texting),
            NextButton()
          ],
        )
    );
  }
}
