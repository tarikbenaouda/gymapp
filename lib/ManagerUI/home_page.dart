import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/ManagerUI/listofcoach.dart';
import 'package:gymapp/ManagerUI/training_demand.dart';
import 'package:gymapp/ManagerUI/about.dart';

import 'package:gymapp/ManagerUI/edit_our_offers.dart';
import 'package:gymapp/ManagerUI/help.dart';
import 'package:gymapp/ManagerUI/setting.dart';
import 'package:gymapp/ManagerUI/training_demands_list.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:intl/intl.dart';

import '../authentication/Login.dart';
import '../consts/firebase_consts.dart';
import '../controlllers/auth_controller.dart';
import 'OurStateShop.dart';
import 'OurstateAthlete.dart';
import 'listathletes.dart';
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
  final _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
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
      body: StreamBuilder(
          stream: _userStream,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs;
            int countAthletes = 0;
            for (int i = 0; i < docs.length; i++) {
              if (docs[i]['type'] == "athlete") {
                countAthletes++;
              }
            }
            int countCoachs = 0;
            for (int i = 0; i < docs.length; i++) {
              if (docs[i]['type'] == "athlete") {
                countCoachs++;
              }
            }

            return SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () =>
                              _scaffoldKey.currentState?.openDrawer(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
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
                              style: const TextStyle(
                                fontSize: 20,
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFD372A),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Center(
                              child: Text('$formattedDate',
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 35,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => null);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFD372A),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Center(
                                  child: Text(
                                    'Edit Gym State',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        child: Container(
                          width: (double.infinity),
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: const Center(
                            child: Text(
                              'ADS',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.black),
                            ),
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
                              color: red,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  softWrap: false,
                                  'Athletes Number\n$countAthletes',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
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
                              color: red,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  softWrap: false,
                                  'Coach Number\n$countCoachs ',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic3.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const listofcoachs());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      softWrap: false,
                                      ' List  Of Coachs',
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic2.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => OurstateAthlete());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic5.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const Listathletes());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic7.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const TrainingDemandsList());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic6.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => edit_our_offres());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic4.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const DemandForCoaching());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic1.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => Edit_schedule());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                                // border:  Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/admin-home pic8.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ModifyEvents());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 90.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const HomeView());
                },
                child: Container(
                  child: const Icon(
                    Icons.home,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const Setting());
                },
                child: Container(
                  child: const Icon(
                    Icons.settings_applications,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => edit_our_shop());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const Setting());
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: const Icon(Icons.settings),
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
                image: const DecorationImage(
                  image: AssetImage("images/drawor (admin).jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              // color: Color(0xFF232323),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const ListTile(
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
                  const SizedBox(
                    height: 60,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text('Home',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.to(() => const HomeView());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text('Settings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.to(() => const Setting());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    title: const Text('Help',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.to(() => Help());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: const Text('About',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onTap: () {
                      Get.to(() => AboutManager(""));
                    },
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: SizedBox(
                      width: 195,
                      child: ElevatedButton(
                        onPressed: () async {
                          auth.authStateChanges();
                          await Get.put(AuthController())
                              .signoutMethod(context);

                          Get.offAll(() => const Login());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF393939), //
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Colors.white),
                          ), // Change the background color
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout),
                            SizedBox(width: 8.0),
                            Text('Log out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
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
