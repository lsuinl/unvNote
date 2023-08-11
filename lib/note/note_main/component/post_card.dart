import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../note_detail/note_detail_screen.dart';

class PostCard extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final String start;
  final String end;

  const PostCard(
      {required this.id,
      required this.title,
      required this.content,
      required this.start,
      required this.end,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            elevation: 5, //그림자
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteDeatilScreen(id: id))),
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
                              Text(title,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                content,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${start}~${end}",
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
