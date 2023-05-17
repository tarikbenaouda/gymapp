import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';

import 'about.dart';
import 'home_view.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  int number = 0;
  String help = '', email = '';
  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: GestureDetector(
                  child: const Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 37,
                    color: Color(0xFFFD372A),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "The Help ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Icon(
                    Icons.help,
                    size: 30,
                    color: Color(0xFFFD372A),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      ' Write Here in What You Need Help',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            help = text;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: '.....',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFD9D9D9),
                        ),
                        onPressed: null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Send it ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.send, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 225.0),
                      child: Text(
                        'To Contact Us : ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$number",
                            style: const TextStyle(
                              color: Color(0xFF252525),
                              fontSize: 20.0,
                            ),
                          ),
                          const Icon(
                            Icons.call,
                            size: 30,
                            color: Color(0xFF252525),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$email",
                            style: const TextStyle(
                              color: Color(0xFF252525),
                              fontSize: 20.0,
                            ),
                          ),
                          const Icon(
                            Icons.mail,
                            size: 30,
                            color: Color(0xFF252525),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "",
                            style: TextStyle(
                              color: Color(0xFF252525),
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.facebook,
                            size: 30,
                            color: Color(0xFF252525),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                Get.to(() => const HomeViewAthlete());
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
