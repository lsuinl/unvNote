import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Home.dart';

class InputOutyearScreen extends StatefulWidget {
  const InputOutyearScreen({Key? key}) : super(key: key);

  @override
  State<InputOutyearScreen> createState() => _InputOutyearScreenState();
}

TextEditingController texting = TextEditingController();
String title = "졸업연도를 입력하세요.";
bool check=true;
final year =[2023,2024,2025,2026,2027,2028,2029,2030];
final month = [2,8];
String _selectyear = year[0].toString();
String _selectmonth = month[0].toString();

class _InputOutyearScreenState extends State<InputOutyearScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 10,
        widgets: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 130.h),
                      Text(title, style: TextStyle(fontSize: 22.sp)),
                      SizedBox(height: 10.h),
                      inputdropnumbers()
                    ])
            ),
            NextButton(check: check, screenchange: screenchange)
          ],
        ));
  }
//입학연도, 졸업연도
  Widget inputdropnumbers(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex:1,
            child: DropdownButton(
              value: _selectyear,
              items: year
                  .map((e) => DropdownMenuItem(
                value: e.toString(), // 선택 시 onChanged 를 통해 반환할 value
                child: Text(e.toString()),
              ))
                  .toList(),
              onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                setState(() {
                  _selectyear = value!;
                });
              },
            )),
        Flexible(
            flex: 4,
            child:  DropdownButton(
              value: _selectmonth,
              items: month.map((e) => DropdownMenuItem(
                value: e.toString(), // 선택 시 onChanged 를 통해 반환할 value
                child: Text(e.toString()),
              )).toList(),
              onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                setState(() {
                  _selectmonth = value!;
                });
              },
            ))
      ],
    );
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
