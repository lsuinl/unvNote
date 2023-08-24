import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:univ_note/common/basic.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:univ_note/home/home/home_screen.dart';
import 'package:univ_note/note/note_main/note_screen.dart';
import 'package:univ_note/note/write_note/quest/patch_records_id.dart';
import 'package:univ_note/note/write_note/quest/post_records.dart';
import 'package:univ_note/user/login/screen/login_screen.dart';
class WriteNoteScreen extends StatefulWidget {
  final bool isPatch;
  final String? id;
  final String? category;
  final String? title;
  final String? content;
  final String? impression;
  final String? start;
  final String? end;

  const WriteNoteScreen({
    this.isPatch=false,
    this.id,
    this.category,
    this.title,
    this.content,
    this.impression,
    this.start,
    this.end,
    Key? key}) : super(key: key);


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
  void initState() {
    if(widget.isPatch==true){
      setState(() {
        category=widget.category!;
        title.text=widget.title!;
        content.text=widget.content!;
        impression.text=widget.impression!;
        date.text="${widget.start!} ~ ${widget.end}"!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:false,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close)),
          title: Text("기록하기", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
        actions: [
          TextButton(onPressed: () async {
            if(category=="") seterrorstring("카테고리를 선택해주세요");
            else if(title.text=="") seterrorstring("제목을 입력해주세요");
            else if(date.text.length<23) seterrorstring("활동 기간을 입력해주세요");
            else if(content.text=="") seterrorstring("내용을 입력해주세요");
            else{
              int stat = 0;
              print(widget.isPatch);
              if(widget.isPatch==false)
                stat= await PostRecords(category, title.text, content.text, impression.text, date.text.substring(0,10),date.text.substring(13,23));
              else
                stat = await PatchRecordsId(widget.id! ,category, title.text, content.text, impression.text, date.text.substring(0,10),date.text.substring(13,23));
              if(stat==201 || stat ==200)   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(selectedIndex: 2,)),(route)=>false);
              else if(stat==401) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route)=>false);
                Fluttertoast.showToast(msg: "로그인이 만료되었습니다. 다시 로그인 해주세요.");
            }
              else Fluttertoast.showToast(msg: "에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
              print("제대로 전송요청");
            }
            },
            child: Text("완료",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600, color: Colors.white),))],
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:Container(
            alignment: Alignment.centerRight,
            child: Text(errorString,style: TextStyle(color: Colors.red))
        ),
        ),
        TextButton(
            onPressed: (){
              showDialog(
                  barrierColor:Colors.white70,
                  context: context,
                  barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                  builder: (BuildContext context) {
                    return AlertDialog(
                        elevation: 0,
                        title: Center(child: Text("카테고리 선택")),
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
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                minimumSize: Size(MediaQuery.of(context).size.width, 0)
                              ),
                                onPressed: ()=> setcategory("교외활동"),
                                child: Text(" 교외 활동",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed: ()=>setcategory("교내활동"),
                                child: Text(" 교내 활동",style: TextStyle(fontSize: 15.sp,color: Colors.black87))),
                            Container(height: 2,color: Colors.black12),
                            TextButton(
                                style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 0)
                                ),
                                onPressed: ()=>setcategory("봉사활동"),
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
                children:[Text(category=="" ? "카테고리 선택":category,style: TextStyle(fontSize: 16.sp),), Icon(Icons.keyboard_arrow_down)]
        )),),
        TextFormField(
          controller: title,
          decoration: InputDecoration(
            hintText: "제목을 입력해주세요.",
            border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          style: TextStyle(fontSize: 20.sp),
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
          style: TextStyle(fontSize: 12.sp),
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
                    style: TextStyle(fontSize: 17.sp),
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
                style: TextStyle(fontSize: 17.sp),
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
