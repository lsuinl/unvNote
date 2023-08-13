import 'package:intl/intl.dart';

String SetStartAndPercent(String end){
  DateTime ends = DateFormat("yyyy-MM-dd").parse(end);
  int date =ends.month;
  if(date==2||date==3||date==8||date==9)
    return ends.subtract(Duration(days: 75)).toString().substring(0,10);
  else
   return ends.subtract(Duration(days: 105)).toString().substring(0,10);
}