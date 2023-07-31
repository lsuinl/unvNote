import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic.dart';

class WriteNoteScreen extends StatefulWidget {
  const WriteNoteScreen({Key? key}) : super(key: key);

  @override
  State<WriteNoteScreen> createState() => _WriteNoteScreenState();
}

class _WriteNoteScreenState extends State<WriteNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:false,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close)),
        actions: [  TextButton(onPressed: (){print("완료");}, child: Text("완료",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600, color: Colors.white),))],
        title: Text("기록하기", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500))
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: (){},
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            child:FittedBox(
                child: Row(
                children:[Text("카테고리 선택"), Icon(Icons.keyboard_arrow_down)]
        )),),
        TextFormField(
          decoration: InputDecoration(
            hintText: "제목을 입력해주세요.",
            border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          style: TextStyle(fontSize: 18.sp),
        ),
        Container(height: 1, color: Colors.black26,),
        TextFormField(
          decoration: InputDecoration(
              hintText: "2023-03-05~2023-07-22",
              border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          style: TextStyle(fontSize: 10.sp),
        ),
        Container(height: 1, color: Colors.black26),
         Flexible(
              child:  SingleChildScrollView(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "내용을 입력해주세요.",
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
}
