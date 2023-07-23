import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/common/check_string.dart';
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
bool errorstring=false;
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
                      inputtext(),
                      errorstring==true ?Padding(padding: EdgeInsets.symmetric(vertical: 5.h) ,child:Text("형식이 올바르지 않습니다.\n비밀번호는 8~14자 사이의 특수문자,영문,숫자를 포함하여야 합니다.",style: TextStyle(color: Colors.red))):Container()
                    ])),
    Column(
    children:[
    SizedBox(
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
    if(CheckPassword(texting.text)==false)
      setState(() {
        errorstring=true;
      });
    else if(check==true)
      screenchange();
    },
    child: Text('다음', style: TextStyle(fontSize: 15.sp),)
    ),),
    SizedBox(height: 30.h),
    ]
    )
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
            controller: texting,
            keyboardType: TextInputType.text,
            obscureText: true,
            onChanged: (text) {
              setState(() {
                if(text.length>8) check=true;
                else false;
              });
            },
            maxLength:  14 ,
          )
        ]);
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputSchoolScreen()));
  }
}
