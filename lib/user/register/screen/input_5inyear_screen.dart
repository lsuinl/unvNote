import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/screen/input_6outyear_screen.dart';

class InputInyearScreen extends StatefulWidget {
  const InputInyearScreen({Key? key}) : super(key: key);

  @override
  State<InputInyearScreen> createState() => _InputInyearScreenState();
}

TextEditingController texting = TextEditingController();
String title = "입학연도를 입력하세요.";
bool check=true;
final year =[2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023];
final month = [2,8];
String _selectyear = year[0].toString();
String _selectmonth = month[0].toString();

class _InputInyearScreenState extends State<InputInyearScreen> {
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
        context, MaterialPageRoute(builder: (context) => InputOutyearScreen()));
  }
}
