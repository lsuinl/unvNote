import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/portfolio/portfolio_main/common/caculater_date.dart';
import 'package:univ_note/user/register/model/user_information.dart';

class ProFileCard extends StatelessWidget {
  final String name;
  final String school;
  final String major;
  final String end;
  const ProFileCard({
    required this.name,
    required this.school,
    required this.major,
    required this.end,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent[100],
            borderRadius: BorderRadius.circular(20)
        ),
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
          Row(
            children: [
              Icon(Icons.account_circle,size: 90.h,color: Colors.white),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: TextStyle(fontSize: 24.sp,color: Colors.white, fontWeight: FontWeight.w600)),
                  Text(school,style: TextStyle(fontSize: 16.sp,color: Colors.white, fontWeight: FontWeight.w400)),
                  Text(major,style: TextStyle(fontSize: 16.sp,color: Colors.white, fontWeight: FontWeight.w400)),
                  Text(CaculaterDate(end),style: TextStyle(fontSize: 16.sp,color: Colors.white, fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),)
    );
  }
}
