import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityDetailCard extends StatelessWidget {
  final String dday;
  final String image_url;
  final String title;

  const ActivityDetailCard({
    required this.dday,
    required this.image_url,
    required this.title,
    Key? key}) : super(key: key);

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
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                          image_url),
                        ),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Stack(
                        children: [
                        ],
                      )),
                ),
            Padding(padding:EdgeInsets.all(5),
                child:  SizedBox(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1472DF),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child:Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 35.w),
                          child:  Text(
                              dday,
                              style: TextStyle(fontSize: 18.sp, color: Colors.white,fontWeight: FontWeight.w500)
                          ),
                        )))
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(12),
              child: Text(
              title,
                  style: GoogleFonts.nanumGothic(fontSize: 20.sp,fontWeight: FontWeight.w600),
              ))
            ),
          ],
        );
  }
}
