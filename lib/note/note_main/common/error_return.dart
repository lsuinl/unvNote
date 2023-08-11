import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../user/login/screen/login_screen.dart';

class ErrorReturn extends StatelessWidget {
  final int errorCode;
  const ErrorReturn({
    required this.errorCode,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorCode == 401) {//에러처리
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
      Fluttertoast.showToast(msg: "로그인이 만료되었습니다. 다시 로그인 해주세요.");
      return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
    }
    else if (errorCode == 404)
      return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
    else return Container();
  }
}
