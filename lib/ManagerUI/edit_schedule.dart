import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
=======
import 'package:gymapp/consts/consts.dart';
>>>>>>> a99fadf (Some modification)

class Edit_schedule extends StatefulWidget {
  @override
  State<Edit_schedule> createState() => _Edit_schedule_State();
}

class _Edit_schedule_State extends State<Edit_schedule> {
  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
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
<<<<<<< HEAD
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
                      Get.back();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 50),
                    iconSize: 40,
                    icon: const Icon(Icons.list),
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
              const Text(
                "Our Schedule",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
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
=======
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
>>>>>>> a99fadf (Some modification)
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
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 68, 68, 67),
                    border: Border.all(color: red, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: red,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 10),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: red,
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
      ),
    );
  }
}
