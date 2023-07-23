import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(paddings: 0, widgets: Text("나는노트"));
  }
}
