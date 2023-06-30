import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/user/register/input_information_screen.dart';

class NextButton extends StatelessWidget {
  final TextEditingController texting;
  final VoidCallback screenchange;

  const NextButton({
    required this.texting,
    required this.screenchange,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children:[
        SizedBox(
        //박스사이즈 늘리기 Container 또는 Row 가능,
        width: double.infinity,
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: texting.text=="" ? Colors.black54: Colors.blueAccent,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15)),
        onPressed: () async {
          screenchange();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InputInformationScreen()));
        },
        child: Text('다음', style: TextStyle(fontSize: 15.sp),)
    ),),
    SizedBox(height: 30.h),
    ]
    );
  }
}
