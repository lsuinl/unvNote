import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:univ_note/common/basic_appbar.dart';
import 'package:univ_note/search/search_detail/quest/get_activities.dart';
import 'package:univ_note/search/search_detail/quest/get_activities_search.dart';
import '../../common/basic.dart';
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
    number = 1;
    lastpage = 1;
    myfuture = GetActivities(widget.type, number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
        name: widget.type,
        padding: 10,
        widgets: FutureBuilder(
            future: myfuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                List<Widget> inlist=[];
                lastpage = data['meta']['last_page'];
                List<dynamic> activities = data['activities'];
                  list.addAll(activities
                      .map((e) =>
                      ActivityCard(
                          height: 175,
                          width: 150,
                          paddings: 14,
                          id: e['id'],
                          image_url: e['image_url'],
                          dday: e['dday'],
                          title: e['title']))
                      .toList());
                  if(number==1) {
                    inlist = activities
                        .map((e) =>
                        ActivityCard(
                            height: 175,
                            width: 150,
                            paddings: 14,
                            id: e['id'],
                            image_url: e['image_url'],
                            dday: e['dday'],
                            title: e['title']))
                        .toList();
                  }
                return Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (name) {
                        number=1;
                        list=[];
                        setState(() {
                          myfuture=GetActivitiesSearch(widget.type, 1, name);
                        });
                      },
                      controller: controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: (Icon(Icons.search)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.clear();
                                number=1;
                                list=[];
                                setState(() {
                                  myfuture=GetActivities(widget.type, number);
                                });
                              },
              icon: Icon(Icons.cancel)),
              hintText: "원하는 활동을 검색해보세요."),
              ),
              Flexible(
              child: list.length==0?Center(child: Text("조회된 공고가 없습니다.")): SmartRefresher(
              controller: _refreshController,
              enablePullDown: false,
              enablePullUp: true,
              child: GridView.count(
              childAspectRatio: 0.7,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: number==1 ? inlist:list),
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
               return Basic(
                    paddings: 10,
                    widgets: Center(
                        child:CircularProgressIndicator()
                    )
                );
            }));
  }
}
