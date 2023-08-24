import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/search/activity_detail/activity_deatil_screen.dart';

class ActivityCard extends StatelessWidget {
  final int height;
  final int width;
  final double paddings;
  final String id;
  final String image_url;
  final String dday;
  final String title;

  const ActivityCard({
    required this.height,
    required this.width,
    required this.paddings,
    required this.id,
    required this.image_url,
    required this.dday,
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            //elevation: 2, //그림자
            child: InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityDeatilScreen(id:id))),
              child: Container(
                  height: height.h,
                  width: width.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image_url)),
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8.r),
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
                                        dday,
                                        style: TextStyle(color: Colors.white)
                                    ),
                                  )))
                      )
                    ],
                  )),
            )),
        Container(
          width: (width+30).toDouble(),
          child:Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.sp)
        ))
      ],
    ));
  }
}
