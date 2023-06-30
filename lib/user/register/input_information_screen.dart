import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/inputfield.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';

class InputInformationScreen extends StatefulWidget {
  const InputInformationScreen({Key? key}) : super(key: key);

  @override
  State<InputInformationScreen> createState() => _InputInformationScreenState();
}

TextEditingController texting = TextEditingController();
String title = "이메일 주소를 입력하세요.";

class _InputInformationScreenState extends State<InputInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 10,
        widgets: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: inputfield(title: title, name: texting, textchange: textchange)),
            NextButton(texting: texting, screenchange: screenchange)
          ],
        ));
  }

  textchange() {
    setState(() {
      texting = texting;
    });
  }

  screenchange() {
    setState(() {
      if (title == "이메일 주소를 입력하세요.")
        title = "메일로 전송된 \n4자리코드를 입력하세요.";
      else if (title == "메일로 전송된 \n4자리코드를 입력하세요.")
        title = "비밀번호를 입력하세요.";
      else if (title == "비밀번호를 입력하세요.")
        title = "학사정보를 입력하세요.";
      else if (title == "학사정보를 입력하세요.")
        title = "입학 연도를 입력하세요.";
      else if (title == "입학 연도를 입력하세요.") title = "졸업 연도를 입력하세요.";
    });
    print(title);
  }
}
