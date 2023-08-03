import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/common/check_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/quest/post_send_verify_email.dart';
import 'package:univ_note/user/register/screen/input_2number_screen.dart';

class InputEmailScreen extends StatefulWidget {
  const InputEmailScreen({Key? key}) : super(key: key);

  @override
  State<InputEmailScreen> createState() => _InputEmailScreenState();
}

TextEditingController texting = TextEditingController();
String title = "이메일 주소를 입력하세요.";
bool check = false;
bool errorstring=false;

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
                      errorstring==true ? Padding(padding: EdgeInsets.symmetric(vertical: 5.h) ,child:Text("형식이 올바르지 않거나 이미 가입된 회원입니다.",style: TextStyle(color: Colors.red))):Container()
                    ])),
            Column(children: [
              SizedBox(
                //박스사이즈 늘리기 Container 또는 Row 가능,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:
                            check == false ? Colors.black54 : Colors.blueAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(15)),
                    onPressed: () async {
                      //문자열체크불합격
                      if (CheckEmail(texting.text) == false)
                        setState(() {
                          errorstring = true;
                        });
                      //합격
                      else {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("email", texting.text);
                        PostSendVerifyEmail();
                        if(await PostSendVerifyEmail()!=201){ //에러나면
                          setState(() {
                            errorstring=true;
                          });
                        }
                        else
                          screenchange();
                      }
                    },
                    child: Text(
                      '다음',
                      style: TextStyle(fontSize: 15.sp),
                    )),
              ),
              SizedBox(height: 30.h),
            ])
          ],
        ));
  }

  Widget inputtext() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54)),
          hintText: "hello@naver.com",
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (text) {
          setState(() {
            if (text != "")
              check = true;
            else
              check = false;
          });
        },
        controller: texting,
        maxLength: null,
      )
    ]);
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputNumberScreen()));
  }
}
