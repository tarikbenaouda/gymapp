import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/DemandCoaching.dart';
import 'package:gymapp/ManagerUI/edit_our_offers.dart';
import 'package:gymapp/ManagerUI/edit_our_shop.dart';
import 'package:gymapp/ManagerUI/edit_schedule.dart';
import 'package:gymapp/ManagerUI/listathletes.dart';
import 'package:gymapp/ManagerUI/setting.dart';
import 'package:intl/intl.dart';

import 'about.dart';
import 'help.dart';
import 'modify_events.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd/ MMMM');
    String formattedDate = formatter.format(now);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      // appBar: AppBar(
      //     backgroundColor: Color(0xFF111112),
      //     elevation: 0.0,
      //   ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("images/admin home back ground.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Welcome  ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Manager ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFD372A),
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text(
                        "Managername",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFD372A),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text('$formattedDate',
                          style: TextStyle(color: Colors.white)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edit_schedule()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFD372A),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 2.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text('Edit Gym State',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFD372A),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child:
                          Text('Rating', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                      width: 340,
                      height: 200,
                      decoration: BoxDecoration(
                        // border:  Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/background2.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        // border:  Border.all(color: Colors.grey, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                        color: Colors.black,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 14, top: 7),
                                          child: Text(
                                            softWrap: false,
                                            'Athletes nomber\n           var',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        //border:  Border.all(color: Colors.grey, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                        color: Colors.black,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 15, top: 7),
                                          child: Text(
                                            softWrap: false,
                                            'Coach nomber\n         var  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      // border:  Border.all(color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(17.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "images/shop_income.jpg",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 22, top: 7),
                                        child: Text(
                                          softWrap: false,
                                          'Shop income \n \n        var DA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      //border:  Border.all(color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(17.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "images/athletes_income.jpg",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 17, top: 10),
                                        child: Text(
                                          softWrap: false,
                                          'Athletes Income \n \n       var DA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/athletes_list.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Listathletes()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Text(
                                    softWrap: false,
                                    'Our Atheletes List',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/demends_athletes.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 70),
                                  child: Text(
                                    softWrap: false,
                                    'Demands Athletes',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/edit_offer.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => edit_our_offres()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 80),
                                  child: Text(
                                    softWrap: false,
                                    'Edit Our Offers',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              //border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/coach_demand.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DemandForCoaching()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    softWrap: false,
                                    'Coaching Demands',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/edit_schedule.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit_schedule()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    softWrap: false,
                                    'Edit Our Schedule',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/edit_shop.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => edit_our_shop()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 55, top: 80),
                                  child: Text(
                                    'Edit Our Shop',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 170,
                            height: 110,
                            decoration: BoxDecoration(
                              // border:  Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(17.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/athletes_list.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModifyEvents()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Text(
                                    softWrap: false,
                                    'Modify Events',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: SizedBox(
        height: 720,
        width: 225,
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background1.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            // color: Color(0xFF232323),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  title: Text('Menu',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text('Home',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text('Help',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: Text('About',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About('')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
