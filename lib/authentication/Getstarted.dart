// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:gymapp/consts/consts.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF393939),
      body: ListView(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(
            child: Row(
              children: [
                Text(
                  "               Fire-",
                  style: TextStyle(
                      color: Color(0xFFFF1E0F),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Muscles",
                  style: TextStyle(
                      color: Color(0xFFFAF8F8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Color(0xFFFF1E0F)),
                  onPressed: () {
                    //Navigator.of(context).pushNamed("welcome");
                    Get.to(() => Unboarding());
                  },
                  child: Text(
                    "Get Start",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Expanded(
              child: Text(
                "This application is subject to high protection and you can also use it after you are accepted by the club management.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 100,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
