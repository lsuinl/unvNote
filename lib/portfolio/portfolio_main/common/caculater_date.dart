import 'package:intl/intl.dart';

String CaculaterDate(String end){
  DateTime date = DateFormat("yyyy-MM-dd").parse(end);
  DateTime now = DateTime.now();
  int different=date.difference(now).inDays;
  int grade = 4-(different/365).toInt();
  int gkrrl = (different%365)>150 ? 1 :2;
  return "${grade}학년 ${gkrrl}학기";
}