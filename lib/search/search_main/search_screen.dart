import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/basic.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 15,
        widgets: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: "원하는 활동을 검색해보세요.",
                hintStyle: TextStyle(fontSize: 15.sp),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 5.h),
          Text(
            "추천 활동",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  elevation: 5, //그림자
                  child: InkWell(
                    //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ())),
                    child: Container(
                        height: 100.h,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg"),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          children: [
                            Padding(padding:EdgeInsets.all(5),
    child:  SizedBox(
    child: Container(
    decoration: BoxDecoration(
      color: Color(0xFFB9D7F9),
      borderRadius: BorderRadius.circular(5)
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))
                  ),
                  child: Text(
                    "대외활동",
                    style: TextStyle(fontSize: 16.sp)
                  )),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: Text("동아리", style: TextStyle(fontSize: 16.sp))),
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))
                  ),
                  child: Text("공모전", style: TextStyle(fontSize: 16.sp)))
            ],
          ),
          GridView.count(
              childAspectRatio: (1 / .9),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                elevation: 5, //그림자
                child: InkWell(
                //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ())),
                child: Container(
                height: 100.h,
                width: 250,
                decoration: BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F7CaTC%2FbtrKLgJ4NJK%2FWKb4E5kkkK8vYzlUwWkoJk%2Fimg.jpg"),
                ),
                borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                children: [
                Padding(padding:EdgeInsets.all(5),
                child:  SizedBox(
                child: Container(
                decoration: BoxDecoration(
                color: Color(0xFFB9D7F9),
                borderRadius: BorderRadius.circular(5)
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
                ],);})
          )]));
  }
}
