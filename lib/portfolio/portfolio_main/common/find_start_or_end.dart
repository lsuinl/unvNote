import 'package:intl/intl.dart';

//종강 개강 찾기
String CaculaterClass(String end){
  DateTime ends = DateFormat("yyyy-MM-dd").parse(end);
  int date = ends.month;
  if(date==2||date==3||date==8||date==9)
    return " 개강 ✨";
  else
    return " 종강 ✨";
}