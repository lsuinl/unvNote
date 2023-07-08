import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  final bool check;
  final VoidCallback screenchange;

  const NextButton({
    required this.check,
    required this.screenchange,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children:[
        SizedBox(
        //박스사이즈 늘리기 Container 또는 Row 가능,
        width: double.infinity,
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: check==false ? Colors.black54: Colors.blueAccent,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15)),
        onPressed: () {
          if(check==true) screenchange();
        },
        child: Text('다음', style: TextStyle(fontSize: 15.sp),)
    ),),
    SizedBox(height: 30.h),
    ]
    );
  }
}
