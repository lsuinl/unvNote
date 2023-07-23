import 'package:flutter/material.dart';

import '../../common/basic.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(paddings: 0, widgets: Text("나는대외활동"));
  }
}
