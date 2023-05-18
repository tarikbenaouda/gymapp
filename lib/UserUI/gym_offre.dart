import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';

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

class gym_offer extends StatefulWidget {
  @override
  State<gym_offer> createState() => gym_offer_State();
}

class gym_offer_State extends State<gym_offer> {
  String ValueChooseOffre = "normal offer";
  int current = 0;
  List<Offer> list_offres = [
    Offer(
      type_offer: 'Normal offer',
      month: "10 months",
      price: "2000 DA",
      sessions: "9 Sessions",
    ),
    Offer(
      type_offer: 'Normal Offre',
      month: "10 months",
      price: "1000 DA",
      sessions: "10 Sessions",
    ),
    Offer(
      type_offer: 'Special Offre',
      month: "4 months ",
      price: "2500 DA",
      sessions: "2 Sessions",
    ),
    Offer(
      type_offer: 'Special Offre',
      month: "4 months ",
      price: "2500 DA",
      sessions: "2 Sessions",
    ),
    Offer(
      type_offer: 'Special Offre',
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
    TextEditingController type_offer_controller =
        TextEditingController(); // Create a new instance of TextEditingController
    type_offer_controller.text = "";
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
            Text(
              "Gym offers",
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 0.22 * screenheight,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: red, width: 1),
              ),
              height: 0.55 * screenheight,
              width: 0.9 * screenwidth,
              margin: const EdgeInsets.all(10),
              child: list_offres.length > 0
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: list_offres
                          .length, // This list is defined at the beginning
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                            child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: screenheight * 0.15,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${list_offres[index].type_offer}",
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
                      })
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No offres,wait for us soon",
                          style: TextStyle(color: white, fontSize: 25),
                        ),
                        Icon(
                          Icons.back_hand_rounded,
                          color: red,
                          size: 40,
                        )
                      ],
                    ),
            ),
          ]))
    ]))));
  }
}
