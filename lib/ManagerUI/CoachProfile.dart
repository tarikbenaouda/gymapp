import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controlllers/manger_coaching_demand_controller.dart';

class CoachProfile extends StatefulWidget {
  const CoachProfile({super.key});

  @override
  State<CoachProfile> createState() => _CoachProfileState();
}

class _CoachProfileState extends State<CoachProfile> {
  var uid = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ManagerCoachingDemandController());
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
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
                height: screenlength,
                width: screenwidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
                child: ListView(children: [
                  // 2.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 0, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      " Coaching demand ",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  15.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 150),
                    child: docs['imageUrl'] == ''
                        ? Image.asset(
                            icGoogleLogo,
                            width: 60,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            docs['imageUrl'],
                            width: 60,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                  ),

                  Center(
                      child: "${docs['username']}"
                          .text
                          .white
                          .size(20)
                          .bold
                          .make()),
                  15.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        MyInfos(
                          Textinput: " FullName ",
                          Textinput2: docs['fullName'],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyInfos(
                          Textinput: " Age ",
                          Textinput2: "${docs['age']} Years old",
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyInfos(
                          Textinput: " Height ",
                          Textinput2: "${docs['height']} cm",
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyInfos(
                          Textinput: " Weigth ",
                          Textinput2: "${docs['weight']} Kg",
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyInfos(
                          Textinput: " Email ",
                          Textinput2: docs['email'],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        MyInfos(
                          Textinput: " Phone Number ",
                          Textinput2: docs['phoneNumber'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              await controller.acceptAthlete(
                                  type: "coach", coaching: false, id: uid);
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      " Accepte ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                        TextButton(
                            onPressed: () async {
                              await controller.refuseAthlete(
                                  coaching: false, id: uid);
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      " Refuse ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                    ),
                                  ),
                                  Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
              );
            }
          }),
    );
  }
}
