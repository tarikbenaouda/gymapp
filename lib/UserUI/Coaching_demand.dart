import 'package:flutter/material.dart';

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

class coaching_demand extends StatefulWidget {
  @override
  State<coaching_demand> createState() => coaching_demand_State();
}

class coaching_demand_State extends State<coaching_demand> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Stack(children: [
      Container(
          height: screenheight,
          width: screenwidth,
          decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(top: 10),
                  iconSize: 40,
                  icon: Icon(Icons.keyboard_double_arrow_left_rounded,
                      size: 25 * (screenheight / screenwidth)),
                  color: red,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Coaching Demand ",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10 * (screenheight / screenwidth),
                  ),
                ),
                Icon(
                  Icons.person,
                  color: red,
                  size: 15 * (screenheight / screenwidth),
                )
              ],
            ),
            SizedBox(
              height: 0.23 * (screenheight),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/edit_shop.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: red, width: 0.5),
              ),
              height: screenheight * 0.55,
              width: 400,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Demand Formula",
                      style: TextStyle(
                          color: white,
                          fontSize: 10 * (screenheight / screenwidth)),
                    ),
                  )
                ],
              ),
            ),
          ]))
    ]))));
  }
}
