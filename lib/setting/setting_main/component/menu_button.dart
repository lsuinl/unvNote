import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuButton extends StatelessWidget {
  final String name;

  const MenuButton({
    required this.name,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: (){},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black87),
              minimumSize: MaterialStateProperty.all(Size(100.w, 50.h)),
            ),
            child: Padding(
    padding:EdgeInsets.symmetric(horizontal: 15),
    child:Stack(
              children: [
                Text(name, style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                Container(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios,color: Colors.black54))
              ],
            ))),
        Container(height: 0.8,color: Colors.black12),
      ],
    );
  }
}
