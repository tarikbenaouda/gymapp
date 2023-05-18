import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../controlllers/manger_profiles_controller.dart';
//import 'package:gymapp/makeselectorprofileathlete.dart';

class Profileathlete extends StatefulWidget {
  const Profileathlete({super.key});

  @override
  State<Profileathlete> createState() => _ProfileathleteState();
}

class _ProfileathleteState extends State<Profileathlete> {
  var uid = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ManagerProfilesController());
    return Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getUser(uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(red)));
            } else {
              var docs = snapshot.data!.docs[0];

              return Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/20.jpg"), fit: BoxFit.cover)),
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.keyboard_double_arrow_left_outlined,
                              color: Color(0xFFFF1E0F),
                              size: 35,
                            ),
                            Text(
                              " The Athlete Profile",
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
                      height: 550,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                "images/21.jpg",
                              ),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            children: [
                              docs['imageUrl'] == ''
                                  ? Image.asset(
                                      icGoogleLogo,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      docs['imageUrl'],
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 60,
                                width: 170,
                                //username
                                child: Center(
                                  child: Text(
                                    docs['fullName'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                              //

                              Text("${docs['age']} Years Old",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15))
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
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Height:',
                                          style: TextStyle(
                                              color: Color(0xFF252525),
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text("${docs['height']} cm")
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
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Weight:',
                                          style: TextStyle(
                                              color: Color(0xFF252525),
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text("${docs['weight']} Kg")
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
                            "For Contact The Athlete",
                            style: TextStyle(
                                color: Color(0xFFE6E6E6), fontSize: 18),
                          ),
                        ),
                        MyInfos(
                            Textinput: " Email ", Textinput2: docs['email']),
                        const SizedBox(
                          height: 2,
                        ),
                        MyInfos(
                            Textinput: " Number Phone",
                            Textinput2: docs['phoneNumber']),
                        const Center(
                          child: Text(
                            "The Athlete Payement",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 18),
                          ),
                        ),
                        MyInfos(
                            Textinput: " Offer Paid", Textinput2: "variable"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    " Payement End: ",
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
                              alignment: Alignment.center,
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Text(
                                "Update Payement",
                                style: TextStyle(
                                    color: Color(0xFFFF1E0F), fontSize: 18),
                              ),
                            )),
                        TextButton(
                            onPressed: () async {
                              await controller.updateProfile(
                                  type: "user", id: uid);
                              Get.back();
                            },
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
                                    "Delete Athlete",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
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
              );
            }
          }),
    );
  }
}
