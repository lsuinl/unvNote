import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inputfield extends StatefulWidget {
  final String title;
  final TextEditingController name;
  final VoidCallback textchange;

  const inputfield({
    required this.title,
    required this.name,
    required this.textchange,
    Key? key}) : super(key: key);

  @override
  State<inputfield> createState() => _inputfieldState();
}
final year =[2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030];
final month = [1,2,3,4,5,6,7,8,9,10,11,12];
String _selectyear = year[18].toString();
String _selectmonth = month[7].toString();

class _inputfieldState extends State<inputfield> {
  @override
  Widget build(BuildContext context) {
    Widget field = selectfield();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 130.h),
          Text(widget.title, style: TextStyle(fontSize: 22.sp)),
          SizedBox(height: 10.h),
          field,
        ]);
  }
  Widget selectfield(){
    if(widget.title=="이메일 주소를 입력하세요.")
      return inputtext("email");
    else if(widget.title=="비밀번호를 입력하세요.")
      return inputtext("password");
    else if(widget.title=="메일로 전송된 \n4자리코드를 입력하세요.")
      return inputnumber();
    else if(widget.title=="학사정보를 입력하세요.")
      return inputschool();
    else
      return inputdropnumbers();
  }

  //이메일, 비밀번호(조금 변경)
  Widget inputtext(String type){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          TextField(
            decoration: InputDecoration(
              enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
              hintText: type=="email" ? "hello@naver.com":"********",
            ),
            controller:widget.name,
            onChanged: (content) => widget.textchange(),
            maxLength:type=="email" ? null : 16 ,
          ),
          type=="email" ? Container():Text("영어, 숫자, 특수문지 모두 포함", style: TextStyle(fontSize: 12.sp))
        ]);
  }
  //메일인증번호
  Widget inputnumber(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child:
        Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:
            Center(child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 75.sp),
              decoration: InputDecoration(
                 border: InputBorder.none,
                counterText:'',
              ),
              controller: widget.name,
              onChanged: (content) => widget.textchange(),
              maxLength: 1,
            ),))
        ),
    Container(
    height: 70.h,
    width: 70.w,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(20),
    ),
    child:
    Center(child: TextField(
    textAlignVertical: TextAlignVertical.center,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 75.sp),
    decoration: InputDecoration(
    border: InputBorder.none,
    counterText:'',
    ),
    controller: widget.name,
    onChanged: (content) => widget.textchange(),
    maxLength: 1,
    ),)),
    Container(
    height: 70.h,
    width: 70.w,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(20),
    ),
    child:
    Center(child: TextField(
    textAlignVertical: TextAlignVertical.center,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 75.sp),
    decoration: InputDecoration(
    border: InputBorder.none,
    counterText:'',
    ),
    controller: widget.name,
    onChanged: (content) => widget.textchange(),
    maxLength: 1,
    ),)),
    Container(
    height: 70.h,
    width: 70.w,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(20),
    ),
    child:
    Center(child: TextField(
    textAlignVertical: TextAlignVertical.center,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 75.sp),
    decoration: InputDecoration(
    border: InputBorder.none,
    counterText:'',
    ),
    controller: widget.name,
    onChanged: (content) => widget.textchange(),
    maxLength: 1,
    ),))
      ],
    );
  }
  //학사정보
  Widget inputschool(){
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
            hintText: "대학교",
          ),
          controller: widget.name,
          onChanged: (content) => widget.textchange(),
          // maxLength: 9,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
            hintText: "학과",
          ),
          controller: widget.name,
          onChanged: (content) => widget.textchange(),
          // maxLength: 9,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
            hintText: "이름",
          ),
          controller: widget.name,
          onChanged: (content) => widget.textchange(),
          // maxLength: 9,
        ),
      ],
    );
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
}
