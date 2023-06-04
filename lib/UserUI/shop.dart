import 'package:flutter/material.dart';
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

class shop extends StatefulWidget {
  @override
  State<shop> createState() => shop_State();
}

class shop_State extends State<shop> {
  Map<String, List<Product>> product_map = {
    'Protein': [
      Product(
          url_image: "images/shop1.png",
          product_name: 'P 10',
          price: '1000.99 DA'),
      Product(
          url_image: "images/shop2.png",
          product_name: 'Vitamin 1',
          price: '2000.99 DA')
    ],
    'Alaa': [
      Product(
          url_image: "images/shop1.png",
          product_name: 'P 10',
          price: '1000.99 DA'),
      Product(
          url_image: "images/shop2.png",
          product_name: 'Vitamin 1',
          price: '2000.99 DA')
    ],
    'WHEY': [
      Product(
          url_image: "images/shop3.png",
          product_name: 'B 3',
          price: '1500.99 DA'),
      Product(
          url_image: "images/shop4.png",
          product_name: 'B 12',
          price: '2500.99 DA'),
      Product(
          url_image: "images/shop5.png",
          product_name: 'Protein A',
          price: '3000.00 DA'),
      Product(
          url_image: "images/shop5.png",
          product_name: 'Protein A',
          price: '3000.00 DA')
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(top: 10),
                  iconSize: 50,
                  icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                  color: red,
                  onPressed: () {},
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Shop",
                  style: TextStyle(
                    color: white,
                    fontSize: 25,
                  )),
              Icon(Icons.shopping_cart_sharp,
                  color: red, size: 20 * (screenheight / screenwidth))
            ]),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
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
                                  width: 100,
                                  height: 35,
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
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("images/20.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: red, width: 1),
                      ),
                      width: screenwidth - 10,
                      height: screenheight -
                          statusBarBottom -
                          statusBarHeight -
                          300,
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
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: white,
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
                                      width: screenwidth * 0.1,
                                      height: screenheight * 0.1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    color: black,
                                    width: screenwidth,
                                    height: 2,
                                  ),
                                  Center(
                                    child: Text(
                                      "${product_map['${product_map.keys.toList()[current]}']?[index].product_name ?? ''}",
                                      style: TextStyle(
                                          fontSize:
                                              10 * (screenheight / screenwidth),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "${product_map['${product_map.keys.toList()[current]}']?[index].price ?? ''}",
                                      style: TextStyle(
                                          fontSize:
                                              10 * (screenheight / screenwidth),
                                          fontWeight: FontWeight.w800),
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
