import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart ';
import 'package:firebase_auth/firebase_auth.dart';

//โยงหน้าอื่น
import 'home.dart ';
import 'routine.dart';
import 'list/clist.dart';
import 'user/user_pro.dart';
import 'face/face_input.dart';

class MainViews extends StatefulWidget {
  final User user;
  MainViews(
    this.user, {
    Key? key,
  }) : super(key: key);
  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  var _bottomNavIndex = 0;

  List<Color> backgroundColors = const [
    Color(0xff1B1A43),
    Color.fromARGB(255, 63, 62, 132),
    Color.fromARGB(255, 25, 22, 220),
    Color.fromARGB(255, 93, 9, 230)
  ];

  List<Widget> pages = [
    Home(),
    Routine(),
    CList(),
    Profile(),
  ];

  List<IconData> iconList = [
    Icons.home_rounded,
    Icons.watch_later_rounded,
    Icons.sanitizer_rounded,
    Icons.person,
  ];

  List<String> labelTextList = [
    'หน้าหลัก',
    'รูทีน',
    'สกินแคร์',
    'โปรไฟล์',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[_bottomNavIndex],
      body: pages[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4B5DFC),
        child: const Center(
          child: Icon(Icons.face_retouching_natural_rounded),
        ),
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaceI()),
            );
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (index, selected) {
          final color = selected ? const Color(0xffD523A3) : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              Text(
                labelTextList[index],
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                ),
              ),
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        backgroundColor: const Color(0xff1D0E2F),
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
