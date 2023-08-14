import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/portfolio/portfolio_main/common/caculater_d_day.dart';

class D_DayButton extends StatelessWidget {
  final String name;
  final String clas;
  final bool grad;
  final VoidCallback state;

  const D_DayButton({
    required this.name,
    required this.clas,
    required this.grad,
    required this.state,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number =CaculaterEnd(clas.substring(0,10));
    return ElevatedButton(
        onPressed: (){
      showCupertinoDialog(
          context: context,
          barrierDismissible: true, //해당 창 외에 다른 화면을 누르면 닫히게!!
          builder: (BuildContext context) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.white,
                  height: 300,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateFormat("yyyy-MM-dd").parse(clas), //초기날짜
                    maximumDate: DateTime(2035, 03, 31,),
                    onDateTimeChanged: (DateTime date) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                     if(grad==true){
                       //데이터 전송 api(졸업)
                       prefs.setString("expectedGraduationDate", date.toString().substring(0,10));
                     }
                     else{
                       //데이터 전송 api (종/개강)
                       prefs.setString("Class_D_day", date.toString().substring(0,10));
                     }
                     state();
                    }, //날짜나 시간이 바뀌었을 때,
                  )),
            );
        },);},
        style: ElevatedButton.styleFrom(
            minimumSize: Size(100.w, 60.h),
            primary: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              width: 1.5,
              color: Colors.black12
            )
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w500)),
            Text(number<0 ?"D+${number*(-1)}":"D-$number",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w700)),
            Container(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.edit,color: Colors.black,)
            )
          ],
        )));
  }
}
