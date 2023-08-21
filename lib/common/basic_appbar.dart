import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppbar extends StatelessWidget {
  final Widget widgets;
  final double padding;
  final String name;

  const BasicAppbar({
    required this.widgets,
    required this.padding,
    required this.name,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    title: Text(name, style: TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.w500)),
    ),
    body: SafeArea(
    bottom: true,
    child: Padding(
    padding: EdgeInsets.all(padding),
    child: widgets
    )
    )
    );
  }
}
