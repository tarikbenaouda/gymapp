import 'package:gymapp/consts/consts.dart';

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
