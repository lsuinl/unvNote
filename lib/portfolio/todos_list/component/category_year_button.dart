import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryYearButton extends StatelessWidget {
  final String name;
  final List<Widget> lists;
  final VoidCallback set;

  const CategoryYearButton({
    required this.name,
    required this.lists,
    required this.set,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      InputChip(
        pressElevation: 0,
        onPressed: set,
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(name, style: TextStyle(fontSize: 14.sp, color: Colors.black87,fontWeight: FontWeight.w300)),
        ),
        backgroundColor:Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                11.r)),
        side: BorderSide(
            color:Colors.black26)
    ),
    SizedBox(width: 10.w,)
    ]
    );
  }
}
