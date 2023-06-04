import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/consts/Colors.dart';

class Edit_schedule extends StatefulWidget {
  @override
  State<Edit_schedule> createState() => _Edit_schedule_State();
}

class _Edit_schedule_State extends State<Edit_schedule> {
  final _userStream =
      FirebaseFirestore.instance.collection('schedule').snapshots();

  var _controller = ValueNotifier<bool>(false);

  int current = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController morningBeginController = TextEditingController();
    TextEditingController morningEndController = TextEditingController();
    TextEditingController eveningBeginController = TextEditingController();
    TextEditingController eveningEndController = TextEditingController();

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    //List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Scaffold(
      body: StreamBuilder(
          stream: _userStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs;
            morningBeginController.text = docs[current]['morningBegin'];
            morningEndController.text = docs[current]['morningEnd'];
            eveningBeginController.text = docs[current]['eveningBegin'];
            eveningEndController.text = docs[current]['eveningEnd'];
            return SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: screenheight,
                  width: screenwidth,
                  decoration: const BoxDecoration(
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
                      const Center(
                        child: Text(
                          "Edit Schedule",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 0.03 * screenheight),
                      const Center(
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
                        activeChild: const Text(
                          "Open",
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                        inactiveChild: const Text(
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.02 * screenheight),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: 0.20 * screenwidth,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                        color: current == index ? red : white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          docs[index]['day'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: current == index
                                                ? white
                                                : black,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Morning",
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: screenwidth * 0.1,
                                            height: screenheight * 0.05,
                                            decoration: BoxDecoration(
                                                color: black,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              controller:
                                                  morningBeginController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              maxLength: 5,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              cursorColor: white,
                                              style: const TextStyle(
                                                  color: white, fontSize: 25),
                                              decoration: const InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          margin: const EdgeInsets.all(10),
                                          width: screenwidth * 0.1,
                                          height: screenheight * 0.05,
                                          decoration: BoxDecoration(
                                              color: black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: TextField(
                                            controller: morningEndController,
                                            keyboardType:
                                                TextInputType.datetime,
                                            maxLength: 5,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            cursorColor: white,
                                            style: const TextStyle(
                                                color: white, fontSize: 25),
                                            decoration: const InputDecoration(
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
                                        const Text(
                                          "Evening ",
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: screenwidth * 0.1,
                                            height: screenheight * 0.05,
                                            decoration: BoxDecoration(
                                                color: black,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextField(
                                              controller:
                                                  eveningBeginController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              maxLength: 5,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              cursorColor: white,
                                              style: const TextStyle(
                                                  color: white, fontSize: 25),
                                              decoration: const InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          margin: const EdgeInsets.all(10),
                                          width: screenwidth * 0.1,
                                          height: screenheight * 0.05,
                                          decoration: BoxDecoration(
                                              color: black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: TextField(
                                            controller: eveningEndController,
                                            keyboardType:
                                                TextInputType.datetime,
                                            maxLength: 5,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            cursorColor: white,
                                            style: const TextStyle(
                                                color: white, fontSize: 25),
                                            decoration: const InputDecoration(
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
            );
          }),
    );
  }
}
