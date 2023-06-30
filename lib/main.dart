import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/start_screen.dart';
import 'package:univ_note/user/register/input_information_screen.dart';

void main() {
  runApp(
      ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          home: InputInformationScreen(),
        );
      }));
}
