import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/note/write_note/note_screen.dart';

import '../note_detail/note_detail_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 0,
        widgets: Stack(
        children:[
        Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    InputChip(
                      onPressed:(){},
                        label: Text("전체보기",style: TextStyle(fontSize: 14.sp),),
                      backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      side:  BorderSide(
                          color: Colors.black54
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InputChip(
                      onPressed:(){},
                      label: Text("교내활동",style: TextStyle(fontSize: 14.sp),),
                      backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      side:  BorderSide(
                          color: Colors.black54
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InputChip(
                      onPressed:(){},
                      label: Text("봉사활동",style: TextStyle(fontSize: 14.sp),),
                      backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      side:  BorderSide(
                          color: Colors.black54
                      ),
                    ),
                    SizedBox(width: 10.w)

                  ],
                )),
            Container(height: 1, color: Colors.black),
            Flexible(child:
            Padding(
                padding: EdgeInsets.all(10),
                child:Container(
                child: ListView(
                  children: [       Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("교내 활동", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),),
                        Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                            elevation: 5, //그림자
                            child: InkWell(
                              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDeatilScreen())),
                              child: Container(
                                  height: 75.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("도서관 서포터즈 활동",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600)),
                                              Text("관리 업무를 맡으며 독서의 날 에는 ..", style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                              Text("2023-03-05~2023-07-22",style: TextStyle(color: Colors.black54),),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.arrow_forward_ios),
                                          )
                                        ],
                                      )
                                  )

                              ),
                            )
                        ),
                        Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                            elevation: 5, //그림자
                            child: InkWell(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDeatilScreen())),
                              child: Container(
                                  height: 75.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("도서관 서포터즈 활동",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600)),
                                              Text("관리 업무를 맡으며 독서의 날 에는 ..", style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                              Text("2023-03-05~2023-07-22",style: TextStyle(color: Colors.black54),),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.arrow_forward_ios),
                                          )
                                        ],
                                      )
                                  )

                              ),
                            )
                        ),
                        SizedBox(height: 10.h,),
                        Text("교내 활동", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),),
                        Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                            elevation: 5, //그림자
                            child: InkWell(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDeatilScreen())),
                              child: Container(
                                  height: 75.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("도서관 서포터즈 활동",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600)),
                                              Text("관리 업무를 맡으며 독서의 날 에는 ..", style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                              Text("2023-03-05~2023-07-22",style: TextStyle(color: Colors.black54),),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.arrow_forward_ios),
                                          )
                                        ],
                                      )
                                  )

                              ),
                            )
                        ),
                      ]
                  )],
    )
    )
            ))]),
    Container(
      alignment: Alignment.bottomRight,
    child:
Padding(
  padding:EdgeInsets.all(20),
    child: RawMaterialButton(
      onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => WriteNoteScreen())),
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
        )
    );
  }
}
