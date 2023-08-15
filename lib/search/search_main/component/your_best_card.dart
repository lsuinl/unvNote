import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourBestCard extends StatelessWidget {
  const YourBestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            elevation: 5, //그림자
            child: InkWell(
              //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ())),
              child: Container(
                  height: 150.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(
                    //       "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg"),
                    // ),
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Stack(
                    children: [
                      Padding(padding:EdgeInsets.all(5),
                          child:  SizedBox(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF6495ED),
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  child:Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
                                    child:  Text(
                                        "D-4",
                                        style: TextStyle(color: Colors.white)
                                    ),
                                  )))
                      )
                    ],
                  )),
            )),
        Text(
            " [어쩌구] ㅇㅇ..",
            style: TextStyle(fontSize: 14.sp)
        )
      ],
    );
  }
}