import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/UserUI/home_view.dart';

import '../common_widgets/my_textformfield.dart';
import '../consts/Colors.dart';

class coaching_demand extends StatefulWidget {
  @override
  State<coaching_demand> createState() => coaching_demand_State();
}

class coaching_demand_State extends State<coaching_demand> {
  @override
  int select_radio = 0;
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/demand coaching background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(top: 10),
                  iconSize: 55,
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
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Coaching Demand ",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Icon(
                  Icons.person,
                  color: white,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              height: 0.03 * (screenheight),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image:
                      AssetImage("images/demand coaching mini background.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: red, width: 0.1),
              ),
              height: screenheight * 0.7,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Demand Formule",
                      style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 0.05 * screenheight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Old coach:",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: red,
                            fontSize: 23),
                      ),
                      InkWell(
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: select_radio == 1 ? red : white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: select_radio == 1 ? white : red,
                                  width: 2)),
                        ),
                        onTap: () {
                          setState(() {
                            select_radio = 1;
                          });
                        },
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(
                            color: select_radio == 1 ? red : white,
                            fontSize: 20),
                      ),
                      InkWell(
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: select_radio == 2 ? red : white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: select_radio == 2 ? white : red,
                                  width: 2)),
                        ),
                        onTap: () {
                          setState(() {
                            select_radio = 2;
                          });
                        },
                      ),
                      Text(
                        "No",
                        style: TextStyle(
                            color: select_radio == 2 ? red : white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.03 * screenheight,
                  ),
                  if ((select_radio == 1) || (select_radio == 0))
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coaching During :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: red,
                                  fontSize: 23),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.02 * screenheight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenheight * 0.05,
                              width: 0.25 * screenwidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white),
                              child: const TextField(
                                keyboardType: TextInputType.numberWithOptions(),
                                maxLength: 3,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                cursorColor: red,
                                style: TextStyle(color: black, fontSize: 25),
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Text(
                              "months",
                              style: TextStyle(color: white, fontSize: 20),
                            ),
                            Container(
                              height: screenheight * 0.05,
                              width: 0.25 * screenwidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white),
                              child: const TextField(
                                maxLength: 3,
                                keyboardType: TextInputType.numberWithOptions(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                cursorColor: red,
                                style: TextStyle(color: black, fontSize: 25),
                                decoration: InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: red, fontSize: 25)),
                              ),
                            ),
                            const Text(
                              "years",
                              style: TextStyle(color: white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 0.03 * screenheight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Why you want coaching here :",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: red,
                            fontSize: 23),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.03 * screenheight,
                  ),
                  Container(
                    height: screenheight * 0.15,
                    width: 0.9 * screenwidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: white),
                    child: const TextField(
                      textAlign: TextAlign.start,
                      cursorColor: red,
                      maxLines: null,
                      style: TextStyle(color: black, fontSize: 25),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.07 * screenheight,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding: EdgeInsets.zero,
                            content: SingleChildScrollView(
                              child: Container(
                                width: screenwidth * 0.5,
                                height: screenheight * 0.4,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "images/demand coaching mini background.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Your demand is sended',
                                      style:
                                          TextStyle(fontSize: 22, color: white),
                                    ),
                                    const Text(
                                      'to administrator',
                                      style:
                                          TextStyle(fontSize: 22, color: white),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.05,
                                    ),
                                    const Text(
                                      'Wait for the answer',
                                      style:
                                          TextStyle(fontSize: 22, color: white),
                                    ),
                                    SizedBox(
                                      height: 0.1 * screenheight,
                                    ),
                                    Container(
                                      height: 0.05 * screenheight,
                                      width: 0.4 * screenwidth,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Return to Home',
                                            style: TextStyle(
                                              fontSize: 10 *
                                                  (screenheight / screenwidth),
                                              color: red,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: screenheight * 0.05,
                      width: screenwidth * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Send",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 0.03 * screenwidth),
                          const Icon(
                            Icons.send,
                            color: white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]))
    ]))));
  }
}
