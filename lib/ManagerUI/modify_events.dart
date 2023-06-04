import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/Colors.dart';
import '../controlllers/event_controller.dart';

class event {
  String type_event;
  String begin;
  String end;
  String shop_reductions;

  event(
      {required this.type_event,
      required this.begin,
      required this.end,
      required this.shop_reductions});
}

class modify_events extends StatefulWidget {
  @override
  State<modify_events> createState() => modify_events_State();
}

class modify_events_State extends State<modify_events> {
  final _userStream =
      FirebaseFirestore.instance.collection('events').snapshots();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EventController());

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    TextEditingController beginController =
        TextEditingController(); // Create a new instance of TextEditingController

    TextEditingController reductionController =
        TextEditingController(); // Create a new instance of TextEditingController
    TextEditingController nameController =
        TextEditingController(); // Create a new instance of TextEditingController
    TextEditingController endController =
        TextEditingController(); // Create a new  of

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
              var docs = snapshot.data!.docs;
              return SingleChildScrollView(
                  child: SafeArea(
                      child: Stack(children: [
                Container(
                    height: screenheight,
                    width: screenwidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/16.jpg"),
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
                      const Text(
                        "Modify the events",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
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
                          child: (docs.isNotEmpty)
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: docs.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (ctx, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            nameController.text =
                                                docs[index]['name'];
                                            beginController.text =
                                                docs[index]['begin'];
                                            endController.text =
                                                docs[index]['end'];
                                            reductionController.text =
                                                docs[index]['reduction'];
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
                                                      const EdgeInsets
                                                          .symmetric(
                                                    vertical: 50.0,
                                                  ),
                                                  title: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
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
                                                            "Edit The event",
                                                            style: TextStyle(
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                  content:
                                                      SingleChildScrollView(
                                                          child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      myTextformfield(
                                                        controller:
                                                            nameController,
                                                        hint:
                                                            "Type of the event",
                                                        icon: const Icon(
                                                          Icons.event_available,
                                                          color: red,
                                                        ),
                                                      ),
                                                      myTextformfield(
                                                        controller:
                                                            beginController,
                                                        hint: "Begin day",
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color: red,
                                                        ),
                                                      ),
                                                      myTextformfield(
                                                        controller:
                                                            endController,
                                                        hint: "End day",
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color: red,
                                                        ),
                                                      ),
                                                      myTextformfield(
                                                        controller:
                                                            reductionController,
                                                        hint: "Shop reductions",
                                                        icon: const Icon(
                                                          Icons.percent,
                                                          color: red,
                                                        ),
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
                                                            height:
                                                                screenheight *
                                                                    0.05,
                                                            width: screenwidth *
                                                                0.3,
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  if (!((nameController.text == "") ||
                                                                      (beginController
                                                                              .text ==
                                                                          "") ||
                                                                      (endController
                                                                              .text ==
                                                                          "") ||
                                                                      (reductionController
                                                                              .text ==
                                                                          ""))) {
                                                                    Get.back();
                                                                    setState(
                                                                        () {
                                                                      controller
                                                                          .editEventData(
                                                                        name: nameController
                                                                            .text,
                                                                        begin: beginController
                                                                            .text,
                                                                        end: endController
                                                                            .text,
                                                                        reduction:
                                                                            reductionController.text,
                                                                        id: docs[index]
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
                                                                          "The Event has been edited",
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
                                                                        fontSize:
                                                                            10 *
                                                                                (screenheight / screenwidth),
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
                                                            height:
                                                                screenheight *
                                                                    0.05,
                                                            width: screenwidth *
                                                                0.3,
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
                                                                          "The event has been deleted",
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
                                                                        fontSize:
                                                                            10 *
                                                                                (screenheight / screenwidth),
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
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  docs[index]['name'],
                                                  style: const TextStyle(
                                                      color: red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 21),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      docs[index]['begin'],
                                                      style: const TextStyle(
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .arrow_right_alt_sharp,
                                                      color: red,
                                                      size: 40,
                                                    ),
                                                    Text(
                                                      docs[index]['end'],
                                                      style: const TextStyle(
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      docs[index]['reduction'],
                                                      style: const TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                    const Text(
                                                      "(Reductions)",
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                        color: black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ));
                                  })
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No events,wait for us soon",
                                      style:
                                          TextStyle(color: white, fontSize: 24),
                                    ),
                                    Icon(
                                      Icons.add_card_rounded,
                                      size: 24,
                                      color: white,
                                    )
                                  ],
                                )),
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
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Add New event",
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
                                        controller: nameController,
                                        hint: "Type of the event",
                                        icon: const Icon(
                                          Icons.edit,
                                          color: red,
                                        ),
                                      ),
                                      myTextformfield(
                                        controller: beginController,
                                        hint: "begins",
                                        icon: const Icon(
                                          Icons.edit,
                                          color: red,
                                        ),
                                      ),
                                      myTextformfield(
                                        controller: endController,
                                        hint: "end",
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          color: red,
                                        ),
                                      ),
                                      myTextformfield(
                                        controller: reductionController,
                                        hint: "shop_reductions",
                                        icon: const Icon(
                                          Icons.price_check_sharp,
                                          color: red,
                                        ),
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
                                              if (!((nameController.text ==
                                                      "") ||
                                                  (beginController.text ==
                                                      "") ||
                                                  (endController.text == "") ||
                                                  (reductionController.text ==
                                                      ""))) {
                                                Get.back();
                                                setState(() {
                                                  controller.storeEventData(
                                                    name: nameController.text,
                                                    begin: beginController.text,
                                                    end: endController.text,
                                                    reduction:
                                                        reductionController
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
                                                      "The event has been added",
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
