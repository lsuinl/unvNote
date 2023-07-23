import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/basic.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({Key? key}) : super(key: key);

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}

class _PortFolioScreenState extends State<PortFolioScreen> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 10,
        widgets: ListView(
          children: [
            Container(
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
                      Text("홍길동",style: TextStyle(fontSize: 24.sp,color: Colors.white, fontWeight: FontWeight.w600)),
                      Text("명지대 정보통신공학과",style: TextStyle(fontSize: 16.sp,color: Colors.white, fontWeight: FontWeight.w400)),
                      Text("3학년 1학기",style: TextStyle(fontSize: 16.sp,color: Colors.white, fontWeight: FontWeight.w400))
                    ],
                  )
                ],
              ),)
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 60.h),
                  primary: Colors.white,
                  side: BorderSide(
                      width: 0.2,
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("종강",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w500)),
                    Text("D-45",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w700)),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.edit,color: Colors.black,)
                    )
                  ],
                )),
            //퍼센트 커서+아이콘
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/123*70),
                Icon(Icons.run_circle,size: 50.r,color: Colors.blue,),
              ],
            ),
            LinearPercentIndicator(
              barRadius: Radius.circular(10),
              percent: 0.7,
              animation: true,
              center: Text("70%"),
              animationDuration:1400,
              progressColor: Colors.blue,
              lineHeight: 15.h,
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 60.h),
                    primary: Colors.white,
                    side: BorderSide(
                      width: 0.2,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("졸업",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w500)),
                    Text("D-450",style: TextStyle(color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w700)),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.edit,color: Colors.black)
                    )
                  ],
                )),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/123*50),
                Icon(Icons.run_circle,size: 50.r,color: Colors.blue),
              ],
            ),
            LinearPercentIndicator(
              barRadius: Radius.circular(10),
              percent: 0.5,
              animation: true,
              center: Text("50%"),
              animationDuration:1400,
              progressColor: Colors.blue,
              lineHeight: 15.h,
            ),
            SizedBox(height: 10.h),
            Text("나의 목표",style: TextStyle(color: Colors.black54, fontSize: 28.sp, fontWeight: FontWeight.w500)),
          Card(
              child: CheckboxListTile(
            title: Text("ㅇㅇ"),
            value: isChecked,
            onChanged: (val) {},
          )),
        ]
    ));
  }
}
