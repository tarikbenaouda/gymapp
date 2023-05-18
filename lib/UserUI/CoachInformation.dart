import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/UserUI/ListofCoachsinUser.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';
import 'Coaching_demand.dart';

class CoachInforamtion extends StatefulWidget {
  const CoachInforamtion({super.key});

  @override
  State<CoachInforamtion> createState() => _CoachInforamtionState();
}

class _CoachInforamtionState extends State<CoachInforamtion> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenlength,
        width: screenwidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ListofCoachinuser());
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    color: Colors.red,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Center(
            child: Text(
              " Coach Information ",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: screenlength * 0.75,
              width: screenwidth - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ListTile(
                      autofocus: true,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                      ),
                      title: Text(
                        "variable username",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyInfos(Textinput: " FullName", Textinput2: "variable "),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Age", Textinput2: "variable "),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Email", Textinput2: "variable of Email"),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Phone Number", Textinput2: "variable"),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Height", Textinput2: "variable"),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Old Coching ", Textinput2: "variable"),
                  const SizedBox(
                    height: 3,
                  ),
                  MyInfos(
                      Textinput: " Coaching During ", Textinput2: "variable "),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
