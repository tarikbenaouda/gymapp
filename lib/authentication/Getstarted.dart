import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/authentication/Unboarding.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF393939),
      body: ListView(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(
            child: Row(
              children: [
                Text(
                  "               Fire-",
                  style: TextStyle(
                      color: Color(0xFFFF1E0F),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Muscles",
                  style: TextStyle(
                      color: Color(0xFFFAF8F8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: const Color(0xFFFF1E0F)),
                  onPressed: () {
                    Get.to(() => const Unboarding());
                  },
                  child: const Text(
                    "Get Start",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                " This application is subject to high protection and you can also use it after you are accepted by the club management.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 100,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
