import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';

class Offer {
  String type_offre;
  String month;
  String sessions;
  String price;

  Offer(
      {required this.type_offre,
      required this.month,
      required this.sessions,
      required this.price});
}

class edit_our_offres extends StatefulWidget {
  @override
  State<edit_our_offres> createState() => edit_our_offres_State();
}

class edit_our_offres_State extends State<edit_our_offres> {
  String ValueChooseOffre = "normal offre";
  int current = 0;
  List<Offer> list_offres = [
    Offer(
      type_offre: 'Normal offre',
      month: "10 months",
      price: "2000 DA",
      sessions: "9 Sessions",
    ),
    Offer(
      type_offre: 'Normal Offre',
      month: "10 months",
      price: "1000 DA",
      sessions: "10 Sessions",
    ),
    Offer(
      type_offre: 'Special Offre',
      month: "4 months ",
      price: "2500 DA",
      sessions: "2 Sessions",
    ),
    Offer(
      type_offre: 'Special Offre',
      month: "4 months ",
      price: "2500 DA",
      sessions: "2 Sessions",
    ),
    Offer(
      type_offre: 'Special Offre',
      month: "4 months ",
      price: "2500 DA",
      sessions: "2 Sessions",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    TextEditingController month_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    month_controller.text = "";
    TextEditingController price_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    price_controller.text = "";
    TextEditingController type_offre_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    type_offre_controller.text = "";
    TextEditingController sessions_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    sessions_controller.text = "";

    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Stack(children: [
      Container(
          height: screenheight,
          width: screenwidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/training offer background.jpg"),
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
              children: [
                Text(
                  "Edit our offres",
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
                    itemCount: list_offres
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
                                              "Edit The Offre",
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
                                                  (screenheight / screenwidth),
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
                                          controller: type_offre_controller,
                                          hint: "Type of the offre",
                                          icon: const Icon(
                                            Icons.edit,
                                            color: red,
                                          ),
                                        ),
                                        myTextformfield(
                                          controller: month_controller,
                                          hint: "Months",
                                          icon: const Icon(
                                            Icons.edit,
                                            color: red,
                                          ),
                                        ),
                                        myTextformfield(
                                          controller: sessions_controller,
                                          hint: "Sessions",
                                          icon: const Icon(
                                            Icons.edit_outlined,
                                            color: red,
                                          ),
                                        ),
                                        myTextformfield(
                                          controller: price_controller,
                                          hint: "Price",
                                          icon: const Icon(
                                            Icons.price_check_sharp,
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
                                                    if (!((type_offre_controller
                                                                .text ==
                                                            "") ||
                                                        (month_controller
                                                                .text ==
                                                            "") ||
                                                        (price_controller
                                                                .text ==
                                                            "") ||
                                                        (sessions_controller
                                                                .text ==
                                                            ""))) {
                                                      setState(() {
                                                        list_offres[current]
                                                                .type_offre =
                                                            type_offre_controller
                                                                .text;
                                                        list_offres[current]
                                                                .month =
                                                            month_controller
                                                                .text;
                                                        list_offres[current]
                                                                .sessions =
                                                            sessions_controller
                                                                .text;
                                                        list_offres[current]
                                                                .price =
                                                            price_controller
                                                                .text;
                                                      });
                                                      Get.back();
                                                    } else
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return const AlertDialog(
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF4F4F4F),
                                                            title: Text(
                                                              "Error",
                                                              style: TextStyle(
                                                                  color: white),
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
                                                          Icons.check_circle,
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
                                                      list_offres
                                                          .removeAt(current);
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
                                                          Icons.delete_forever,
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
                                    "${list_offres[index].type_offre}",
                                    style: TextStyle(
                                        color: red,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            10 * (screenheight / screenwidth)),
                                  ),
                                  Text(
                                    "${list_offres[index].month}",
                                    style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            10 * (screenheight / screenwidth)),
                                  ),
                                  Text(
                                    "${list_offres[index].sessions}",
                                    style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            10 * (screenheight / screenwidth)),
                                  ),
                                  Text(
                                    "${list_offres[index].price}",
                                    style: TextStyle(
                                        color: red,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            10 * (screenheight / screenwidth)),
                                  ),
                                ]),
                          ));
                    })),
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
                                    icon: Icon(
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
                                Text(
                                  "Add New Offre",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myTextformfield(
                              controller: type_offre_controller,
                              hint: "Type of the offre",
                              icon: const Icon(
                                Icons.edit,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: month_controller,
                              hint: "Months",
                              icon: const Icon(
                                Icons.edit,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: sessions_controller,
                              hint: "Sessions",
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: red,
                              ),
                            ),
                            myTextformfield(
                              controller: price_controller,
                              hint: "Price",
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
                                    if (!((type_offre_controller.text == "") ||
                                        (month_controller.text == "") ||
                                        (price_controller.text == "") ||
                                        (sessions_controller.text == ""))) {
                                      setState(() {
                                        list_offres.add(Offer(
                                          type_offre:
                                              type_offre_controller.text,
                                          month: month_controller.text,
                                          price: price_controller.text,
                                          sessions: sessions_controller.text,
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
