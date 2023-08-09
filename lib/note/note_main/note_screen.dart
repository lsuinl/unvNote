import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/note_main/quest/get_records.dart';
import 'package:univ_note/note/write_note/note_screen.dart';

import '../../user/login/screen/login_screen.dart';
import '../note_detail/note_detail_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Widget> list=[];
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 0,
        widgets: FutureBuilder(
        future: GetRecords(),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.done) {
           //에러난 경우
            if (snapshot.data == 401) {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), (
                      route) => false);
              Fluttertoast.showToast(msg: "로그인이 만료되었습니다. 다시 로그인 해주세요.");
              return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
            }
            else if (snapshot.data == 404)
              return Center(child: Text("데이터를 불러오는 데 문제가 발생했습니다."));
            else {
              if(snapshot.hasData) {
                List<dynamic> datas=snapshot.data!;
                Map<String,List<Widget>> cards={};
                datas.forEach((e) => cards[e['category']]=[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7),child:
                  Text(e['category'],
                    style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600)
                  ))]);
                datas.forEach(
                        (e) => cards[e['category']]!.add(
                            Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .circular(16.r)),
                            elevation: 5, //그림자
                            child: InkWell(
                              onTap: () =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) =>
                                              NoteDeatilScreen(
                                                  id: e['id']))),
                              child: Container(
                                  height: 75.h,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius
                                        .circular(10.r),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets
                                          .all(
                                          10),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                  e['title'],
                                                  style: TextStyle(
                                                      fontSize: 18
                                                          .sp,
                                                      fontWeight: FontWeight
                                                          .w600)),
                                              Text(
                                                e['content'],
                                                style: TextStyle(
                                                    fontSize: 14
                                                        .sp,
                                                    fontWeight: FontWeight
                                                        .w500),),
                                              Text(
                                                "${e['start']}~${e['end']}",
                                                style: TextStyle(
                                                    color: Colors
                                                        .black54),),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment
                                                .centerRight,
                                            child: Icon(
                                                Icons
                                                    .arrow_forward_ios),
                                          )
                                        ],
                                      )
                                  )

                              ),
                            )
                        )
                ));
                List<Widget> EntireCards=[];
               cards.values.forEach((element) {
                  EntireCards.addAll(element);
                  EntireCards.add(SizedBox(height: 10.h));
                });

               List<Widget> Buttons=[  InputChip(
                 onPressed: () {
                   list=EntireCards;
                 },
                 label: Text(
                   "전체보기",
                   style: TextStyle(fontSize: 14.sp),),
                 backgroundColor: Colors.white70,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(
                         8.r)),
                 side: BorderSide(
                     color: Colors.black54
                 ),
               ),
                 SizedBox(width: 10.w)];

               cards.forEach((key, value) {
                 Buttons.add(
                   InputChip(
                     onPressed: () {
                       setState(() {
                         list=value;
                       });
                     },
                     label: Text(
                       key,
                       style: TextStyle(fontSize: 14.sp),),
                     backgroundColor: Colors.white70,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(
                             8.r)),
                     side: BorderSide(
                         color: Colors.black54
                     ),
                   )
                 );
                 Buttons.add(SizedBox(width: 10.w));
               });
               list=EntireCards;
                return Stack(
                    children: [
                      Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: Buttons,
                                )),
                            Container(height: 1, color: Colors.black),
                            Flexible(child:
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    child: ListView(
                                      children: [ Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: list
                                      )
                                      ],
                                    )
                                )
                            ))
                          ]),
                      Container(
                          alignment: Alignment.bottomRight,
                          child:
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: RawMaterialButton(
                                onPressed: () =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            WriteNoteScreen())),
                                elevation: 5.0,
                                fillColor: Colors.blue[300],
                                child: Icon(
                                  Icons.edit,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              )
                          ))
                    ]
                );
              }
              else{
                return
                    Stack(
                      children: [
                        Center(child: Text("작성된 글이 없습니다.")),
                      Container(
                      alignment: Alignment.bottomRight,
                      child:
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: RawMaterialButton(
                            onPressed: () =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        WriteNoteScreen())),
                            elevation: 5.0,
                            fillColor: Colors.blue[300],
                            child: Icon(
                              Icons.edit,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          )
                      )
                      )
                      ]
                    );
              }
            }
          }
          else{
           return CircularProgressIndicator();
          }
        }

          )
    );
  }
}
