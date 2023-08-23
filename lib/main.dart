import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/search/activity_detail/activity_deatil_screen.dart';
import 'package:univ_note/search/search_detail/search_detail_screen.dart';
import 'package:univ_note/user/login/screen/login_screen.dart';
import 'package:univ_note/user/login_check_screen.dart';

void main() {
  runApp(
      ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          home: LoginScreen(),
        );
      }));
}

