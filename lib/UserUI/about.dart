import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/home_view.dart';

import 'package:gymapp/consts/consts.dart';

import 'home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _userStream =
      FirebaseFirestore.instance.collection('about').snapshots();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder(
          stream: _userStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs[0];
            return SafeArea(
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
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              const Center(
                                child: Text(
                                  "about The Gym",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
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
                                      docs['aboutTheGym'],
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "about The App",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
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
                                      docs['aboutTheApp'],
                                      style: const TextStyle(
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
            );
          }),
    );
  }
}
