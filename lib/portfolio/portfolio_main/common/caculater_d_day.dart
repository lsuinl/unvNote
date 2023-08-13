import 'package:intl/intl.dart';
import 'package:univ_note/user/register/screen/input_5inyear_screen.dart';
import 'dart:math';

//기본 종강개강
String SetClassDate(){
  DateTime ends = DateTime.now();
  String result="";
  int compare=200;
  DateTime one = DateTime(ends.year,09,01);
  DateTime two = DateTime(ends.year,12,15);
  DateTime three = DateTime(ends.year==12? ends.year+1:ends.year,03,01);
  DateTime four = DateTime(ends.year,6,15);

  if(one.difference(ends).inDays<compare &&one.difference(ends).inDays>0) {
    compare = one.difference(ends).inDays;
    result = "${ends.year}-09-01";
  }
  if(two.difference(ends).inDays<compare&&two.difference(ends).inDays>0){
    compare=two.difference(ends).inDays;
  result = "${ends.year}-12-15";
  }
  if(three.difference(ends).inDays<compare&&three.difference(ends).inDays>0) {
    compare = three.difference(three).inDays;
    result = "${ends.year == 12 ? ends.year + 1 : ends.year}-03-01";
  }
  if(four.difference(ends).inDays<compare&&four.difference(ends).inDays>0) {
    compare = four.difference(ends).inDays;
    result = "${ends.year}-06-15";
  }
  print(result);
  return result;
}
//종강 개강 찾기
String CaculaterClass(String end){
  DateTime ends = DateFormat("yyyy-MM-dd").parse(end);
  int date = ends.month;
  if(date==2||date==3||date==8||date==9)
    return " 개강 ✨";
  else
    return " 종강 ✨";
}
//d-day 리턴하기
int CaculaterEnd(String end){
  DateTime date = DateFormat("yyyy-MM-dd").parse(end);
  DateTime now = DateTime.now();
  int different=date.difference(now).inDays;
  return different;
}