import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/screen/input_4school_screen.dart';

class InputPasswordScreen extends StatefulWidget {
  const InputPasswordScreen({Key? key}) : super(key: key);

  @override
  State<InputPasswordScreen> createState() => _InputPasswordScreenState();
}

TextEditingController texting = TextEditingController();
String title = "비밀번호 입력하세요.";
bool check=false;
class _InputPasswordScreenState extends State<InputPasswordScreen> {
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
                      inputtext()
                    ])),
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
              hintText: "*********",
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            onChanged: (text) {
              setState(() {
                if(text.length>8) check=true;
                else false;
              });
            },

            maxLength:  16 ,
          )
        ]);
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputSchoolScreen()));
  }
}
