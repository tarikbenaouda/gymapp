import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/authentication/Login.dart';
import 'package:gymapp/authentication/Signup1.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Unboarding extends StatefulWidget {
  const Unboarding({super.key});

  @override
  _UnboardingState createState() => _UnboardingState();
}

class _UnboardingState extends State<Unboarding> {
  _onIntroEnd(context) async {
    // Navigator.of(context)
    //    .push(MaterialPageRoute(builder: (context) => const Login()));
    Get.offAll(() => const Login());
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF393939),
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(60)),
              )),
        ),
      ),
      pages: [
        PageViewModel(
          bodyWidget: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(92),
                    image: const DecorationImage(
                        image: AssetImage("images/11.jpg"), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Welcome To Fire-Muscles Warrior ",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "This app will help you to facilitate your training  and communication in our gym. ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          titleWidget: Container(
            child: const Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          bodyWidget: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(92),
                    image: const DecorationImage(
                        image: AssetImage("images/12.jpg"), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Get Your Personnel Coach ",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "Train under the supervision of the best trainersin the gym or even online.  ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          titleWidget: Container(
            child: const Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          bodyWidget: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(92),
                    image: const DecorationImage(
                        image: AssetImage("images/1.jpg"), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Views Training Offers And  Shop ",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "You get the best offers to train and buy the finest supplements and protein ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          titleWidget: Container(
            child: const Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          bodyWidget: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(92),
                    image: const DecorationImage(
                        image: AssetImage("images/2.jpg"), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "get training plans and participate in events and see more things that will help you... ",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Container(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: const Color(0xFFFF1E0F)),
                        onPressed: () {
                          //Navigator.of(context).pushNamed("Login");
                          Get.to(() => const Signup1());
                        },
                        child: const Text(
                          "Go To Create Account ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )),
                  ),
                ),
              ),
            ],
          ),
          titleWidget: Container(
            child: const Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        "Skip",
        style: TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text("Done",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(4),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(100.0, 10.0),
        activeColor: Colors.red,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xFF393939),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
