import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/search/search_main/component/popular_card.dart';

import '../../common/basic.dart';
import '../search_detail/search_detail_screen.dart';
import 'component/your_best_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
Map<String,bool> buttoncolor ={"대외활동":true,"공모전":false,"동아리":false};
class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 0,
        widgets: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: Text("맞춤 추천 활동",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600))),
            Container(
              height: 180.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  YourBestCard(),
                  SizedBox(width: 15.w,),
                  YourBestCard(),
                  SizedBox(width: 15.w,),
                  YourBestCard(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFE8F2FD),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("대외활동", style:TextStyle(fontSize: 16.sp,color: Color(0xFF1C7DEC), decoration: TextDecoration.underline,))),
                  TextButton(
                      onPressed: () {},
                      child: Text("동아리", style: TextStyle(fontSize: 16.sp,color: Colors.black87))),
                  TextButton(
                      onPressed: () {},
                      child: Text("공모전", style: TextStyle(fontSize: 16.sp,color: Colors.black87)))
                ],
              ),
            ),
            Container(
              height: 25.h,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder: (context) => SearchDeatilScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      splashFactory: InkSparkle.splashFactory
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
    Text('더보기', style: TextStyle(color: Colors.grey),),
    Icon(
    Icons.arrow_right_sharp,
    color: Colors.grey,
    ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                  childAspectRatio: 1.1,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(4, (index) {
                    return PopularCard();
                  })),
            ),
          ],
        ));
  }
}
