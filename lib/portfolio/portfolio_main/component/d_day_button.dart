import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class D_DayButton extends StatelessWidget {
  final String name;
  final int number;

  const D_DayButton({
    required this.name,
    required this.number,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
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
            Text("D-$number",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w700)),
            Container(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.edit,color: Colors.black,)
            )
          ],
        )));
  }
}
