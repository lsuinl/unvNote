import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/user/register/screen/input_4school_screen.dart';

import '../quest/get_search_school.dart';

class SearchSchoolScreen extends StatefulWidget {
  final TextEditingController school;
  const SearchSchoolScreen({
   required this.school,
    Key? key}) : super(key: key);

  @override
  State<SearchSchoolScreen> createState() => _SearchSchoolScreenState();
}

List<Widget> schoollist = [];
class _SearchSchoolScreenState extends State<SearchSchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
      paddings: 10,
      widgets: Column(
        children: [
      TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        hintText: "대학교를 검색하세요",
      ),
    keyboardType: TextInputType.text,
    controller: school,
    onChanged: (text) async {
      List<dynamic> list= await GetSearchSchool(text);
        setState(() {
          schoollist = list.map((e) =>
          e['adres']!=""? TextButton(onPressed: (){
            school.text=e['schoolName'];
            Navigator.of(context).pop(school);
          }, child:Container(
                alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(e['schoolName'],style: TextStyle(color: Colors.black,fontSize:17.sp)),
                    Text(e['adres'],style: TextStyle(color: Colors.black))
                  ]
              ))
              ):Container()).toList();
        });
    },
    ),
          Expanded(child:
          ListView(
            children:schoollist
          ))
    ]
      ));
  }
}
