import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../portfolio/portfolio_main/common/caculater_date.dart';

class ProFileButton extends StatelessWidget {
  final String name;
  final String school;
  final String major;
  final String end;

  const ProFileButton({
    required this.name,
    required this.school,
    required this.major,
    required this.end,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              // color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(20)
            ),
            height: 100.h,
            child: Padding(
              padding: EdgeInsets.all(10),
              child:
              Row(
                children: [
                  Icon(Icons.account_circle,size: 70.h,color: Colors.grey),
                  SizedBox(width: 10.w),
                  Expanded(child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(fontSize: 22.sp,color: Colors.black, fontWeight: FontWeight.w600)),
                      Text("$school \n$major",style: TextStyle(fontSize: 14.sp,color: Colors.black, fontWeight: FontWeight.w400)),
                      Text(CaculaterDate(end),style: TextStyle(fontSize: 14.sp,color: Colors.black, fontWeight: FontWeight.w400))
                    ],
                  )),
                  Container(
                      alignment: Alignment.centerRight,
                      child:Icon(Icons.arrow_forward_ios,color: Colors.black)
                  )
                ],
              ),)
        ),
      ],
    );
  }
}
