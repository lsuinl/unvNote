import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_main/component/category_button.dart';
import 'package:univ_note/portfolio/portfolio_main/component/todos_card.dart';
import 'package:univ_note/portfolio/todos_list/component/add_todos_button.dart';
import 'package:univ_note/portfolio/todos_list/component/todos_card_input.dart';

import '../portfolio_main/quest/post_todos.dart';
import 'component/category_year_button.dart';

class TodosListScreen extends StatefulWidget {
  const TodosListScreen({Key? key}) : super(key: key);

  @override
  State<TodosListScreen> createState() => _TodosListScreenState();
}
List<Widget> list=[ TodosCardInput()];
//Map<String,bool> buttoncolor ={"전체보기":true};

class _TodosListScreenState extends State<TodosListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    builder:(context,snapshot){
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
          Flexible(child:
          ListView(
            children: list,
          )
          )
          ],
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child:AddTodosButton(onPressed: addTodos),
        )
      ],
    )
    )));
  });
  }
  void addTodos(){
    setState(() {
      list.add(
          TodosCardInput()
      );
    });
  }
}
