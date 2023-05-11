import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/setting.dart';
import 'package:intl/intl.dart';

import 'modify_about.dart';
import 'modify_events.dart';
import 'modify_help.dart';

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
    String admin = '';
    int athletes = 0, coaches = 0;

    var now = DateTime.now();
    var formatter = DateFormat('dd/ MMMM');
    String formattedDate = formatter.format(now);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/admin home back ground.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome  ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1.3,
                      ),
                    ),
                    Text(
                      "Manager ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFD372A),
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Text("$admin  ",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFD372A),
                        borderRadius: BorderRadius.circular(20.0),
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
                                builder: (context) => HomeView()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFD372A),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text('Edit Gym State',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Container(
                    child: Center(
                      child: Text(
                        'ADS',
                        style: TextStyle(fontSize: 50, color: Colors.black),
                      ),
                    ),
                    width: (double.infinity),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        color: Colors.black,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 14, top: 7),
                          child: Text(
                            softWrap: false,
                            'Athletes Number\n           $athletes',
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
                        borderRadius: BorderRadius.circular(17.0),
                        color: Colors.black,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 7),
                          child: Text(
                            softWrap: false,
                            'Coach Number\n         $coaches ',
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic3.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Shop Income',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic2.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                ' Athletes Income',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic5.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Our Atheletes List',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic7.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Demands Athletes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic6.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Edit Our Offers',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          //border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "/images/admin-home pic4.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Coaching Demands',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic1.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Edit Our Schedule',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Edit Our Shop',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Container(
                        width: (double.infinity),
                        height: 160,
                        decoration: BoxDecoration(
                          // border:  Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/admin-home pic8.jpg",
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
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                softWrap: false,
                                'Modify Events',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 90.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                child: Container(
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                child: Container(
                  child: Icon(
                    Icons.settings_applications,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Icon(Icons.settings),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: SafeArea(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage("images/drawor (admin).jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              // color: Color(0xFF232323),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
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
                    height: 60,
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
                        MaterialPageRoute(builder: (context) => ModifyHelp()),
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
                        MaterialPageRoute(builder: (context) => ModifyAbout()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
