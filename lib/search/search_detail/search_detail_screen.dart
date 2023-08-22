import 'package:flutter/material.dart';
import 'package:univ_note/common/basic.dart';
import 'package:univ_note/common/basic_appbar.dart';

import '../../home/home/home_screen.dart';
import '../search_main/component/activity_card.dart';

class SearchDeatilScreen extends StatefulWidget {
  const SearchDeatilScreen({Key? key}) : super(key: key);

  @override
  State<SearchDeatilScreen> createState() => _SearchDeatilScreenState();
}

class _SearchDeatilScreenState extends State<SearchDeatilScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
      name: "대외활동",
      padding:10,
      widgets: Column(
        children: [
          TextFormField(
            onFieldSubmitted: (name){
              //검색 api 호출
            },
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              prefixIcon: (Icon(Icons.search)),
              suffixIcon: IconButton(
                  onPressed: ()=>controller.clear(),
                  icon:Icon(Icons.cancel)),
              hintText: "원하는 활동을 검색해보세요."),
          ),
          Flexible(
             child: GridView.count(
    childAspectRatio:0.7,
    shrinkWrap: true,
    crossAxisCount: 2,
    children: List.generate(10, (index) {
      return CircularProgressIndicator();
 //   return ActivityCard(height: 180, width: 170,paddings:6,);
    })),
          )
        ],
      ),
    );
  }
}
