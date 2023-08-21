import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/portfolio/todos_list/todos_list_screen.dart';

class MoveTodoListButton extends StatelessWidget {
  const MoveTodoListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              TodosListScreen())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("목표 체크리스트",style: TextStyle(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w700)),
          Icon(Icons.arrow_forward_ios,color: Colors.black12,
            shadows: [
              Shadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ],)
        ],)
    );
  }
}
