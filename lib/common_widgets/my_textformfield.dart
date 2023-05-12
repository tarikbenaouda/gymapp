import 'package:flutter/services.dart';
import 'package:gymapp/consts/consts.dart';

Widget myTextformfield({
  String? hint,
  bool? obsecure,
  TextInputType? type,
  controller,
  Icon? icon,
  TextInputFormatter? filter,
  int? limit,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
    child: Container(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure ?? false,
        keyboardType: type,
        inputFormatters: [
          filter ?? FilteringTextInputFormatter.singleLineFormatter,
          LengthLimitingTextInputFormatter(limit),
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
