import 'package:flutter/material.dart';

import '../../write_note/note_screen.dart';

//글쓰기 버튼
class WritingButton extends StatelessWidget {
  const WritingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        child:
        Padding(
            padding: EdgeInsets.all(20),
            child: RawMaterialButton(
              onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          WriteNoteScreen())),
              elevation: 5.0,
              fillColor: Colors.blue[300],
              child: Icon(
                Icons.edit,
                size: 50.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            )
        )
    );
  }
}