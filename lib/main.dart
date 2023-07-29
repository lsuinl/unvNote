import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/home/screen/home_screen.dart';
import 'package:univ_note/start/screen/start_screen.dart';
import 'package:univ_note/user/login/screen/login_screen.dart';
import 'package:univ_note/user/register/screen/ending_screen.dart';
import 'package:univ_note/user/register/screen/input_1email_screen.dart';
import 'package:univ_note/user/register/screen/input_4school_screen.dart';
import 'package:univ_note/user/register/screen/input_6outyear_screen.dart';

void main() {
  runApp(
      ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          home: InputOutyearScreen(),
        );
      }));
}

