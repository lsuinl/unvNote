import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/portfolio/portfolio_main/common/caculater_d_day.dart';
import '../user/register/model/user_information.dart';

//유저 정보 가져오기.
Future<UserInformation> GetUserInformation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserInformation user = UserInformation(
      email: prefs.getString("email")??"",
      password: prefs.getString("password")??"",
      name: prefs.getString("name")??"",
      univ: prefs.getString("univ")??"",
      department: prefs.getString("department")??"",
      admissionDate: prefs.getString("admissionDate")??"",
      expectedGraduationDate: prefs.getString("expectedGraduationDate")??"",
      accessToken:prefs.getString("accessToken")??"",
      Class_D_day:prefs.getString("Class_D_day")??SetClassDate()
  );
  return user;
}
