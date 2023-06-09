import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymapp/UserUI/Coaching_demand.dart';
import 'package:gymapp/UserUI/SportPlans.dart';
import 'package:gymapp/UserUI/about.dart';
import 'package:gymapp/UserUI/calories.dart';
import 'package:gymapp/UserUI/events.dart';
import 'package:gymapp/UserUI/user_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/UserUI/Chronometer.dart';
import 'package:gymapp/authentication/Login.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/services/firestore_services.dart';
import '../controlllers/auth_controller.dart';
import 'ListofCoachsinUser.dart';
import 'gym_offre.dart';
import 'gym_schedule.dart';
import 'help.dart';

class HomeViewAthlete extends StatefulWidget {
  const HomeViewAthlete({Key? key}) : super(key: key);
  @override
  State<HomeViewAthlete> createState() => _HomeViewAthleteState();
}

class _HomeViewAthleteState extends State<HomeViewAthlete> {
  String username = '', email = '';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(red),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              var daysLeft;
              if (data['offerDays'] != '0') {
                var date = DateTime.fromMillisecondsSinceEpoch(
                    data['offerDays'].seconds * 1000);

                if (date.isBefore(DateTime.now())) {
                  daysLeft = "not subscribed";
                } else {
                  daysLeft = date.difference(DateTime.now()).inDays;
                }
              } else {
                daysLeft = "not subscribed";
              }
              return SafeArea(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () =>
                                    _scaffoldKey.currentState?.openDrawer(),
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    Get.to(() => const UserQrCode());
                                  }),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
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
                                padding: EdgeInsets.only(top: 10),
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
                                Text(data['fullName'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                Text(data['type'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => null);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFD372A),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8.0),
                                  child: Text('Days left : $daysLeft',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFD372A),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8.0),
                                child: Text(
                                    'Sessions left: ${data['offerSessions']}',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFD372A),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8.0),
                                child: const Text('Gym State : Open',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
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
                                "ADS",
                                style: TextStyle(fontSize: 30),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Reach For Coach.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const ListofCoachinuser());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Gym Schedule.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => gym_schedule());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Training Offers.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => GymOffer());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                //border:  Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Chronometer.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => Chronometer());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Coaching Demand.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const coaching_demand());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/My Training Schedule.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => null);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Competition Events.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const EventsCompetition());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Sports Plans.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => SportPlans());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "images/Calculate Calories .jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const Calories());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      'Calculate Calories',
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
              );
            }
          }),
      drawer: SafeArea(
        child: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(red),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];

                return FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Drawer(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/drawor (admin).jpg"),
                            fit: BoxFit.fill),
                        color: Color(0xFF393939),
                      ),
                      child: Column(
                        children: [
                          Center(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              data['imageUrl'] == ''
                                  ? Image.asset(
                                      icGoogleLogo,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data['imageUrl'],
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              Text(data['username'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFD372A),
                                  )),
                              Text(data['email'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                            ],
                          )),
                          const SizedBox(
                            height: 70,
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
                              Get.to(() => const ProfileUser());
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.help,
                              color: Colors.white,
                            ),
                            title: const Text('Contact Us',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                            onTap: () {
                              Get.to(() => Helpuser());
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
                              Get.to(() => About());
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
                                child: const Row(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
