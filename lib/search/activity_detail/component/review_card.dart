import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewCard extends StatelessWidget {
  final String title;
  final String text;
  final String date;
  final String link;

  const ReviewCard({
    required this.title,
    required this.text,
    required this.date,
    required this.link,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            elevation: 3, //그림자
            child: InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.https(link))) {
                  await launchUrl(Uri.https(link));
                } else {
                  throw 'Could not launch $link';
                }
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
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width/1.4,
                                child: Text(
                                  text,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                date,
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
