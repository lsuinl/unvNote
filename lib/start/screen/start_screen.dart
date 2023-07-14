import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
//Futurebuilder처리. 데이터 불러오고 이동.
  @override
  Widget build(BuildContext context) {
    return Basic(
      paddings: 10,
      widgets: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("안녕하세여", style: TextStyle(fontSize: 30.sp)),
          Image.network("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg")
        ],
      )
    );
  }
}