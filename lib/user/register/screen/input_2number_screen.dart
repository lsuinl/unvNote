import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/common/check_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/quest/post_verify_email_code.dart';
import 'package:univ_note/user/register/screen/input_3password_screen.dart';

class InputNumberScreen extends StatefulWidget {
  const InputNumberScreen({Key? key}) : super(key: key);

  @override
  State<InputNumberScreen> createState() => _InputNumberScreenState();
}

TextEditingController one = TextEditingController();
TextEditingController two = TextEditingController();
TextEditingController three = TextEditingController();
TextEditingController four = TextEditingController();

String title = "메일로 전송된\n4자리 코드를 입력하세요.";
bool check = false;
bool errorstring=false;

class _InputNumberScreenState extends State<InputNumberScreen> {
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
                      inputnumber(),
                      errorstring==true ?Padding(padding: EdgeInsets.symmetric(vertical: 5.h) ,child:Text("형식이 올바르지 않습니다.",style: TextStyle(color: Colors.red))):Container()
                    ])),
    Column(
    children:[
    SizedBox(
    //박스사이즈 늘리기 Container 또는 Row 가능,
    width: double.infinity,
    child:
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: check==false ? Colors.black54: Colors.blueAccent,
    elevation: 3,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(15)),
    onPressed: () {
    //문자열체크불합격
    if(CheckNumber(one.text+two.text+three.text+four.text)==false)          
      setState(() {
        errorstring=true;
      });
    else {
      // if(PostVerifyEmailCode(one.text+two.text+three.text+four.text)!=201){ //에러나면
      //   setState(() {
      //     errorstring=true;
      //   });
      // }
      // else
      screenchange();
    }
    },
    child: Text('다음', style: TextStyle(fontSize: 15.sp),)
    ),),
    SizedBox(height: 30.h),
    ]
    )
          ],
        ));
  }

//메일인증번호
  Widget inputnumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 75.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    controller: one,
                    textInputAction: TextInputAction.next,
                    maxLength: 1,
                  ),
                ))),
        Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 75.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                controller: two,
                maxLength: 1,
              ),
            )),
        Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 75.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                controller: three,
                maxLength: 1,
              ),
            )),
        Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 75.sp),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    if (text != "")
                      check = true;
                    else
                      check = false;
                  });
                },
                controller: four,
                maxLength: 1,
              ),
            ))
      ],
    );
  }

  screenchange() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InputPasswordScreen()));
  }
}
