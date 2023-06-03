import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';
import '../controlllers/offer_controller.dart';

class Offer {
  String type_offer;
  String month;
  String sessions;
  String price;

  Offer(
      {required this.type_offer,
      required this.month,
      required this.sessions,
      required this.price});
}

class GymOffer extends StatefulWidget {
  @override
  State<GymOffer> createState() => GymOffer_State();
}

class GymOffer_State extends State<GymOffer> {
  final _userStream =
      FirebaseFirestore.instance.collection('offers').snapshots();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OfferController());
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    TextEditingController monthController =
        TextEditingController(); // Create a new instance of TextEditingController
    monthController.text = "";
    TextEditingController priceController =
        TextEditingController(); // Create a new instance of TextEditingController
    priceController.text = "";
    TextEditingController typeOfferController =
        TextEditingController(); // Create a new instance of TextEditingController
    typeOfferController.text = "";
    TextEditingController sessionsController =
        TextEditingController(); // Create a new instance of TextEditingController
    sessionsController.text = "";

    return Scaffold(
        body: StreamBuilder(
            stream: _userStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Connection error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              var docs = snapshot.data!.docs;

              return SingleChildScrollView(
                  child: SafeArea(
                      child: Stack(children: [
                Container(
                    height: screenheight,
                    width: screenwidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("images/training offer background.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            iconSize: 40,
                            icon: Icon(Icons.keyboard_double_arrow_left_rounded,
                                size: 25 * (screenheight / screenwidth)),
                            color: red,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Gym offres",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Icon(
                            Icons.money,
                            color: white,
                            size: 25,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * screenheight,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: red, width: 1),
                          ),
                          height: 0.7 * screenheight,
                          width: 0.9 * screenwidth,
                          margin: const EdgeInsets.all(10),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: docs.length,
                              // This list is defined at the beginning
                              scrollDirection: Axis.vertical,
                              itemBuilder: (contex, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  height: screenheight * 0.15,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          docs[index]['type'],
                                          style: TextStyle(
                                              color: red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10 *
                                                  (screenheight / screenwidth)),
                                        ),
                                        Text(
                                          docs[index]['days'],
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10 *
                                                  (screenheight / screenwidth)),
                                        ),
                                        Text(
                                          docs[index]['sessions'],
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10 *
                                                  (screenheight / screenwidth)),
                                        ),
                                        Text(
                                          docs[index]['price'],
                                          style: TextStyle(
                                              color: red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10 *
                                                  (screenheight / screenwidth)),
                                        ),
                                      ]),
                                );
                              })),
                    ]))
              ])));
            }));
  }
}
