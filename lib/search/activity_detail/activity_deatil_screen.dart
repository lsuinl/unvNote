import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/common/basic_appbar.dart';
import 'package:univ_note/search/activity_detail/quest/get_activiies_id.dart';
import 'package:univ_note/search/search_main/component/activity_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/basic.dart';
import 'component/activity_detail_card.dart';
import 'component/review_card.dart';

class ActivityDeatilScreen extends StatelessWidget {
  final String id;

  const ActivityDeatilScreen({
    required this.id,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
        padding: 0,
        name: "상세정보",
      widgets: FutureBuilder(
       future:GetActivitiesId(id),
      builder: (context, snapshot){
        if(snapshot.hasData) {
         var data = snapshot.data!;
          var activity=data['activity'];
          List<dynamic> reviews = data['reviews'];

          List<ReviewCard> review=reviews.map((e) =>
              ReviewCard(
                  title: e['title'],
                  text: e['text'],
                  date: e['date'],
                  link: e['link']
              )
          ).toList();
          return SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActivityDetailCard(
                    dday: activity['dday'],
                    image_url: activity['image_url'],
                    title: activity['title']
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                child:
                TextButton(
                  onPressed: () async {
                    await launch(activity['link'], forceWebView: true, forceSafariVC: true);
                  },
                    child:Text(activity['link']))),
                Container(height: 4.h, color: Color(0xFFD9D9D9),),
                Padding(padding: EdgeInsets.all(15),
                    child: Text("활동 후기", textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Column(
                  children: review.length==0 ? [Center(child:Text("작성된 후기가 없습니다."))]:review,
                ))
              ],
            ),
          );
        }
        else
          return  Basic(
              paddings: 10,
              widgets: Center(
                  child:CircularProgressIndicator()
              )
          );
  }));
}
}
