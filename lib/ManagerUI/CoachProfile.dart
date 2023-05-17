import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/consts/consts.dart';
//import 'package:gymapp/makeselectorCoachProfile.dart';

class CoachProfile extends StatefulWidget {
  const CoachProfile({super.key});

  @override
  State<CoachProfile> createState() => _CoachProfileState();
}

class _CoachProfileState extends State<CoachProfile> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/20.jpg"), fit: BoxFit.fill)),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: const [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 35,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      " The Coach Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.person,
                      color: Color(0xFFFF1E0F),
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: screenlength * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        //url of image
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        //username
                        child: const Center(
                          child: Text(
                            "Hako Djerad fojdgdn",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //

                      const Text("  , Year",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  'Height:',
                                  style: TextStyle(
                                      color: Color(0xFF252525),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Text("VARIABLE")
                            ],
                          )),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  'Weight:',
                                  style: TextStyle(
                                      color: Color(0xFF252525),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text("VARIABLE")
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Center(
                  child: Text(
                    "For Contact The Coach",
                    style: TextStyle(
                        color: Color(0xFFE6E6E6),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Email:",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of email ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.email)
                        ],
                      )),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Number :",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of numberofphone ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.phone)
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            " Full Name:",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable  ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "  Coaching during: ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "function calcul",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                TextButton(
                    onPressed: (() {}),
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFFF1E0F),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Delete Coach",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
