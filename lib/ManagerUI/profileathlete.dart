import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/services/firestore_services.dart';
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
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_double_arrow_left_outlined,
                              color: Color(0xFFFF1E0F),
                              size: 35,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              " The Athlete Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Container(
                      width: double.infinity,
                      height: 550,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              //

                              Text("${docs['age']} YO",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "${docs['height']} cm",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 7,
                              ),
                              SizedBox(
                                width: 20,
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "${docs['weight']} Kg",
                                        style: TextStyle(fontSize: 18),
                                      )
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
                        (docs['offerId'] == '0')
                            ? Column(children: [
                                myTextformfield(
                                  hint: " Offer Paid",
                                  controller: controller.offerController,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextButton(
                                    onPressed: () async {
                                      var id = await controller.getOfferId(
                                          type:
                                              controller.offerController.text);
                                      if (id == 'empty') {
                                      } else {
                                        await controller.updateAthleteOffer(
                                          offerId: id,
                                          uid: uid,
                                        );
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text(
                                        "Update Payement",
                                        style: TextStyle(
                                            color: Color(0xFFFF1E0F),
                                            fontSize: 18),
                                      ),
                                    ))
                              ])
                            : Column(
                                children: [
                                  MyInfos(
                                      Textinput: "Current Offer name",
                                      Textinput2: docs['offerName']),
                                  MyInfos(
                                      Textinput: "Offer ends in",
                                      Textinput2: controller
                                          .formattedDate(docs['offerDays'])),
                                ],
                              ),
                        TextButton(
                            onPressed: () async {
                              await controller.deleteAthlete(uid: uid);
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
                                children: [
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
