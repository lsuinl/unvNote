import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';

class NoteDeatilScreen extends StatelessWidget {
  const NoteDeatilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
    title: Text("교내활동 내용", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("도서관 서포터즈 활동", style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w600)),
          Text("2023-03-05~2023-07-22", style: TextStyle(fontSize: 14.sp, color: Colors.black26)),
          Container(height: 1, color: Colors.black26,),
      Flexible(
              child:     Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child:SingleChildScrollView(
                  child: Text("관리 업무를 맡으며 독서의 날에는 책자 접기 이벤트도 관리하였다. \n보람찬 활동이었다.", style: TextStyle(fontSize: 15.sp))
              ))
          )
        ],
      ),
    )
    );
  }
}
