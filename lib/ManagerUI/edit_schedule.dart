import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

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
          decoration: BoxDecoration(
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
                    padding: EdgeInsets.only(top: 30),
                    iconSize: 40,
                    icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                    color: r,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 50),
                    iconSize: 40,
                    icon: Icon(Icons.list),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    "Edit Schedule And State",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              const Text(
                "Gym State",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
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
              SizedBox(
                height: 25,
              ),
              Text(
                "Our Schedule",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 68, 68, 67),
                  border: Border.all(color: r, width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: r,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: r,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 60, horizontal: 10),
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
