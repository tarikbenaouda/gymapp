import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/home_view.dart';

import 'package:gymapp/consts/consts.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/about help background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const HomeViewAthlete());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 310),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      size: 37,
                      color: Color(0xFFFD372A),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Icon(
                    Icons.info,
                    size: 30,
                    color: Color(0xFFFD372A),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFF252525),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: Text(
                            "about The Gym",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Container(
                            height: screenlength * 0.25,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "  Variable of About  about The App jidgidgjk,gijdidjgdijdgidgidjdgodjdgdojdgjigjdkixidgjdigdgidjdgijdgdjgdgjdogdndgnd",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "about The App",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Container(
                            height: screenlength * 0.25,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "  Variable of About  about The App jidgidgjk,gijdidjgdijdgidgidjdgodjdgdojdgjigjdkixidgjdigdgidjdgijdgdjgdgjdogdndgnd",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: const Color(0xFFE1E1E1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const HomeViewAthlete());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(),
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
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
                Get.to(() => const ProfileUser());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => null);
                ;
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.storefront_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileUser());
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
