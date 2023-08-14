import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_main/component/category_button.dart';
import 'package:univ_note/portfolio/portfolio_main/component/todos_card.dart';
import 'package:univ_note/portfolio/todos_list/component/add_todos_button.dart';
import 'package:univ_note/portfolio/todos_list/component/todos_card_input.dart';
import 'package:univ_note/portfolio/todos_list/quest/delete_todos_id.dart';
import 'package:univ_note/portfolio/todos_list/quest/get_todos.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'quest/post_todos.dart';
import 'component/category_year_button.dart';

class TodosListScreen extends StatefulWidget {
  const TodosListScreen({Key? key}) : super(key: key);

  @override
  State<TodosListScreen> createState() => _TodosListScreenState();
}
//List<Widget> list=[ TodosCardInput()];
//Map<String,bool> buttoncolor ={"전체보기":true};

class _TodosListScreenState extends State<TodosListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetTodos(),
        builder:(context,snapshot){
          if(snapshot.hasData) {
            List<dynamic> data = snapshot.data!;
            List<TodosCardInput> lists = data.map((e) => //데이터 위젯리스트화하기
               TodosCardInput(
                isPatch: true,
                id: e['id'],
                name: e['content'],
                isChecked: e['isChecked'],
                check: (){},
                date: e['year'])).toList();
            List<SwipeActionCell> list=[]; //실제 나타낼 데이터
            for(int i=0;i<data.length;i++){
              list.add(SwipeActionCell(
                  key: ObjectKey(lists[i]),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                        title: "delete",
                        onTap: (CompletionHandler handler) async {
                          DeleteTodosId(lists[i].id!);
                          lists.removeAt(i);
                          setState(() {
                          });
                        },
                        color: Colors.red),
                  ],
                  child:lists[i]));

            }
            return Scaffold(
                appBar: AppBar(
                    title: Text("목표 체크리스트", style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w500))
                ),
                body: SafeArea(
                    bottom: true,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(children: [
                                  CategoryYearButton(
                                      name: "2021", lists: [], set: () {}),
                                  CategoryYearButton(
                                      name: "2022", lists: [], set: () {}),
                                  CategoryYearButton(
                                      name: "2023", lists: [], set: () {})
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
                              child: AddTodosButton(onPressed: addTodos),
                            )
                          ],
                        )
                    )));
          }
          else
            return CircularProgressIndicator();
  });

  }
  void addTodos(){
    setState(() {
      // list.add(
      //     TodosCardInput()
      // );
    });
  }
}
