import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/portfolio/portfolio_main/portfolio_screen.dart';

import '../quest/patch_todos_check_id.dart';


class TodosCard extends StatefulWidget {
  final String name;
  final bool isChecked;
  final VoidCallback check;
  final String date;
  final String id;

  const TodosCard({
    required this.name,
    required this.isChecked,
    required this.check,
    required this.date,
    required this.id,
    Key? key}) : super(key: key);

  @override
  State<TodosCard> createState() => _TodosCardState();
}

class _TodosCardState extends State<TodosCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.grey,
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            width: 1,
            color: Colors.black12
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp)),
                Transform.scale(
                  scale: 1.7,
                  child:
                Checkbox(
                  side: BorderSide(
                    color:Colors.black12
                  ),
                    shape: CircleBorder(),
                    value: widget.isChecked,
                    onChanged: (val) async {
                      await PatchTodosCheckId(widget.id);
                      setState(() {
                        isChecked[widget.id]=!val!;
                      });
                      widget.check();
                    }))
              ],
            ),
                Container(color: Colors.black12,height: 1.5.h),
                SizedBox(height: 5.h),
                Text(" ${widget.date}",style: TextStyle(color: Colors.black12,fontSize: 13.sp),textAlign:TextAlign.left,)
          ],
        )
    ));
    }
  }
