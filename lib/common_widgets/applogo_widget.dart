import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/consts/images.dart';

Widget applogoWidget() {
  //using velocity_xnhere
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
