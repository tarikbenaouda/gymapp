import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gymapp/ManagerUI/setting.dart';

import 'edit_our_offers.dart';
import 'edit_schedule.dart';
import 'home_page.dart';
class HomeView1 extends StatefulWidget {
  const HomeView1({Key? key}) : super(key: key);
  @override
  State<HomeView1> createState() => _HomeView1State();
}class _HomeView1State extends State<HomeView1> {

  final List<Widget> pages = [
    HomeView(),
    Edit_schedule(),
    Edit_schedule(),
    Setting(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar:  GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 35,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GButton(
              icon:  Icons.pie_chart,
              text: 'State',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GButton(
              icon: Icons.discount_rounded,
              text: 'Offers',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });}
      ),





    );
  }
}
