import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/common/basic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/login/screen/login.dart';
import 'package:univ_note/user/register/quest/post_signup.dart';

import '../../../home/screen/home_screen.dart';
import '../common/check_string.dart';

class InputOutyearScreen extends StatefulWidget {
  const InputOutyearScreen({Key? key}) : super(key: key);

  @override
  State<InputOutyearScreen> createState() => _InputOutyearScreenState();
}

TextEditingController texting = TextEditingController();
String title = "졸업연도를 입력하세요.";
bool check=true;
bool errorstring=false;
final year =[2023,2024,2025,2026,2027,2028,2029,2030];
final month = [2,8];
String _selectyear = year[0].toString();
String _selectmonth = month[0].toString();

class _InputOutyearScreenState extends State<InputOutyearScreen> {
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
                      inputdropnumbers(),
                      errorstring==true ?Padding(padding: EdgeInsets.symmetric(vertical: 5.h) ,child:Text("입학년도 이후로 설정해야 합니다.",style: TextStyle(color: Colors.red))):Container()
                    ])
            ),
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
                        onPressed: () async {
                          //문자열체크불합격
                          if(await CheckExpectedGraduationDate((_selectyear+"0"+ _selectmonth).toString())==false){
                            setState(() {
                              errorstring=true;
                            });
                          }
                          else if(check==true) {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString("expectedGraduationDate", (_selectyear +"0"+ _selectmonth).toString());
                            //int signUpCheck= await PostSignUp();
                            // if(signUpCheck==true)
                            //   screenchange();
                            // else
                            //   print("회원가입 문제 발생");
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
//입학연도, 졸업연도
  Widget inputdropnumbers(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex:1,
            child: DropdownButton(
              value: _selectyear,
              items: year
                  .map((e) => DropdownMenuItem(
                value: e.toString(), // 선택 시 onChanged 를 통해 반환할 value
                child: Text(e.toString()),
              ))
                  .toList(),
              onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                setState(() {
                  _selectyear = value!;
                });
              },
            )),
        Flexible(
            flex: 4,
            child:  DropdownButton(
              value: _selectmonth,
              items: month.map((e) => DropdownMenuItem(
                value: e.toString(), // 선택 시 onChanged 를 통해 반환할 value
                child: Text(e.toString()),
              )).toList(),
              onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                setState(() {
                  _selectmonth = value!;
                });
              },
            ))
      ],
    );
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
