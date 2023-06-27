import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(15)),
        onPressed: () async {},
        child: Text('다음',)
    );
  }
}
