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
        body: Container(
          color: Colors.white,
            child: SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding: EdgeInsets.all(0),
                    child: widgets,
                )
            )
        )
    );
  }
}