import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/home_page.dart';

class listofcoachs extends StatefulWidget {
  const listofcoachs({super.key});

  @override
  State<listofcoachs> createState() => _listofcoachsState();
}

class _listofcoachsState extends State<listofcoachs> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenlength,
        width: screenwidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomeView())));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: const [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //drawer
                Text(
                  "Our Coachs",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
            Container(
              width: double.infinity,
              height: 550,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 22, 22),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Coachs List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " Variable",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 32,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("CoachProfile");
                            },
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                width: (double.infinity) - 40,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const ListTile(
                                  leading: null,
                                  title: null,
                                )));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
