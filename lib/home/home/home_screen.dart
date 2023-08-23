import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child:  Text('🛥️Voyage', style: GoogleFonts.gluten(fontSize: 26.sp, fontWeight: FontWeight.w600),),
            )
        )
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '메인화면'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '활동추천'),
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
