import 'package:flutter/services.dart';
import 'package:gymapp/consts/consts.dart';

Widget myTextformfield(
    {String? hint,
    bool? obsecure,
    TextInputType? type,
    controller,
    Icon? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
    child: Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure ?? false,
        keyboardType: type,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF7A7A7A),
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget MyInfos(
    {String? Textinput, String? Textinput2, controller, Icon? icon}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        alignment: Alignment.centerLeft,
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFE6E6E6), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " $Textinput:",
              style: TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            // variable of email
            Text(
              "$Textinput2 ",
              style: TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ],
        )),
  );
}
