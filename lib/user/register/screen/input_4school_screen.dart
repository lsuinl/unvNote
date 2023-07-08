import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/component/nextbutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/screen/input_5inyear_screen.dart';

class InputSchoolScreen extends StatefulWidget {
  const InputSchoolScreen({Key? key}) : super(key: key);

  @override
  State<InputSchoolScreen> createState() => _InputSchoolScreenState();
}

TextEditingController school = TextEditingController();
TextEditingController major = TextEditingController();
TextEditingController name = TextEditingController();
String title = "학사정보를 입력하세요.";
bool check=false;
class _InputSchoolScreenState extends State<InputSchoolScreen> {
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
                      inputschool(),
                    ])
            ),
            NextButton(check: check, screenchange: screenchange)
          ],
        ));
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
          keyboardType: TextInputType.text,
          controller: school,
          onChanged: (text){
            setState(() {
              if(school.text!=""&& name.text!="" && major.text!="") check=true;
              else false;
            });
          },
        ),
        SizedBox(height: 20.h),
        TextFormField(
          decoration: InputDecoration(
            counterText: '',
            enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
            hintText: "학과",
          ),
          keyboardType: TextInputType.text,
          controller: major,
          onChanged: (text){
            setState(() {
              if(school.text!=""&& name.text!="" && major.text!="") check=true;
              else false;
            });
          },
          maxLength: 15,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
            hintText: "이름",
          ),
          keyboardType: TextInputType.text,
          controller: name,
          onChanged: (text){
            setState(() {
              if(school.text!=""&& name.text!="" && major.text!="") check=true;
              else false;
            });
          },
          // maxLength: 9,
        ),
      ],
    );
  }

  screenchange() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputInyearScreen()));
  }
}
