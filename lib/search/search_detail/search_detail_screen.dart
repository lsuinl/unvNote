import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:univ_note/common/basic_appbar.dart';
import 'package:univ_note/search/search_detail/quest/get_activities.dart';
import 'package:univ_note/search/search_detail/quest/get_activities_search.dart';
import '../search_main/component/activity_card.dart';

class SearchDeatilScreen extends StatefulWidget {
  final String type;

  const SearchDeatilScreen({required this.type, Key? key}) : super(key: key);

  @override
  State<SearchDeatilScreen> createState() => _SearchDeatilScreenState();
}

int number = 0;
int lastpage = 1;
List<ActivityCard> list = [];
late Future myfuture;

class _SearchDeatilScreenState extends State<SearchDeatilScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    list = [];
    number = 0;
    lastpage = 1;
    myfuture = GetActivities(widget.type, number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
        name: "대외활동",
        padding: 10,
        widgets: FutureBuilder(
            future: myfuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                lastpage = data['meta']['last_page'];
                List<dynamic> activities = data['activities'];
                list.addAll(activities
                    .map((e) => ActivityCard(
                        height: 150,
                        width: 130,
                        paddings: 14,
                        id: e['id'],
                        image_url: e['image_url'],
                        dday: e['dday'],
                        title: e['title']))
                    .toList());
                return Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (name) {
                        number=1;
                        myfuture=GetActivitiesSearch(widget.type, 1, name);
                      },
                      controller: controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: (Icon(Icons.search)),
                          suffixIcon: IconButton(
                              onPressed: () => controller.clear(),
                              icon: Icon(Icons.cancel)),
                          hintText: "원하는 활동을 검색해보세요."),
                    ),
                    Flexible(
                        child: SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      child: GridView.count(
                          childAspectRatio: 0.7,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: list),
                      onLoading: () async {
                        if (lastpage != number) {
                          number += 1;
                          setState(() {
                            if(controller.text=="")
                              myfuture = GetActivities(widget.type, number);
                            else
                              myfuture = GetActivitiesSearch(widget.type, number,controller.text);
                          });
                          _refreshController.loadComplete();
                        }
                      },
                      footer: CustomFooter(
                        builder: (BuildContext context, LoadStatus) {
                          return Container(
                            height: 55.0,
                            child: Center(
                              child: Text(""),
                            ),
                          );
                        },
                      ),
                    ))
                  ],
                );
              } else
                return CircularProgressIndicator();
            }));
  }
}
