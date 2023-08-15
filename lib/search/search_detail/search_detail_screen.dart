import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';

class SearchDeatilScreen extends StatefulWidget {
  const SearchDeatilScreen({Key? key}) : super(key: key);

  @override
  State<SearchDeatilScreen> createState() => _SearchDeatilScreenState();
}

class _SearchDeatilScreenState extends State<SearchDeatilScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        widgets: Text("더보기 화면"),
        paddings: 0
    );
  }
}
