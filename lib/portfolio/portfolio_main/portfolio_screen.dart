
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:univ_note/common/util.dart';
import 'package:univ_note/portfolio/portfolio_main/common/caculater_percent.dart';
import 'package:univ_note/portfolio/portfolio_main/component/d_day_button.dart';
import 'package:univ_note/portfolio/portfolio_main/component/move_todoslist_button.dart';
import 'package:univ_note/portfolio/portfolio_main/component/percent_view.dart';
import 'package:univ_note/portfolio/portfolio_main/component/profile_card.dart';
import 'package:univ_note/portfolio/portfolio_main/component/todos_card.dart';
import 'package:univ_note/portfolio/portfolio_main/quest/get_todos_only_true.dart';
import 'package:univ_note/setting/setting_main/component/profile_button.dart';

import '../../common/basic.dart';
import '../../user/register/model/user_information.dart';
import 'common/find_start_or_end.dart';
import 'common/set_start_dday.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({Key? key}) : super(key: key);

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}
late UserInformation? user=null;
List<Widget> todos= [
  Container(
    height: 100.h,
  child: Center(child: Text("설정된 목표가 없습니다.")))];
class _PortFolioScreenState extends State<PortFolioScreen> {
  @override
  void initState() {
    loadingHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(user==null) {
      return CircularProgressIndicator();
    }
    else
      return Basic(
          paddings: 10,
          widgets: ListView(
              children: [
                ProFileCard(name: user!.name,
                    school: user!.univ,
                    major: user!.department,
                    end: user!.expectedGraduationDate),
                SizedBox(height: 10.h),
                D_DayButton(name: CaculaterClass(user!.classDday),
                    clas: user!.classDday,
                    grad: false,
                    state: state),
                SizedBox(height: 10.h),
                PercentView(percent: CaculaterPercent(
                    SetStartAndPercent(user!.classDday), user!.classDday)),
                SizedBox(height: 10.h),
                D_DayButton(name: "졸업 🎓",
                    clas: user!.expectedGraduationDate,
                    grad: true,
                    state: state),
                SizedBox(height: 10.h),
                PercentView(percent: CaculaterPercent(
                    user!.admissionDate, user!.expectedGraduationDate)),
                SizedBox(height: 10.h),
                Container(height: 2.h, color: Colors.black12),
                SizedBox(height: 10.h),
                MoveTodoListButton(),
                Column(
                  children: todos,
                )
              ]
          ));
  }
  loadingHome() async {
    var inuser =await GetUserInformation();
    List<dynamic> intodos= await GetTodosTrue();
    List<Widget> list= intodos.map((e) => TodosCard(
          id: e['id'],
          name: e['content'],
          isChecked: e['isChecked'],
          check: state,
          date: e['year'])).toList();

    setState(() {
      user=inuser;
      if(list.length>0)todos = list;
    });
  }

  state() async {
    List<dynamic> intodos= await GetTodosTrue();
    List<Widget> list= intodos.map((e) => TodosCard(
        id: e['id'],
        name: e['content'],
        isChecked: e['isChecked'],
        check: state,
        date: e['year'])).toList();

    setState(() {
      if(list.length>0)todos= list;
    });
  }
}
