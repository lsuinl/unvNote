import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TodosCardInput extends StatefulWidget {
  final String? id;
  final String? name;
  final bool? isChecked;
  final VoidCallback? check;
  final String? date;
  final bool isPatch;

  const TodosCardInput({
    this.id,
     this.name,
     this.isChecked,
     this.check,
     this.date,
     this.isPatch=false,
    Key? key}) : super(key: key);

  @override
  State<TodosCardInput> createState() => _TodosCardInputState();
}

class _TodosCardInputState extends State<TodosCardInput> {
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText:  "목표를 입력해주세요.",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
                      ),
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
                  inputFormatters: [maskFormatter],
                  controller: date,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "2023-03-05",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            )
        ));
  }
}

//focusnode로 벗어나면 제목입력/날짜(모두)입력 상태 확인하고 전송하기, 조건 불만족시 경고문구
//이미 있던 글인지, 없는 글인지 확인하고 전송
//전체적으로 체크리스트 모양새 확인하고 전송하기