import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../todos_list_screen.dart';

class CategoryYearButton extends StatefulWidget {
  final String name;
  final VoidCallback set;

  const CategoryYearButton({
    required this.name,
    required this.set,
    Key? key}) : super(key: key);

  @override
  State<CategoryYearButton> createState() => _CategoryYearButtonState();
}

class _CategoryYearButtonState extends State<CategoryYearButton> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      InputChip(
        pressElevation: 0,
        onPressed: (){
          setState(() {
            buttoncolor.forEach((key, value) {
              buttoncolor[key]=false;
            });
            buttoncolor[widget.name]=true;
            if(widget.name=="전체보기")
              year="";
            else
              year=widget.name;
          });
          widget.set();
          print("불러옴");
        },
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(widget.name, style:
          TextStyle(fontSize: 14.sp,
              color:buttoncolor[widget.name]==true ? Color(0xFF3C8FEE):Colors.black87,
              fontWeight: FontWeight.w300)
          ),
        ),
        backgroundColor: buttoncolor[widget.name]==true ? Color(0xFFE8F2FD): Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                11.r)),
        side: BorderSide(
            color:buttoncolor[widget.name]==true ? Color(0xFF3C8FEE):Colors.black26)
    ),
    SizedBox(width: 10.w,)
    ]
    );
  }
}
