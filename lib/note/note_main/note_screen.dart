import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_main/common/error_return.dart';
import 'package:univ_note/note/note_main/component/category_button.dart';
import 'package:univ_note/note/note_main/component/post_card.dart';
import 'package:univ_note/note/note_main/quest/get_records.dart';

import '../../user/login/screen/login_screen.dart';
import '../note_detail/note_detail_screen.dart';
import 'component/writing_button.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}
List<Widget> list=[];
Map<String,bool> buttoncolor ={"전체보기":true};


class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 0,
        widgets: FutureBuilder(
        future: GetRecords(),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.done) {
            if(snapshot.data.runtimeType==int)
              return ErrorReturn(errorCode: snapshot.data);
            else {
                List<dynamic> datas=snapshot.data!; //데이터 받아오기
                if(datas.length!=0){
                  Map<String,List<Widget>> categoryCard={};
                  List<Widget> EntireCards=[];
                  //카테고리이름넣기
                datas.forEach((e) => categoryCard[e['category']]=[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(e['category'], style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600)
                  ))]);
                //데이터카드 받아오기(카테고리별로 데이터가져오기)
                datas.forEach((e) => categoryCard[e['category']]!.add(PostCard(id: e['id'], title: e['title'], content: e['content'], start: e['start'], end:e['end'])));

                //전체가져오기
                categoryCard.values.forEach((element) {
                  EntireCards.addAll(element);
                  EntireCards.add(SizedBox(height: 10.h));
                });
                    //초기 버튼넣기
                    List<Widget> Buttons = [
                      CategoryButton(
                          name: "전체보기",
                          lists: EntireCards,
                          set: () {
                            setState(() {
                              buttoncolor.forEach(
                                  (key, value) => buttoncolor[key] = false);
                              buttoncolor['전체보기'] = true;
                              list = EntireCards;
                            });
                          })
                    ];
                    categoryCard.forEach((key, value) { //버튼 넣기
                      Buttons.add(CategoryButton(
                        name: key,
                        lists: value,
                        set: () {
                          setState(() {
                            buttoncolor.forEach(
                                (key, value) => buttoncolor[key] = false);
                            buttoncolor[key] = true;
                            list = value;
                          });
                        },
                      ));
                    });
                return Stack(
                    children: [
                      Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Row(children: Buttons)
                            ),
                            Container(height: 1, color: Colors.black),
                            Flexible(child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    child: ListView(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: buttoncolor["전체보기"]==true ? EntireCards:list
                                        )
                                      ],
                                    )
                                )
                            ))
                          ]),
                      WritingButton()
                    ]
                );
              }
              else{
                return Stack(
                      children: [
                        Center(child: Text("작성된 글이 없습니다.")),
                        WritingButton()
                      ]
                    );
                  }
                }
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
