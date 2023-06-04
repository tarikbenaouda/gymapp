import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gymapp/ManagerUI/setting.dart';
import 'package:gymapp/UserUI/gym_offre.dart';
import 'Profileuser.dart';
import 'home_view.dart';

class HomeView2 extends StatefulWidget {
  const HomeView2({Key? key}) : super(key: key);
  @override
  State<HomeView2> createState() => _HomeView2State();
}

class _HomeView2State extends State<HomeView2> {
  var iconList = [
    Icons.home,
    Icons.account_circle_outlined,
    Icons.storefront_outlined,
    Icons.settings
  ];
  final List<Widget> pages = [
    HomeViewAthlete(),
    ProfileUser(),
    HomeViewAthlete(),
    GymOffer(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: GNav(
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
              icon: Icons.account_circle_outlined,
              text: 'Profile',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GButton(
              icon: Icons.storefront_outlined,
              text: 'Shop',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GButton(
              icon: Icons.local_offer_sharp,
              text: 'Offers',
              backgroundColor: Color(0xFFFD372A),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
