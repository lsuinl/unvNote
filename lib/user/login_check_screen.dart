import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/home/home/home_screen.dart';
import 'package:univ_note/search/get_activities_recommend_save.dart';

import 'login/screen/login_screen.dart';

class LoginCheckScreen extends StatelessWidget {
  const LoginCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetActivitesRecommentSave(),
        builder:(context, snapshot) {
        if(snapshot.hasData) {
          if (snapshot.data == 200)
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) => HomeScreen(selectedIndex: 0)), (
                  route) => false);
          else
            Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), (
                      route) => false);
        }
      return Basic(
          paddings: 10,
          widgets: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 250.h,),
                  SizedBox(height: 10.h),
                  Text('Voyage', style: GoogleFonts.gluten(fontSize: 45.sp,
                      color: Color(0xFF4895EF),
                      fontWeight: FontWeight.w600),),
                  SizedBox(height: 80.h),
                  LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.deepPurple, size: 40.r),
                  SizedBox(height: 10.h,),
                ],
              )
          )
      );
    })
    ;
  }
}
