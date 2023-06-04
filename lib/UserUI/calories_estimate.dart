import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Estimate extends StatefulWidget {
  double value;

  Estimate({required this.value});

  @override
  State<Estimate> createState() => _EstimateState(value);
}

class _EstimateState extends State<Estimate> {
  double value;

  _EstimateState(this.value);
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: screenlength,
            width: screenwidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/calculate calories background.jpg"),
                fit: BoxFit.fill,
              ),
            ), ///////// the image
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 350, top: 30),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.keyboard_double_arrow_left_outlined,
                        size: 37,
                        color: Color(0xFFFD372A),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  const Text(
                    "Calories Calculator ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                    ),
                  ),
                  const Text("Take the calories you need ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Your Daily  Calories Estimate : ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                        "This Is Your Calories You Need  To Your Weight.  ",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.grey,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: const DecorationImage(
                          opacity: 0.7,
                          image:
                              AssetImage("images/caculate calories pic 2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                          child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: value.toStringAsFixed(2) + ' cal',
                              style: const TextStyle(
                                color: Color(0xFFFD372A),
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white,
                              )),
                        ]),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
