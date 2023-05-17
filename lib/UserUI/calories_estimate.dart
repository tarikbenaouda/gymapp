import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/SettingsUser.dart';
import 'package:gymapp/consts/consts.dart';

import 'calories.dart';
import 'home_view.dart';

class Estimate extends StatefulWidget {
  double value;

  Estimate({required this.value});

  @override
  State<Estimate> createState() => _EstimateState(value);
}

class _EstimateState extends State<Estimate> {
  double value;

  _EstimateState(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/calculate calories background.jpg"),
                fit: BoxFit.fill,
              ),
            ), ///////// the image
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 350, top: 30),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.keyboard_double_arrow_left_outlined,
                        size: 37,
                        color: Color(0xFFFD372A),
                      ),
                      onTap: () {
                        Get.to(() => const Calories());
                      },
                    ),
                  ),
                  const Text(
                    "Calories Calculator ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                  const Text("Take the calories you need ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Your Daily  Calories Estimate : ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                        "This Is Your Calories You Need  To Your Weight.  ",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.grey,
                        )),
                  ),
                  Container(
                    height: 200,
                    width: 421,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        opacity: 0.7,
                        image: AssetImage("images/caculate calories pic 2.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                        child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: value.toStringAsFixed(2) + ' cal',
                            style: const TextStyle(
                              color: Color(0xFFFD372A),
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                            )),
                      ]),
                    )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )),
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
                Get.to(() => const HomeView());
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
                Get.to(() => const SettingsUser());
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
