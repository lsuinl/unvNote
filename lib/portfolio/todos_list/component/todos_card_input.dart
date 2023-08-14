import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:univ_note/portfolio/todos_list/quest/patch_todos_id.dart';
import 'package:univ_note/portfolio/todos_list/quest/post_todos.dart';

class TodosCardInput extends StatefulWidget {
  final String? id;
  final String? name;
  final bool? isChecked;
  final String? date;
  final bool isPatch;
  final VoidCallback check;

  const TodosCardInput({
    this.id,
     this.name,
     this.isChecked,
     this.date,
    required this.check,
     this.isPatch=false,
    Key? key}) : super(key: key);

  @override
  State<TodosCardInput> createState() => _TodosCardInputState();
}

class _TodosCardInputState extends State<TodosCardInput> {
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  String errorString = "";
  FocusNode textFocus = FocusNode();
  FocusNode numberFocus=FocusNode();

  @override
  void initState() {
      if(widget.isPatch==true) {
        setState(() {
          name.text = widget.name!;
          date.text = widget.date!;
        });
      }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.grey,
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
                width: 1,
                color: Colors.black12
            )
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child:
                    TextField(
                      controller: name,
                      focusNode: textFocus,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText:  "목표를 입력해주세요.",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
                      ),
                  //    onTapOutside: (e)=>PostOrPatch(),
                      onEditingComplete:()=>PostOrPatch(),
                      onSubmitted: (e)=>PostOrPatch(),
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
                    ),
                    ),
                    Transform.scale(
                        scale: 1.7,
                        child:
                        Checkbox(
                            side: BorderSide(
                                color:Colors.black12
                            ),
                            shape: CircleBorder(),
                            value: widget.isChecked?? false,
                            onChanged: (val){}))
                  ],
                ),
                Container(color: Colors.black12,height: 1.5.h),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: date,
                  focusNode: numberFocus,
                  //    onTapOutside: (e)=>PostOrPatch(),
                  onEditingComplete:()=> PostOrPatch(),
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.zero,
                    hintText: "2023",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  maxLength: 4,
                  style: TextStyle(fontSize: 12.sp),
                ),
                errorString==""?Container():Text(errorString)
              ],
            )
        ));
  }

  void PostOrPatch() async {
    if(date.text.length==4 && name.text!=""){
      if(widget.isPatch==true) {
        int result = await PatchTodosId(widget.id!,name.text,date.text);
        if(result==200) {
          Fluttertoast.showToast(msg: "성공적으로 수정되었습니다");
          textFocus.unfocus();
          numberFocus.unfocus();
          widget.check();
        }
      }
      else {
        print("수정");
        int result = await PostTodos(name.text, date.text);
        if(result==201) {
          Fluttertoast.showToast(msg: "목표가 생성되었습니다.");
          textFocus.unfocus();
          numberFocus.unfocus();
          widget.check();
        }
      }
    }
    else{
      setState(() {
        errorString="목표와 날짜를 모두 입력하세요.";
      });
    }
  }
}

//focusnode로 벗어나면 제목입력/날짜(모두)입력 상태 확인하고 전송하기, 조건 불만족시 경고문구
//이미 있던 글인지, 없는 글인지 확인하고 전송
//전체적으로 체크리스트 모양새 확인하고 전송하기