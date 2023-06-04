import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/Colors.dart';

class Product {
  String url_image = "";
  String product_name = "";
  String price = "";
  Product(
      {required this.url_image,
      required this.product_name,
      required this.price});
}

class product_type {
  String typeName = "";
  List<Product> product_list;

  product_type({required this.typeName, required this.product_list});
}

class SportPlans extends StatefulWidget {
  @override
  State<SportPlans> createState() => SportPlans_State();
}

class SportPlans_State extends State<SportPlans> {
  Map<String, List<Product>> product_map = {
    'Simple': [
      Product(
          url_image: "images/plan simple1.jpg", product_name: '', price: ''),
      Product(
          url_image: "images/plan simple2.jpg", product_name: '', price: ''),
      Product(url_image: "images/plan simple3.jpg", product_name: '', price: '')
    ],
    'Meduim': [
      Product(
          url_image: "images/plan medium 1.jpg", product_name: '', price: ''),
      Product(
          url_image: "images/plan medium 2.jpg", product_name: '', price: ''),
      Product(
          url_image: "images/plan medium 3.jpg", product_name: '', price: '')
    ],
    'Hard': [
      Product(url_image: "images/plan hard 1.jpg", product_name: '', price: ''),
      Product(url_image: "images/plan hard 2.jpg", product_name: '', price: ''),
      Product(url_image: "images/plan hard 3.jpg", product_name: '', price: '')
    ]
  };

  int current = 0;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          height: screenheight,
          width: screenwidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/edit shop back ground.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(top: 30),
                  iconSize: 23 * (screenheight / screenwidth),
                  icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                  color: red,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(" Training Plans Examples",
                  style: TextStyle(
                    color: white,
                    fontSize: 25,
                  )),
            ]),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(" Type of Training  ",
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                  )),
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: product_map
                            .length, // This list is defined at the beginning
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.all(5),
                                  width: 180,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: current == index ? red : white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      product_map.keys.toList()[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color:
                                              current == index ? white : black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                      width: screenwidth - 10,
                      height: 550,
                      margin: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount:
                            product_map['${product_map.keys.toList()[current]}']
                                    ?.length ??
                                0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      product_map['${product_map.keys.toList()[current]}']
                                                  ?[index]
                                              .url_image ??
                                          '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ])),
    )));
  }
}
