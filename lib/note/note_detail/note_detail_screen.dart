import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_detail/quest/delete_records_id.dart';
import 'package:univ_note/note/note_detail/quest/get_records_id.dart';
import 'package:univ_note/note/write_note/note_screen.dart';

import '../../home/home/home_screen.dart';
import '../../user/login/screen/login_screen.dart';

class NoteDeatilScreen extends StatelessWidget {
  final String id;

  const NoteDeatilScreen({
    required this.id,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    title: Text("교내활동 내용", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
    ),
    body: SafeArea(
      bottom: true,
      child: FutureBuilder(
        future: GetRecordsId(id),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done) {
            if(snapshot.data==401) {
              Fluttertoast.showToast(msg: "로그인이 만료되었습니다. 다시 로그인 해주세요.");
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
            }
            else if(snapshot.data==404) return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
            else{
              dynamic data= snapshot.data;
              print(data);
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['title'], style: TextStyle(
                      fontSize: 27.sp, fontWeight: FontWeight.w600)),
                  Text('${data['start']} ~ ${data['end']}',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(height: 1, color: Colors.black26,) ),
                  Flexible(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SingleChildScrollView(
                                          child: Text(
                                              data['content'],
                                              style: TextStyle(
                                                  fontSize: 18.sp))))),
                              Container(height: 1, color: Colors.black26,),
                              Expanded(
                                  child:
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SingleChildScrollView(
                                          child: Text(
                                              data['impression'],
                                              style: TextStyle(
                                                  fontSize: 18.sp))))),
                              Container(height: 1, color: Colors.black26,),
                            ],
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            WriteNoteScreen(
                                                              isPatch: true,
                                                              id: data['id'],
                                                              category: data['category'],
                                                              title: data['title'],
                                                              content: data['content'],
                                                              impression: data['impression'],
                                                              start: data['start'],
                                                              end: data['end'],
                                                            )));
                                              }, child: Text("수정")),
                                    Container(height: 2.h,),
                                    TextButton(
                                        onPressed: () async {
                                          int stat = await DeleteRecords(id);
                                          if(stat==200){
                                            Fluttertoast.showToast(msg: "성공적으로 삭제되었습니다.");
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(selectedIndex: 2,)),(route)=>false);
                                          }
                                          else if(stat==401){
                                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route)=>false);
                                            Fluttertoast.showToast(msg: "로그인이 만료되었습니다. 다시 로그인 해주세요.");
                                          }
                                          else{
                                            Fluttertoast.showToast(msg: "작업을 진행하는 데 문제가 발생했습니다. 다시 시도해주세요.");
                                          }
                                        }, child: Text("삭제"))
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                  )
                ],
              ),
            );
          }}
          else
           return CircularProgressIndicator();
        } )));
  }
}
