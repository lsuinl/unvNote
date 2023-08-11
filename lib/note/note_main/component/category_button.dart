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

          pressElevation: 0,
          onPressed: () =>widget.set(),
          label: Text(
            widget.name,
            style: TextStyle(fontSize: 14.sp, color: buttoncolor[widget.name]==true? Color(0xFF1C7DEC):Colors.black87)),
          backgroundColor: buttoncolor[widget.name]==true? Color(0xFFE8F2FD):Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8.r)),
          side: BorderSide(
              color: buttoncolor[widget.name]==true? Color(0xFF1C7DEC):Colors.black54)
          ),
        SizedBox(width: 10.w)
      ],
    );
  }
}
