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
import 'package:univ_note/setting/setting_main/component/profile_button.dart';

import '../../common/basic.dart';
import '../../user/register/model/user_information.dart';
import 'common/caculater_d_day.dart';
import 'common/find_start_or_end.dart';
import 'common/set_start_dday.dart';

class PortFolioScreen extends StatefulWidget {
  const PortFolioScreen({Key? key}) : super(key: key);

  @override
  State<PortFolioScreen> createState() => _PortFolioScreenState();
}

class _PortFolioScreenState extends State<PortFolioScreen> {
  bool isChecked=false;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  GetUserInformation(),
        builder:(context,snapshot){
        if(snapshot.hasData) {
          UserInformation user = snapshot.data!;
          return Basic(
              paddings: 10,
              widgets: ListView(
                  children: [
                    ProFileCard(name: user.name,
                        school: user.univ,
                        major: user.department,
                        end: user.expectedGraduationDate),
                    SizedBox(height: 10.h),
                    D_DayButton(name: CaculaterClass(user.classDday),clas: user.classDday,grad: false,state: state),
                    SizedBox(height: 10.h),
                    PercentView(percent: CaculaterPercent(SetStartAndPercent(user.classDday), user.classDday)),
                    SizedBox(height: 10.h),
                    D_DayButton(name: "졸업 🎓", clas: user.expectedGraduationDate,grad: true,state:state),
                    SizedBox(height: 10.h),
                    PercentView(percent: CaculaterPercent(user.admissionDate, user.expectedGraduationDate)),
                    SizedBox(height: 10.h),
                    Container(height: 2.h, color: Colors.black12),
                    SizedBox(height: 10.h),
                    MoveTodoListButton(),
                    TodosCard(name: "안녕하세요",
                      isChecked: isChecked,
                      check: () {},
                      date: "3학년 2학기",)
                  ]
              ));
        }
        else{
          return CircularProgressIndicator();
        }
    });
  }
  state(){
    setState(() {
    });
  }
}
