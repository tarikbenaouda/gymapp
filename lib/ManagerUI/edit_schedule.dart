import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/ManagerUI/home_page.dart';

import '../consts/consts.dart';

class Edit_schedule extends StatefulWidget {
  @override
  State<Edit_schedule> createState() => _Edit_schedule_State();
}

class _Edit_schedule_State extends State<Edit_schedule> {
  final _controller = ValueNotifier<bool>(false);

  int current = 0;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    int current = 0;

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
                      onPressed: () {},
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
                  height: 0.01 * screenheight,
                ),
                Container(
                  height: 0.55 * screenheight,
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
                        height: 0.08 * screenheight,
                        margin:
                            EdgeInsets.symmetric(vertical: 0.02 * screenheight),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: days.length,
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
                                width: 0.14 * screenwidth,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: current == index ? red : white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    days[index],
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
                        height: screenheight * 0.18,
                        width: screenwidth * 0.9,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: screenheight * 0.18,
                        width: screenwidth * 0.9,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10),
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
