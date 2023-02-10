// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ssip_signverse_project/Screen/CameraScreen.dart';
import 'package:ssip_signverse_project/Screen/DictionaryScreen.dart';
import 'package:ssip_signverse_project/Screen/MainScreen.dart';
import 'package:ssip_signverse_project/Screen/UserScreen.dart';

// ignore: camel_case_types
class BottomNavigation_Bar extends StatefulWidget {
  const BottomNavigation_Bar({Key? key}) : super(key: key);

  @override
  State<BottomNavigation_Bar> createState() => _BottomNavigation_BarState();
}

var tstyle = TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 50);

class _BottomNavigation_BarState extends State<BottomNavigation_Bar> {
  var padding = EdgeInsets.all(16);
  double gap = 10;

  int _index = 0;

  List<Color> colors = [
   const Color(0xffF3F5F9),
   const Color(0xffF3F5F9),
   const Color(0xffF3F5F9),
   const Color(0xffF3F5F9),
  ];

  List<Widget> Screen = [
    const MainScreen(),
    const CameraScreen(),
    const DictionaryScreen(),
    const UserScreen(),
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: PageView.builder(
            itemCount: 4,
            controller: controller,
            onPageChanged: (page) {
              setState(() {
                _index = page;
              });
            },
            itemBuilder: (context, position) {
              return Container(
                color: colors[position],
                child: Center(child: Screen[position]),
              );
            }),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GNav(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
                tabs: [
                  GButton(
                    gap: gap,
                    icon: LineIcons.home,
                    iconColor: Colors.black,
                    text: 'Home',
                    iconActiveColor: const Color(0xff4339E7),
                    textColor: const Color(0xff4339E7),
                    backgroundColor: const Color(0xff4339E7).withOpacity(0.2),
                    iconSize: 30,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.camera,
                    iconColor: Colors.black,
                    text: 'Scan',
                    iconActiveColor: const Color(0xff4339E7),
                    textColor: const Color(0xff4339E7),
                    backgroundColor: const Color(0xff4339E7).withOpacity(0.2),
                    iconSize: 30,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.book,
                    iconColor: Colors.black,
                    text: 'Dictionary',
                    iconActiveColor: const Color(0xff4339E7),
                    textColor: const Color(0xff4339E7),
                    backgroundColor: const Color(0xff4339E7).withOpacity(0.2),
                    iconSize: 30,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.cog,
                    iconColor: Colors.black,
                    text: 'Setting',
                    iconActiveColor: const Color(0xff4339E7),
                    textColor: const Color(0xff4339E7),
                    backgroundColor: const Color(0xff4339E7).withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                ],
                selectedIndex: _index,
                onTabChange: (index) {
                  setState(() {
                    _index = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}











































/*
 MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: Scaffold(
            backgroundColor: Color(0xffF3F5F9),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: GNav(
                  color: Color(0xff4339E7),
                  activeColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                  tabBackgroundColor: Color(0xff4339E7),
                  gap: 8,
                  onTabChange: (index) {
                    print(index);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: "Home",
                    ),
                    GButton(icon: Icons.camera_alt, text: "Scan"),
                    GButton(icon: Icons.menu_book_sharp, text: "Dictionary"),
                    GButton(icon: Icons.chat_bubble_outlined, text: "chat"),
                  ],
                ),
              ),
            )));
 */