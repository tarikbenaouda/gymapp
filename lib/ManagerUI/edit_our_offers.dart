import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';
import '../controlllers/offer_controller.dart';

class Offer {
  String type_offer;
  String days;
  String sessions;
  String price;

  Offer(
      {required this.type_offer,
      required this.days,
      required this.sessions,
      required this.price});
}

class edit_our_offers extends StatefulWidget {
  @override
  State<edit_our_offers> createState() => edit_our_offers_State();
}

class edit_our_offers_State extends State<edit_our_offers> {
  final _userStream =
      FirebaseFirestore.instance.collection('offers').snapshots();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OfferController());
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    TextEditingController daysController =
        TextEditingController(); // Create a new instance of TextEditingController
    daysController.text = "";
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
                            iconSize: 40,
                            icon: Icon(Icons.keyboard_double_arrow_left_rounded,
                                size: 50),
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
                            "Edit our offers",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Icon(
                            Icons.money_off_outlined,
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
                        height: 0.65 * screenheight,
                        width: 0.9 * screenwidth,
                        margin: const EdgeInsets.all(10),
                        child: docs.length == 0
                            ? Center(
                                child: Text("List Empty",
                                    style:
                                        TextStyle(color: white, fontSize: 25)),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: docs.length,
                                // This list is defined at the beginning
                                scrollDirection: Axis.vertical,
                                itemBuilder: (contex, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          priceController.text =
                                              docs[index]['price'];
                                          daysController.text =
                                              docs[index]['days'];
                                          sessionsController.text =
                                              docs[index]['sessions'];
                                          typeOfferController.text =
                                              docs[index]['type'];
                                        });

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                backgroundColor:
                                                    const Color(0xFF4F4F4F),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 50.0,
                                                ),
                                                title: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: red,
                                                              size: 20 *
                                                                  (screenheight /
                                                                      screenwidth),
                                                            ),
                                                            onPressed: () {
                                                              Get.back();
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Edit The offers",
                                                          style: TextStyle(
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10 *
                                                                (screenheight /
                                                                    screenwidth),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .edit_calendar_outlined,
                                                          size: 15 *
                                                              (screenheight /
                                                                  screenwidth),
                                                          color: red,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                content: SingleChildScrollView(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    myTextformfield(
                                                      controller:
                                                          typeOfferController,
                                                      hint: "Type of the offer",
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        color: red,
                                                      ),
                                                      limit: 10,
                                                    ),
                                                    myTextformfield(
                                                      controller:
                                                          daysController,
                                                      hint: "days",
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        color: red,
                                                      ),
                                                      limit: 2,
                                                      type:
                                                          TextInputType.number,
                                                    ),
                                                    myTextformfield(
                                                      controller:
                                                          sessionsController,
                                                      hint: "Sessions",
                                                      icon: const Icon(
                                                        Icons.edit_outlined,
                                                        color: red,
                                                      ),
                                                      limit: 2,
                                                      type:
                                                          TextInputType.number,
                                                    ),
                                                    myTextformfield(
                                                      controller:
                                                          priceController,
                                                      hint: "Price",
                                                      icon: const Icon(
                                                        Icons.price_check_sharp,
                                                        color: red,
                                                      ),
                                                      type:
                                                          TextInputType.number,
                                                    ),
                                                  ],
                                                )),
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          height: screenheight *
                                                              0.05,
                                                          width:
                                                              screenwidth * 0.3,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                if (!((typeOfferController.text == "") ||
                                                                    (daysController
                                                                            .text ==
                                                                        "") ||
                                                                    (priceController
                                                                            .text ==
                                                                        "") ||
                                                                    (sessionsController
                                                                            .text ==
                                                                        ""))) {
                                                                  Get.back();
                                                                  setState(() {
                                                                    controller
                                                                        .editOfferData(
                                                                      days: daysController
                                                                          .text,
                                                                      sessions:
                                                                          sessionsController
                                                                              .text,
                                                                      type: typeOfferController
                                                                          .text,
                                                                      price: priceController
                                                                          .text,
                                                                      id: docs[
                                                                              index]
                                                                          .id,
                                                                    );
                                                                  });

                                                                  Get.snackbar(
                                                                      "", "",
                                                                      snackPosition:
                                                                          SnackPosition
                                                                              .BOTTOM,
                                                                      titleText:
                                                                          const Text(
                                                                        "Done..!",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ),
                                                                      messageText:
                                                                          const Text(
                                                                        "The offer has been edited",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ));
                                                                } else {
                                                                  Get.snackbar(
                                                                      "", "",
                                                                      snackPosition:
                                                                          SnackPosition
                                                                              .BOTTOM,
                                                                      titleText:
                                                                          const Text(
                                                                        "Oops..!",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ),
                                                                      messageText:
                                                                          const Text(
                                                                        "Please fill all the fields",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ));
                                                                }
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Save',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: 10 *
                                                                          (screenheight /
                                                                              screenwidth),
                                                                      color:
                                                                          red,
                                                                    ),
                                                                  ),
                                                                  const Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color:
                                                                          red),
                                                                ],
                                                              )),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          height: screenheight *
                                                              0.05,
                                                          width:
                                                              screenwidth * 0.3,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                                setState(() {
                                                                  controller.deleteDocument(
                                                                      docs[index]
                                                                          .id);
                                                                  Get.snackbar(
                                                                      "", "",
                                                                      snackPosition:
                                                                          SnackPosition
                                                                              .BOTTOM,
                                                                      titleText:
                                                                          const Text(
                                                                        "Done..!",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ),
                                                                      messageText:
                                                                          const Text(
                                                                        "The offer has been deleted",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black,
                                                                        ),
                                                                      ));
                                                                });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Delete',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: 10 *
                                                                          (screenheight /
                                                                              screenwidth),
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                                  const Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color:
                                                                          white),
                                                                ],
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ]);
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        height: screenheight * 0.15,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "images/edit_our_offer.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(color: white)),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  docs[index]['type'],
                                                  style: TextStyle(
                                                      color: red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  docs[index]['days'],
                                                  style: TextStyle(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  docs[index]['sessions'],
                                                  style: TextStyle(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  docs[index]['price'],
                                                  style: TextStyle(
                                                      color: red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              ]),
                                        ),
                                      ));
                                }),
                      ),
                      FloatingActionButton(
                        backgroundColor: white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  backgroundColor: const Color(0xFF4F4F4F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 50.0,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: red,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              }),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Add New offers",
                                            style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Icon(
                                            Icons.edit_calendar_outlined,
                                            size: 25,
                                            color: white,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  content: SingleChildScrollView(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      myTextformfield(
                                          controller: typeOfferController,
                                          hint: "Type of the offer",
                                          icon: const Icon(
                                            Icons.edit,
                                            color: red,
                                          ),
                                          limit: 8),
                                      myTextformfield(
                                        controller: daysController,
                                        hint: "Days",
                                        icon: const Icon(
                                          Icons.edit,
                                          color: red,
                                        ),
                                        type: TextInputType.number,
                                        limit: 2,
                                      ),
                                      myTextformfield(
                                        controller: sessionsController,
                                        hint: "Sessions",
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          color: red,
                                        ),
                                        type: TextInputType.number,
                                        limit: 2,
                                      ),
                                      myTextformfield(
                                        controller: priceController,
                                        hint: "Price",
                                        icon: const Icon(
                                          Icons.price_check_sharp,
                                          color: red,
                                        ),
                                        type: TextInputType.number,
                                        limit: 4,
                                      ),
                                    ],
                                  )),
                                  actions: <Widget>[
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: screenheight * 0.05,
                                        width: screenwidth * 0.3,
                                        child: TextButton(
                                            onPressed: () {
                                              if (!((typeOfferController.text ==
                                                      "") ||
                                                  (daysController.text == "") ||
                                                  (priceController.text ==
                                                      "") ||
                                                  (sessionsController.text ==
                                                      ""))) {
                                                Get.back();
                                                setState(() {
                                                  controller.storeOfferData(
                                                    days: daysController.text,
                                                    sessions:
                                                        sessionsController.text,
                                                    price: priceController.text,
                                                    type: typeOfferController
                                                        .text,
                                                  );
                                                });

                                                Get.snackbar("", "",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    titleText: const Text(
                                                      "Done..!",
                                                      style: TextStyle(
                                                        color: black,
                                                      ),
                                                    ),
                                                    messageText: const Text(
                                                      "The offer has been added",
                                                      style: TextStyle(
                                                        color: black,
                                                      ),
                                                    ));
                                              } else {
                                                Get.snackbar("", "",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    titleText: const Text(
                                                      "Oops..!",
                                                      style: TextStyle(
                                                        color: black,
                                                      ),
                                                    ),
                                                    messageText: const Text(
                                                      "Please fill all the fields",
                                                      style: TextStyle(
                                                        color: black,
                                                      ),
                                                    ));
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    fontSize: 10 *
                                                        (screenheight /
                                                            screenwidth),
                                                    color: white,
                                                  ),
                                                ),
                                                const Icon(Icons.check_circle,
                                                    color: white),
                                              ],
                                            )),
                                      ),
                                    )
                                  ]);
                            },
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: black,
                          size: 20 * (screenheight / screenwidth),
                        ),
                      )
                    ]))
              ])));
            }));
  }
}
