import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/Colors.dart';
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
                        image: AssetImage("images/20.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            iconSize: 50,
                            icon: Icon(
                              Icons.keyboard_double_arrow_left_rounded,
                            ),
                            color: red,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                            Icons.money_off_csred_rounded,
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
                            image: DecorationImage(
                              image: AssetImage(
                                  "images/gym offer minibackground.jpg"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1),
                          ),
                          height: 0.75 * screenheight,
                          width: 0.9 * screenwidth,
                          margin: EdgeInsets.all(10),
                          child: docs.length > 0
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: docs.length,
                                  // This list is defined at the beginning
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (contex, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      height: screenheight * 0.17,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/normal-offer.jpg"),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      docs[index]['type'],
                                                      style: TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                    Text(
                                                      " Offer",
                                                      style: TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      docs[index]['days'],
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                    Text(
                                                      " days",
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      docs[index]['sessions'],
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                    Text(
                                                      " Sessions",
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 24),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      docs[index]['price'],
                                                      style: TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 26),
                                                    ),
                                                    Text(
                                                      " Da",
                                                      style: TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 26),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ],
                                      ),
                                    );
                                  })
                              : Center(
                                  child: Text(
                                    "Empty List !",
                                    style:
                                        TextStyle(color: black, fontSize: 25),
                                  ),
                                )),
                    ]))
              ])));
            }));
  }
}
