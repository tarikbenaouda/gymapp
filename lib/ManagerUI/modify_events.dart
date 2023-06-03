import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';

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
  int current = 0;
  List<event> list_events = [
    event(
      type_event: 'Ramadan event',
      begin: "10/05/2023",
      end: "09/06/2023",
      shop_reductions: "20%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    TextEditingController begin_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    begin_controller.text = "";
    TextEditingController shop_reductions_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    shop_reductions_controller.text = "";
    TextEditingController type_event_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    type_event_controller.text = "";
    TextEditingController end_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    end_controller.text = "";

    return Scaffold(
        body: SingleChildScrollView(
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
                child: (list_events.length > 0)
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: list_events
                            .length, // This list is defined at the beginning
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor:
                                            const Color(0xFF4F4F4F),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Edit The event",
                                                  style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10 *
                                                        (screenheight /
                                                            screenwidth),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.edit_calendar_outlined,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            myTextformfield(
                                              controller: type_event_controller,
                                              hint: "Type of the event",
                                              icon: const Icon(
                                                Icons.event_available,
                                                color: red,
                                              ),
                                            ),
                                            myTextformfield(
                                              controller: begin_controller,
                                              hint: "Begin day",
                                              icon: const Icon(
                                                Icons.edit,
                                                color: red,
                                              ),
                                            ),
                                            myTextformfield(
                                              controller: end_controller,
                                              hint: "End day",
                                              icon: const Icon(
                                                Icons.edit,
                                                color: red,
                                              ),
                                            ),
                                            myTextformfield(
                                              controller:
                                                  shop_reductions_controller,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  height: screenheight * 0.05,
                                                  width: screenwidth * 0.3,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        if (!((type_event_controller.text == "") ||
                                                            (begin_controller
                                                                    .text ==
                                                                "") ||
                                                            (shop_reductions_controller
                                                                    .text ==
                                                                "") ||
                                                            (end_controller
                                                                    .text ==
                                                                ""))) {
                                                          setState(() {
                                                            list_events[current]
                                                                    .type_event =
                                                                type_event_controller
                                                                    .text;
                                                            list_events[current]
                                                                    .begin =
                                                                begin_controller
                                                                    .text;
                                                            list_events[current]
                                                                    .end =
                                                                end_controller
                                                                    .text;
                                                            list_events[current]
                                                                    .shop_reductions =
                                                                shop_reductions_controller
                                                                    .text;
                                                          });
                                                          Get.back();
                                                        } else
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return const AlertDialog(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF4F4F4F),
                                                                title: Text(
                                                                  "Error",
                                                                  style: TextStyle(
                                                                      color:
                                                                          white),
                                                                ),
                                                                content: Text(
                                                                    "Oops! Something filed is wrong.",
                                                                    style: TextStyle(
                                                                        color:
                                                                            white)),
                                                              );
                                                            },
                                                          );
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Save',
                                                            style: TextStyle(
                                                              fontSize: 10 *
                                                                  (screenheight /
                                                                      screenwidth),
                                                              color: red,
                                                            ),
                                                          ),
                                                          const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: red),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  height: screenheight * 0.05,
                                                  width: screenwidth * 0.3,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                        setState(() {
                                                          list_events.removeAt(
                                                              current);
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                              fontSize: 10 *
                                                                  (screenheight /
                                                                      screenwidth),
                                                              color: white,
                                                            ),
                                                          ),
                                                          const Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              color: white),
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${list_events[index].type_event}",
                                        style: const TextStyle(
                                            color: red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${list_events[index].begin}",
                                            style: const TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21),
                                          ),
                                          const Icon(
                                            Icons.arrow_right_alt_sharp,
                                            color: red,
                                            size: 40,
                                          ),
                                          Text(
                                            "${list_events[index].end}",
                                            style: const TextStyle(
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${list_events[index].shop_reductions}",
                                            style: const TextStyle(
                                                color: red,
                                                fontWeight: FontWeight.bold,
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
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "No events,wait for us soon",
                            style: TextStyle(color: white, fontSize: 24),
                          ),
                          const Icon(
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Add New event",
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                const Icon(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myTextformfield(
                              controller: type_event_controller,
                              hint: "Type of the event",
                              icon: const Icon(
                                Icons.edit,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: begin_controller,
                              hint: "begins",
                              icon: const Icon(
                                Icons.edit,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: end_controller,
                              hint: "end",
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: shop_reductions_controller,
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
                                  borderRadius: BorderRadius.circular(10)),
                              height: screenheight * 0.05,
                              width: screenwidth * 0.3,
                              child: TextButton(
                                  onPressed: () {
                                    if (!((type_event_controller.text == "") ||
                                        (begin_controller.text == "") ||
                                        (shop_reductions_controller.text ==
                                            "") ||
                                        (end_controller.text == ""))) {
                                      setState(() {
                                        list_events.add(event(
                                          type_event:
                                              type_event_controller.text,
                                          begin: begin_controller.text,
                                          shop_reductions:
                                              shop_reductions_controller.text,
                                          end: end_controller.text,
                                        ));
                                      });
                                      Get.back();
                                    } else
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            backgroundColor: Color(0xFF4F4F4F),
                                            title: Text(
                                              "Error",
                                              style: TextStyle(color: white),
                                            ),
                                            content: Text(
                                                "Oops! Something filed is wrong.",
                                                style: TextStyle(color: white)),
                                          );
                                        },
                                      );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Save',
                                        style: TextStyle(
                                          fontSize:
                                              10 * (screenheight / screenwidth),
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
    ]))));
  }
}
