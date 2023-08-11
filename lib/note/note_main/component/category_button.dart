import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../note_screen.dart';

class CategoryButton extends StatefulWidget {
  final String name;
  final List<Widget> lists;
  final VoidCallback set;

  const CategoryButton({
    required this.name,
    required this.lists,
    required this.set,
    Key? key}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InputChip(
          onPressed: () =>widget.set(),
          label: Text(
            widget.name,
            style: TextStyle(fontSize: 14.sp),),
          backgroundColor: buttoncolor[widget.name]==true? Colors.blueAccent:Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8.r)),
          side: BorderSide(
              color: Colors.black54
          ),
        ),
        SizedBox(width: 10.w)
      ],
    );
  }
}
