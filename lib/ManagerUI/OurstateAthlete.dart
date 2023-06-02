import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/consts.dart';

import '../common_widgets/my_textformfield.dart';

void main() => runApp(OurstateAthlete());

class OurstateAthlete extends StatelessWidget {
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
              image: AssetImage("images/our stats background.jpg"),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.keyboard_double_arrow_left_outlined,
                  color: Color(0xFFFD372A),
                  size: 45,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Our Stats",
                  style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.pie_chart_outline_outlined,
                  color: Color(0xFFE6E6E6),
                  size: 32,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: (double.infinity) - 10,
            height: screenlength * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView(children: [
              const SizedBox(
                height: 8,
              ),
              Center(
                child: const Text(
                  "Our Athletes Monthly Stats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              MyInfos(Textinput: " Monthly Income", Textinput2: "variable"),

              const SizedBox(
                height: 8,
              ),
              MyInfos(Textinput: " Net Profis", Textinput2: "variable"),
              const SizedBox(
                height: 8,
              ),
              MyInfos(
                  Textinput: " The Mounth Stats are", Textinput2: "variable"),
              const SizedBox(
                height: 8,
              ),
              MyInfos(Textinput: " Number Of New Athletes", Textinput2: "var"),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage("images/background2.jpg"),
                                fit: BoxFit.fill)),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            " Total The Year Stats",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage("images/background2.jpg"),
                                fit: BoxFit.fill)),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            " To See Last Mounth Stats",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ],
              ),
              //variable of income
            ]),
          ),
        ],
      ),
    ));
  }
}
