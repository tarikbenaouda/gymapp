// ignore_for_file: prefer_const_constructors

import 'package:gymapp/consts/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Hello, you're logged in §§fvndudbd tarik ",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            "email",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF3282B8),
            ),
            height: 45,
            child: MaterialButton(
              onPressed: (() {}),
              child: Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
