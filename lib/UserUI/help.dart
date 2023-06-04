import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpuser extends StatefulWidget {
  @override
  _HelpuserState createState() => _HelpuserState();
}

class _HelpuserState extends State<Helpuser> {
  final _userStream =
      FirebaseFirestore.instance.collection('contact').snapshots();
  int number = 0;
  String Helpuser = '', email = '';
  @override
  Widget build(BuildContext context) {
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
                height: screenlength,
                width: screenwidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/about help background.jpg"),
                        fit: BoxFit.fill)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Contact Us  ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 1),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  docs['email'],
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
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 1),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  docs['phoneNumber'],
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
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 1),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  docs['facebook'],
                                  style: const TextStyle(
                                    color: Color(0xFF252525),
                                    fontSize: 20.0,
                                  ),
                                ),
                                const Icon(
                                  Icons.facebook,
                                  size: 30,
                                  color: Color(0xFF252525),
                                ),
                              ],
                            ),
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
