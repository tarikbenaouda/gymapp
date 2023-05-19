import 'package:flutter/services.dart';
import 'package:gymapp/consts/consts.dart';

class Signup2 extends StatefulWidget {
  const Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  var fullNameController = Get.arguments[0];
  var usernameController = Get.arguments[1];
  var phoneNumberController = Get.arguments[2];

  var ageController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        height: screenlength,
        width: screenwidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/6.jpg"), fit: BoxFit.fill)),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Color(0xFFFF1E0F),
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            myTextformfield(
              hint: "Your Age",
              type: TextInputType.number,
              controller: ageController,
              filter: FilteringTextInputFormatter.digitsOnly,
              limit: 2,
            ),
            myTextformfield(
              hint: "Your Weight (Kg)",
              type: TextInputType.number,
              controller: weightController,
              filter: FilteringTextInputFormatter.digitsOnly,
              limit: 3,
            ),
            myTextformfield(
              hint: "Your Height (Cm)",
              type: TextInputType.number,
              controller: heightController,
              filter: FilteringTextInputFormatter.digitsOnly,
              limit: 3,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: const Color(0xFFFF1E0F)),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFFF1E0F)),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: (ageController.text != "" &&
                                weightController.text != "" &&
                                heightController.text != "")
                            ? const Color(0xFFFF1E0F)
                            : const Color.fromARGB(255, 255, 184, 179),
                        border: Border.all(
                            width: 1, color: const Color(0xFFFF1E0F)),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        (ageController.text != "" &&
                                weightController.text != "" &&
                                heightController.text != "")
                            ? Get.to(() => const Signup3(), arguments: [
                                fullNameController,
                                usernameController,
                                phoneNumberController,
                                ageController,
                                weightController,
                                heightController,
                              ])
                            : Get.snackbar(
                                "Oops..!",
                                "Please fill all the fields.",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: white,
                              );
                      },
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
