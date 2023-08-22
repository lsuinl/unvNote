import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/search/search_main/quest/get_activities_best.dart';
import 'package:univ_note/search/search_main/quest/get_activities_recommend.dart';
import '../../common/basic.dart';
import '../search_detail/search_detail_screen.dart';
import 'component/activity_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
Map<String,bool> buttonColor ={"대외활동":true,"공모전":false,"동아리":false};

List<ActivityCard> RecommentCards=[];
List<ActivityCard> BestCards=[];

class _SearchScreenState extends State<SearchScreen> {
  String type="대외활동";

  @override
  void initState() {
    initGetActivities(type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Basic(
        paddings: 0,
        widgets: FutureBuilder(
          future: initGetActivities(type),
        builder:(context,snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("맞춤 추천 활동",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600))),
                Container(
                  height: 180.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:RecommentCards
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Color(0xFFE8F2FD),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              type="대외활동";
                            });
                          },
                          child: Text("대외활동", style: TextStyle(fontSize: 16.sp,
                            color: Color(0xFF1C7DEC),
                            decoration: TextDecoration.underline,))),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              type="동아리";
                            });
                          },
                          child: Text("동아리", style: TextStyle(fontSize: 16.sp,
                              color: Colors.black87))),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              type="공모전";
                            });
                            initGetActivities(type);
                          },
                          child: Text("공모전", style: TextStyle(fontSize: 16.sp,
                              color: Colors.black87)))
                    ],
                  ),
                ),
                Container(
                  height: 25.h,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    SearchDeatilScreen(type: type,))),
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
                      children: BestCards
                      )),
              ],
            );
          }
          else
            return CircularProgressIndicator();
        }));
  }
  Future<bool> initGetActivities(String types) async {
    if(RecommentCards.length==0){ //처음에만 변경
      List<dynamic> data = await GetActivitiesRecommend();
      RecommentCards= await data.map(
              (e) => ActivityCard(
                  height: 150,
                  width: 130,
                  paddings: 14,
                  id: e['id'],
                  image_url: e['image_url'],
                  dday: e['dday'],
                title:  e['title'],
              )
      ).toList();
    }
    List<dynamic> data = await GetActivitiesBest(types);
    BestCards = await data.map(
            (e) => ActivityCard(
              height: 120,
              width: 150,
              paddings: 14,
              id: e['id'],
              image_url: e['image_url'],
              dday: e['dday'],
              title:  e['title'],
            )
    ).toList();
    buttonColor.forEach((key, value) {
      buttonColor[key]=false;
    });
    buttonColor[types]=true;
    return true;
  }
}
