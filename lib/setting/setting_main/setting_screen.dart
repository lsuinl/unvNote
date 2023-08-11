import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/setting/setting_main/component/profile_button.dart';
import 'package:univ_note/user/register/model/user_information.dart';

import '../../common/basic.dart';
import '../../common/util.dart';
import 'component/menu_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> menuname=["개인/보안","알림설정","화면설정","테마","자주 묻는 질문","공지사항","기타","버전 확인"];
    List<Widget> menu= menuname.map((e) => MenuButton(name: e)).toList();

    return Basic(
        paddings: 10,
        widgets: ListView(
            children: [
              ProFileButton(),
              Column(children: menu,)
            ]
        ));
  }
}
