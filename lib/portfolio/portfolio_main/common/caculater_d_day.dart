import 'package:intl/intl.dart';
import 'package:univ_note/user/register/screen/input_5inyear_screen.dart';
import 'dart:math';

//d-day 리턴하기
int CaculaterEnd(String end){
  DateTime date = DateFormat("yyyy-MM-dd").parse(end);
  DateTime now = DateTime.now();
  int different=date.difference(now).inDays;
  return different;
}