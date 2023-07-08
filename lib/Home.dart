import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(widgets: Container(), paddings: 10);
  }
}
