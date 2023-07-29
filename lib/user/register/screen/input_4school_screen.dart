import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univ_note/common/basic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/common/check_string.dart';
import 'package:univ_note/user/register/screen/input_5inyear_screen.dart';
import 'package:univ_note/user/register/screen/search_school_screen.dart';

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
bool errorstring=false;
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
                      errorstring==true ?Padding(padding: EdgeInsets.symmetric(vertical: 5.h) ,child:Text("형식이 올바르지 않습니다.",style: TextStyle(color: Colors.red))):Container()
                    ])
            ),
    Column(
    children:[
    SizedBox(
    //박스사이즈 늘리기 Container 또는 Row 가능,
    width: double.infinity,
    child:
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: check==false ? Colors.black54: Colors.blueAccent,
    elevation: 3,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(15)),
    onPressed: () async {
    //문자열체크불합격
      if(!CheckMajor(major.text)|| !CheckName(name.text) || school.text=="")
      setState(() {
      errorstring=true;
    });
    else if(check==true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("univ", school.text);
        prefs.setString("department", major.text);
        prefs.setString("name", name.text);
        screenchange();
      }
    },
    child: Text('다음', style: TextStyle(fontSize: 15.sp),)
    ),),
    SizedBox(height: 30.h),
    ]
    )
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
          onTap: (){
            print(school.text);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchSchoolScreen(school: school)));
          },
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
