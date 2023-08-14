import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/home/home/home_screen.dart';
import 'package:univ_note/portfolio/todos_list/component/add_todos_button.dart';
import 'package:univ_note/portfolio/todos_list/component/todos_card_input.dart';
import 'package:univ_note/portfolio/todos_list/quest/delete_todos_id.dart';
import 'package:univ_note/portfolio/todos_list/quest/get_todos.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:univ_note/portfolio/todos_list/quest/get_year_category.dart';
import 'component/category_year_button.dart';

class TodosListScreen extends StatefulWidget {
  const TodosListScreen({Key? key}) : super(key: key);

  @override
  State<TodosListScreen> createState() => _TodosListScreenState();
}
List<Widget> list=[];
Map<String,bool> buttoncolor ={"전체보기":true};
Map<String,bool> todocheck ={};
String year="";
class _TodosListScreenState extends State<TodosListScreen> {
  ScrollController controller=ScrollController();

  @override
  void initState() {
    initList(year);
    getcategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> category=makebuttons();
    if(list.length>0) {
      return Scaffold(
          appBar: AppBar(
            leading:  IconButton(
                onPressed: () =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(selectedIndex: 0)),(route)=>false),
                icon: Icon(Icons.arrow_back_ios)),
              title: Text("목표 체크리스트", style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w500)),
          ),
          body: SafeArea(
              bottom: true,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(children: category),
                          Expanded(child:
                          SingleChildScrollView(
                            controller: controller,
                            child: Column(children: list)
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
  }

  //투두 생성하기
  void addTodos() async{
    setState(() {
      list.add(StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return TodosCardInput(check: set);
          }));
      controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds:1), curve: Curves.fastOutSlowIn,);
    });
  }
  set(){
    initList(year);
  }
  void initList(String year) async {
     //실제 나타낼 데이터
    List<dynamic> data = await GetTodos(year);
    data.map((e) =>
    todocheck[e['id']] = e['isChecked']
    ); //데이터 체크여부 바꿔주기
    List<TodosCardInput> widgets = data.map((e) => //데이터 위젯리스트화하기
    TodosCardInput(
        isPatch: true,
        id: e['id'],
        name: e['content'],
        isChecked: e['isChecked'],
        check:set,
        date: e['year'])).toList();
    setState(() {
      if(data.length==0)
        list=[Center(child:Text("작성된 목록이 없습니다"))];
      else {
        list=[];
        for (int i = 0; i < data.length; i++) {
          list.add(SwipeActionCell(
              key: ObjectKey(widgets[i]),
              trailingActions: <SwipeAction>[
                SwipeAction(
                    title: "delete",
                    onTap: (CompletionHandler handler) async {
                      DeleteTodosId(widgets[i].id!);
                     setState(() {
                       widgets.removeAt(i);
                       list.removeAt(i);
                     });
                    },
                    color: Colors.red),
              ],
              child: widgets[i]));
        }
      }
    });
  }

  void getcategory() async {
    List<dynamic> data = await GetYearCategory();
    setState(() {
      data.forEach((element) {
        buttoncolor[element.toString()]=false;
      });
    });
  }

  List<Widget> makebuttons() {
   List<Widget> list=[];
   buttoncolor.forEach((key, value) {
     list.add(
       CategoryYearButton(name: key,set: set,)
     );
   });
   return list;
  }
}
