import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProFileButton extends StatelessWidget {
  const ProFileButton({Key? key}) : super(key: key);

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
                      Text("홍길동",style: TextStyle(fontSize: 24.sp,color: Colors.black, fontWeight: FontWeight.w600)),
                      Text("명지대 정보통신공학과",style: TextStyle(fontSize: 16.sp,color: Colors.black, fontWeight: FontWeight.w400)),
                      Text("3학년 1학기",style: TextStyle(fontSize: 16.sp,color: Colors.black, fontWeight: FontWeight.w400))
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
