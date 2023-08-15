import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityDetailCard extends StatelessWidget {

  const ActivityDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                //elevation: 2, //그림자
                  child: Container(
                      height: 370.h,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg"),
                        // ),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Stack(
                        children: [
                          Padding(padding:EdgeInsets.all(5),
                              child:  SizedBox(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF6495ED),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child:Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 35.w),
                                        child:  Text(
                                            "D-4",
                                            style: TextStyle(fontSize: 18.sp, color: Colors.white,fontWeight: FontWeight.w500)
                                        ),
                                      )))
                          )
                        ],
                      )),
                ),
            Container(
              alignment: Alignment.center,
              child: Text(
                  " [어쩌구] ㅇㅇ..",
                  style: TextStyle(fontSize: 24.sp),
              )
            ),
          ],
        );
  }
}
