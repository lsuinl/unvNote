import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Basic(
      paddings: 10,
      widgets: Column(
        children: [
          Text("안녕하세여", style: TextStyle(fontSize: 30.sp)),
          Image.network("https://kr.freepik.com/free-icon/search_14027416.htm")
        ],
      )
    );
  }
}