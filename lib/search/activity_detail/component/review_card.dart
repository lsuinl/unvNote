import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            elevation: 3, //그림자
            child: InkWell(
              onTap: () {
                //링크로이동
    },
              child: Container(
                  height: 75.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child:Text(
                                    "[기업] 활동 타이틀",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width/1.4,
                                child: Text(
                                  "어쩌구저쩌구 ...",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                "2023-08-17",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ))),
            )),
        SizedBox(height: 10.h)
      ],
    );
  }
}
