import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/login/quest/post_login.dart';
import 'package:univ_note/user/register/screen/input_1email_screen.dart';

import '../../../home/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController Idcontroller = TextEditingController();
TextEditingController Passwardcontroller = TextEditingController();
String title = "이메일 주소를 입력하세요.";
bool check = false;
String errorstring="";

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 10,
        widgets: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 100.w),
              child:Image.network("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg",width: 150.h),),
    Text("이메일",style: TextStyle(fontSize:15.sp)),
            inputtext('이메일을 입력해주세요',Idcontroller),
            SizedBox(height: 20.h),
            Text("비밀번호",style: TextStyle(fontSize:15.sp)),
            inputtext('비밀번호를 입력해주세요.',Passwardcontroller),
          Text(errorstring,style: TextStyle(color: Colors.red)),
          SizedBox(height: 40.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: check == false ? Colors.black54 : Colors.blueAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(15)),
                onPressed: () async{
                  String errortext= await PostLogin(Idcontroller.text, Passwardcontroller.text);
                  if(errortext!="ok"){
                    setState(() {
                      errorstring=errortext;
                    });
                  }
                  else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => new HomeScreen(selectedIndex: 0)));
                  }
                },
                child: Text('로그인', style: TextStyle(fontSize: 15.sp),
                )),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(15)),
                onPressed: screenchange,
                child: Text('회원가입', style: TextStyle(fontSize: 15.sp,color: Colors.black54),)
            ),
          ),
    ]));
  }
  Widget inputtext(String hinttext, TextEditingController controller) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        obscureText:  hinttext=="비밀번호를 입력해주세요." ?true:false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hinttext,
        ),
        onChanged: (text) {
          setState(() {
            if (Idcontroller.text!="" && Passwardcontroller.text!="")
              check = true;
            else
              check = false;
          });
        },
        controller: controller,
      )
    ]);
  }
  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputEmailScreen()));
  }
}
