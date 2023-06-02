import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gymapp/UserUI/home_view.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/consts/consts.dart';

class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "images/whey.jpg",
              fit: BoxFit.fill,
            ),
          ),
          buttonArrow(context),
          scroll()
        ],
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => HomeViewAthlete());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 310),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      size: 37,
                      color: Color(0xFFFD372A),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.60,
        maxChildSize: 1.0,
        minChildSize: 0.60,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: const Color(0xFF252525),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: const Color(0xFFD9D9D9),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Protein Whey",
                    style: TextStyle(
                      fontSize: 26,
                      color: const Color(
                        0xFFD9D9D9,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A powdered form of proteins taken from whey, which is the liquid left over when cheese is made from cow/\'s milk. Whey protein powder is used to increase protein in the diet and is being studied for possible health benefits',
                    style: TextStyle(
                      fontSize: 19,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Why choose whey?",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Whey concentrate contains between 70-80% protein, is higher in lactose, and is high in biologically active components you'd find in whole milk. This would be a good option for those looking for better recovery from workouts, and for building/maintaining muscles.",
                    style: TextStyle(
                      fontSize: 23,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Why choose whey?",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Whey is an excellent source of high quality protein",
                    style: TextStyle(
                      fontSize: 23,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  Text(
                    " Whey is an excellent source of high quality protein",
                    style: TextStyle(
                      fontSize: 23,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  Text(
                    " Whey is an excellent source of high quality protein",
                    style: TextStyle(
                      fontSize: 23,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  Text(
                    " Whey is an excellent source of high quality protein",
                    style: TextStyle(
                      fontSize: 23,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  ingredients(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFE3FFF8),
            child: Icon(
              Icons.done,
              size: 15,
              color: black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "4 Eggs",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  steps(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: black,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/2.jpg",
                height: 155,
                width: 270,
              )
            ],
          )
        ],
      ),
    );
  }
}
