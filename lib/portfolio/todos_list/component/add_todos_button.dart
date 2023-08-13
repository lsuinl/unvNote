import 'package:flutter/material.dart';

class AddTodosButton extends StatelessWidget {
  const AddTodosButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: RawMaterialButton(
          onPressed: (){},
          elevation: 5.0,
          fillColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 50.0,
            color: Color(0xFFB0C4DE),
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(
              side: BorderSide(
                  width: 2,
                  color: Colors.lightBlueAccent
              )
          ),
        )
    );
  }
}
