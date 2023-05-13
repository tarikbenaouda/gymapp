import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/DemandCoaching.dart';
import 'package:gymapp/ManagerUI/edit_schedule.dart';
import 'package:gymapp/ManagerUI/help.dart';
import 'package:gymapp/UserUI/Chronometer.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/UserUI/about.dart';

class HomeViewAthlete extends StatefulWidget {
  const HomeViewAthlete({Key? key}) : super(key: key);
  @override
  State<HomeViewAthlete> createState() => _HomeViewAthleteState();
}

class _HomeViewAthleteState extends State<HomeViewAthlete> {
  String username = '', email = '';
  int timelimit = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/user home background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Welcome   ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Warrior ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFD372A),
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(" username$username",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        Text("Athlet",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeViewAthlete()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFD372A),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Text('Today\'s Training',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFD372A),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Text('Time Limit : $timelimit ',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFD372A),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Text('Gym State',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fire-",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFD372A),
                          ),
                        ),
                        Text(
                          "Muscles",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      child: Center(
                          child: Text(
                        "ADS",
                        style: TextStyle(fontSize: 30),
                      )),
                      width: (double.infinity),
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Reach For Coach.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Reach For Coach ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Gym Schedule.jpg",
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
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Gym Schedule',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Training Offers.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Training Offers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        //border:  Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Chronometer.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Chronometer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Coaching Demand.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DemandForCoaching()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Coaching  Demand',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Shop.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Chronometer()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/My Training Schedule.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'My Training Schedule',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Competition Events.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Competition Events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Sports Plans.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Sports Plans',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/Calculate Calories .jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Calculate Caloris',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Color(0xFFE1E1E1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeViewAthlete()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(),
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUser()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.storefront_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xFF393939),
              ),
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("username$username",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFD372A),
                          )),
                      Text("usereamil$email",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ],
                  )),
                  SizedBox(
                    height: 70,
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
                        MaterialPageRoute(
                            builder: (context) => HomeViewAthlete()),
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
                    onTap: () {},
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
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: SizedBox(
                      width: 195,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF393939), //
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white),
                          ), // Change the background color
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 8.0),
                            Text('Log out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
