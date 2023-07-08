import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/screen/input_2number_screen.dart';

class InputEmailScreen extends StatefulWidget {
  const InputEmailScreen({Key? key}) : super(key: key);

  @override
  State<InputEmailScreen> createState() => _InputEmailScreenState();
}

TextEditingController texting = TextEditingController();
String title = "이메일 주소를 입력하세요.";
bool check=false;

class _InputEmailScreenState extends State<InputEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 10,
        widgets: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 130.h),
                      Text(title, style: TextStyle(fontSize: 22.sp)),
                      SizedBox(height: 10.h),
                      inputtext(),
                    ])
            ),
            NextButton(check: check, screenchange: screenchange)
          ],
        ));
  }
  Widget inputtext(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          TextField(
            decoration: InputDecoration(
              enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
              hintText: "hello@naver.com",
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {
              setState(() {
                if(text!="") check=true;
                else check = false;
              });
            },
            controller: texting,
            maxLength:  null ,
          )
        ]);
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputNumberScreen()));
  }
}
