import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/ManagerUI/home_page.dart';

class Edit_schedule extends StatefulWidget {
  @override
  State<Edit_schedule> createState() => _Edit_schedule_State();
}

class _Edit_schedule_State extends State<Edit_schedule> {
  final _controller = ValueNotifier<bool>(false);
  Color r = Colors.red;
  Color w = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/edit_schedule.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(top: 30),
                    iconSize: 40,
                    icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                    color: r,
                    onPressed: () {
                      Get.to(() => HomeView());
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Edit Schedule And State",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: const Text(
                  "Gym State",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AdvancedSwitch(
                width: 100,
                height: 30,
                controller: _controller,
                //inactiveColor: w,
                activeColor: r,
                activeChild: Text(
                  "Open",
                  style: TextStyle(color: w, fontSize: 20),
                ),
                inactiveChild: Text(
                  "Closed",
                  style: TextStyle(color: r, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: const Text(
                  "Our Schedule",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 68, 68, 67),
                  border: Border.all(color: r, width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: r,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60, horizontal: 10),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: r,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60, horizontal: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
