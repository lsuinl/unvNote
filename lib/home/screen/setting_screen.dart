import 'package:flutter/material.dart';

import '../../common/basic.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(paddings: 0, widgets: Text("나는설정"));
  }
}
