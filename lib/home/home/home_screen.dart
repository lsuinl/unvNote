import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univ_note/portfolio/portfolio_main/portfolio_screen.dart';
import 'package:univ_note/search/search_main/search_screen.dart';
import 'package:univ_note/setting/setting_main/setting_screen.dart';

import '../../note/note_main/note_screen.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;

  const HomeScreen({
    required this.selectedIndex,
    super.key}
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PortFolioScreen(),
    SearchScreen(),
    NoteScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child:  Text('대학생 수첩', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
            )
        )
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '포트폴리오'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '대외활동'),
          BottomNavigationBarItem(icon: Icon(Icons.content_paste,size: 22,), label: '기록',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blueAccent,
        selectedFontSize: 16.sp,
        onTap: _onItemTapped,
      ),
    );
  }
}
