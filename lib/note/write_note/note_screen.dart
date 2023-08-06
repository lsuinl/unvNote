import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:univ_note/note/write_note/quest/post_records.dart';
class WriteNoteScreen extends StatefulWidget {
  const WriteNoteScreen({Key? key}) : super(key: key);


  @override
  State<WriteNoteScreen> createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  String category="";
  TextEditingController title=TextEditingController();
  TextEditingController content=TextEditingController();
  TextEditingController impression=TextEditingController();
  TextEditingController date=TextEditingController();
  String errorString="";
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-##-## ~ ####-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:false,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close)),
        actions: [
          TextButton(onPressed: (){
            if(category=="") seterrorstring("카테고리를 선택해주세요");
            else if(title.text=="") seterrorstring("제목을 입력해주세요");
            else if(date.text.length<23) seterrorstring("활동 기간을 입력해주세요");
            else if(content.text=="") seterrorstring("내용을 입력해주세요");
            else{
             // PostRecords(category, title.text, content.text, impression.text, date.text.substring(0,10),date.text.substring(13,23));
              print("제대로 전송요청");
            }
            },
            child: Text("완료",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600, color: Colors.white),))],
        title: Text("기록하기", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: (){
              showDialog(
                  barrierColor:Colors.white70,
                  context: context,
                  barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(color: Colors.black26),
                      ),
                      content:Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              fit:FlexFit.tight,
                              child:Stack(
                                alignment: Alignment.centerLeft,
                        children: [
                          Padding(padding: EdgeInsets.all(5),
                          child:  IconButton(padding: EdgeInsets.zero,  constraints: BoxConstraints(),onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close,size:22.r),color: Colors.black26,)
                      ),
                         Container(
                            alignment: Alignment.center,
                            child: Text( "카테고리 선택",style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.w600))
                          ),
                        ]
                          ),),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                minimumSize: Size(MediaQuery.of(context).size.width, 0)
                              ),
                                onPressed: ()=> setcategory("대외 활동"),
                                child: Text(" 대외 활동",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed: ()=>setcategory("교내 활동"),
                                child: Text(" 교내 활동",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed: ()=>setcategory("봉사 활동"),
                                child: Text(" 봉사 활동",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed: ()=>setcategory("자격증"),
                                child: Text(" 자격증",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed:()=>setcategory("기타"),
                                child: Text(" 기타",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                          ],
                        ),
                      )
                      // actions: [
                      //   TextButton(
                      //     child: const Text('확인',
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w700)),
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   ),
                      // ],
                    );
                  });
            },
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            child:FittedBox(
                child: Row(
                children:[Text(category=="" ? "카테고리 선택":category), Icon(Icons.keyboard_arrow_down)]
        )),),
        TextFormField(
          controller: title,
          decoration: InputDecoration(
            hintText: "제목을 입력해주세요.",
            border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          style: TextStyle(fontSize: 18.sp),
        ),
        Container(height: 1, color: Colors.black26,),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [maskFormatter],
          controller: date,
          decoration: InputDecoration(
              hintText: "2023-03-05~2023-07-22",
              border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(fontSize: 10.sp),
        ),
        Container(height: 1, color: Colors.black26),
         Flexible(
              child:  SingleChildScrollView(
                  child: TextFormField(
                    controller: content,
                    decoration: InputDecoration(
                        hintText: "내용을 입력해주세요.",
                        border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                    style: TextStyle(fontSize: 12.sp),
                    maxLines: 200,
                  )
          ),
        ),
        Container(height: 1, color: Colors.black26,),
        Flexible(
          child:  SingleChildScrollView(
              child: TextFormField(
                controller: impression,
                decoration: InputDecoration(
                    hintText: "소감을 입력해주세요.",
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
                style: TextStyle(fontSize: 12.sp),
                maxLines: 200,
              )
          ),
        )
      ],
    )
    );
  }

  void setcategory(String name){
    Navigator.pop(context);
    setState(() {
      category=name;
    });
  }
  void seterrorstring(String name) {
    print(name);
  setState(() {
    errorString=name;
  });
  }
}
