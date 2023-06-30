import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  final Widget widgets;
  final int paddings;

  const Basic({
    required this.widgets,
    required this.paddings,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
                top: true,
                bottom: true,
                child: Center(
                  child: Padding(
                  padding: EdgeInsets.all(paddings.toDouble()),
                    child: widgets,
                ))
            ));
  }
}