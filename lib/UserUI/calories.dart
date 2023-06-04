import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/SettingsUser.dart';
import 'package:gymapp/consts/consts.dart';

import 'calories_estimate.dart';
import 'home_view.dart';

class Calories extends StatefulWidget {
  const Calories({Key? key}) : super(key: key);

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  double calculateCalories(double age, double height, double weight,
      String intensity, bool increaseWeight) {
    double bmr;
    double activityFactor;
    if (increaseWeight) {
      bmr = 88.3 + (10 * weight) + (6.25 * height) - (5 * age);
    } else {
      bmr = 5.5 + (4.35 * weight) + (4.7 * height) - (4.7 * age);
    }
    switch (intensity) {
      case 'No Training':
        activityFactor = 1.2;
        break;
      case 'Lightly Training':
        activityFactor = 1.375;
        break;
      case 'Moderately Training':
        activityFactor = 1.55;
        break;
      case 'Very Hard Training':
        activityFactor = 1.725;
        break;
      case 'Extra Training':
        activityFactor = 1.9;
        break;
      default:
        activityFactor = 1.2;
        break;
    }

    return (bmr * activityFactor);
  }

  double calories = 0;

  bool _increaseWeight = true;
  String gender = '';
  double height = 0, weight = 0, age = 0;
  static const List<String> list = <String>[
    'No Training',
    'Lightly Training',
    'Moderately Training',
    'Very Hard Training',
    'Extra Training'
  ];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/calculate calories background.jpg"),
              fit: BoxFit.fill,
            ),
          ), ///////// the image
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Calories Calculator ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Take the calories you need ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.7,
                        image:
                            AssetImage("images/calculate calories pic 1.jpg"),
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Type your actual information",
                    style: TextStyle(
                      color: Color(0xFFFF372A),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            age = double.tryParse(value) ?? 0;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Age ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            weight = double.tryParse(value) ?? 0;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Weight ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFD9D9D9),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: SizedBox(
                    width: 160,
                    height: 50,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          height = double.tryParse(value) ?? 0;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Height ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Choose Your Needs Calories For :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Row(
                    children: [
                      const Text(
                        "Increase",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Radio(
                        value: true,
                        activeColor: const Color(0xFFFF372A),
                        groupValue: _increaseWeight,
                        onChanged: (value) {
                          setState(() {
                            _increaseWeight = value!;
                          });
                        },
                      ),
                      const Text(
                        "Decrease",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Radio(
                        value: false,
                        activeColor: const Color(0xFFFF372A),
                        groupValue: _increaseWeight,
                        onChanged: (value) {
                          setState(() {
                            _increaseWeight = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(15),
                    value: dropdownValue,
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (age != 0 && height != 0 && weight != 0) {
                      calories = calculateCalories(
                          age, height, weight, dropdownValue, _increaseWeight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Estimate(
                                  value: calories,
                                )),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please fill in all the required fields.",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Get Your Calories ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF372A)),
                  ),
                )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
