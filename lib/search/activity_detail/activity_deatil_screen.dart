import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic_appbar.dart';
import 'package:univ_note/search/search_main/component/activity_card.dart';

import 'component/activity_detail_card.dart';
import 'component/review_card.dart';

class ActivityDeatilScreen extends StatelessWidget {
  const ActivityDeatilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
        padding: 0,
        name: "대외활동",
      widgets: SingleChildScrollView(
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityDetailCard(),
          Padding(padding: EdgeInsets.all(15),
              child:Text("링크", style: TextStyle(fontSize: 18.sp),)),
          Container(height: 4.h, color: Color(0xFFD9D9D9),),
          Padding(padding: EdgeInsets.all(15),
              child:Text("활동 후기",textAlign: TextAlign.left, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),)),
          ReviewCard()
        ],
    ),
    ));
  }
}
