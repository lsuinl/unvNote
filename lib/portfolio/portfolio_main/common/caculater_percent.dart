//디데이 퍼센트 알림설정
import 'package:intl/intl.dart';

double CaculaterPercent(String start, String end){
  DateTime starts = DateFormat("yyyy-MM-dd").parse(start);
  DateTime ends = DateFormat("yyyy-MM-dd").parse(end);
  int entire = ends.difference(starts).inDays;
  int percent = DateTime.now().difference(starts).inDays;
  return (percent/entire).abs();
}
