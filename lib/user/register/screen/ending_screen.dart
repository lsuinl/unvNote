import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:univ_note/user/login/screen/login_screen.dart';

class EndingScreen extends StatelessWidget {
  const EndingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route)=>false);
    });
    return Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("회원가입이 완료되었습니다!",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),),
           SizedBox(height:50.h),
           LoadingAnimationWidget.inkDrop(
             color: Colors.blue[400]!,
             size: 200,
           ),
         ],
        )
    ));
  }
}
