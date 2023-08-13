import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_main/component/category_button.dart';
import 'package:univ_note/portfolio/portfolio_main/component/todos_card.dart';
import 'package:univ_note/portfolio/todos_list/component/add_todos_button.dart';

import 'component/category_year_button.dart';

class TodosListScreen extends StatefulWidget {
  const TodosListScreen({Key? key}) : super(key: key);

  @override
  State<TodosListScreen> createState() => _TodosListScreenState();
}

class _TodosListScreenState extends State<TodosListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("목표 체크리스트", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
    ),
    body: SafeArea(
    bottom: true,
    child: Padding(
      padding: EdgeInsets.all(10),
      child:Stack(
      children: [
        Column(
          children: [
            Row(children: [
              CategoryYearButton(name: "2021", lists:[], set: (){}),
              CategoryYearButton(name: "2022", lists:[], set: (){}),
              CategoryYearButton(name: "2023", lists:[], set: (){})
            ],),
            TodosCard(name: "자격증 따기!", isChecked: true, check: (){}, date: '2022-01-03'),
            TodosCard(name: "프로젝트 완성하기!", isChecked: false, check: (){}, date: '2022-01-03'),
          ],
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child:AddTodosButton()
        )
      ],
    )
    )));
  }
}
