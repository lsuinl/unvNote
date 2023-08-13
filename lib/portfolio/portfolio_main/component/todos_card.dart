import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodosCard extends StatelessWidget {
  final String name;
  final bool isChecked;
  final VoidCallback check;
  final String date;

  const TodosCard({
    required this.name,
    required this.isChecked,
    required this.check,
    required this.date,
    Key? key}) : super(key: key);

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
                Text(name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp)),
                Transform.scale(
                  scale: 1.7,
                  child:
                Checkbox(
                  side: BorderSide(
                    color:Colors.black12
                  ),
                    shape: CircleBorder(),
                    value: isChecked,
                    onChanged: (val){}))
              ],
            ),
                Container(color: Colors.black12,height: 1.5.h),
                SizedBox(height: 5.h),
                Text(" $date",style: TextStyle(color: Colors.black12,fontSize: 13.sp),textAlign:TextAlign.left,)
          ],
        )
    ));
    }
  }
