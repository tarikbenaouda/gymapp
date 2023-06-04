import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/Colors.dart';

class Edit_schedule extends StatefulWidget {
  @override
  State<Edit_schedule> createState() => _Edit_schedule_State();
}

class Time {
  String morning_begin = "";
  String moring_end = "";
  String evening_begin = "";
  String evening_end = "";
  Time(
      {required this.evening_begin,
      required this.evening_end,
      required this.moring_end,
      required this.morning_begin});
}

class _Edit_schedule_State extends State<Edit_schedule> {
  final _controller = ValueNotifier<bool>(false);
  Map<String, Time> days_map = {
    "Mon": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Tue": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Wed": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Thu": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Fri": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Sat": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
    "Sun": Time(
        evening_begin: " 20:30",
        evening_end: "12:40",
        moring_end: "13:00",
        morning_begin: "10:30"),
  };

  int current = 0;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    //List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenheight,
            width: screenwidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/admin settings background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      //padding: const EdgeInsets.only(top: 30),
                      iconSize: 40,
                      icon: const Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        size: 50,
                      ),
                      color: red,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Edit Schedule",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 0.03 * screenheight),
                Center(
                  child: Text(
                    "Gym State",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0.01 * screenheight,
                ),
                AdvancedSwitch(
                  width: 110,
                  height: 40,
                  controller: _controller,
                  inactiveColor: white,
                  activeColor: red,
                  activeChild: Text(
                    "Open",
                    style: TextStyle(color: white, fontSize: 20),
                  ),
                  inactiveChild: Text(
                    "Closed",
                    style: TextStyle(color: red, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenheight,
                ),
                const Text(
                  "Our Schedule",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.02 * screenheight,
                ),
                Container(
                  height: 0.48 * screenheight,
                  width: screenwidth * 0.95,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 68, 68, 67),
                    border: Border.all(color: red, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 0.02 * screenheight),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: days_map.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 0.20 * screenwidth,
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: current == index ? red : white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    days_map.keys.toList()[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: current == index ? white : black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * screenheight,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: screenheight * 0.28,
                        width: screenwidth * 0.9,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: black, width: 2)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Morning",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      width: screenwidth * 0.1,
                                      height: screenheight * 0.05,
                                      decoration: BoxDecoration(
                                          color: black,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const TextField(
                                        keyboardType: TextInputType.datetime,
                                        maxLength: 5,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        cursorColor: white,
                                        style: TextStyle(
                                            color: white, fontSize: 25),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: screenwidth * 0.1,
                                    height: screenheight * 0.05,
                                    decoration: BoxDecoration(
                                        color: black,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const TextField(
                                      keyboardType: TextInputType.datetime,
                                      maxLength: 5,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      cursorColor: white,
                                      style:
                                          TextStyle(color: white, fontSize: 25),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                              Container(
                                height: 2,
                                width: 0.8 * screenwidth,
                                color: black,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Evening ",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      width: screenwidth * 0.1,
                                      height: screenheight * 0.05,
                                      decoration: BoxDecoration(
                                          color: black,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: TextField(
                                        keyboardType: TextInputType.datetime,
                                        maxLength: 5,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        cursorColor: white,
                                        style: TextStyle(
                                            color: white, fontSize: 25),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.all(10),
                                    width: screenwidth * 0.1,
                                    height: screenheight * 0.05,
                                    decoration: BoxDecoration(
                                        color: black,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const TextField(
                                      keyboardType: TextInputType.datetime,
                                      maxLength: 5,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      cursorColor: white,
                                      style:
                                          TextStyle(color: white, fontSize: 25),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
