import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/controlllers/profile_controller.dart';

class SettingsUser extends StatelessWidget {
  final dynamic data;
  const SettingsUser({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/20.jpg"), fit: BoxFit.fill)),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 50,
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.settings,
                  size: 35,
                  color: Color(0xFFFF1E0F),
                )
              ],
            ),
            Obx(
              () => Column(children: [
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        icGoogleLogo,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                5.heightBox,
                Column(
                  children: [
                    TextButton(
                        onPressed: (() {
                          controller.changeImage(context);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF1E0F),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Change Picture",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.changeImage(context);
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )),
                  ],
                ),
                myTextformfield(
                  hint: "Full Name",
                  icon: const Icon(Icons.edit),
                  controller: controller.fullNameController,
                  type: TextInputType.name,
                ),
                myTextformfield(
                    hint: "weight    Kg ",
                    icon: const Icon(Icons.edit),
                    controller: controller.weightController,
                    limit: 3,
                    type: TextInputType.number,
                    filter: FilteringTextInputFormatter.digitsOnly),
                myTextformfield(
                    hint: "Height    cm ",
                    icon: const Icon(Icons.edit),
                    controller: controller.heightController,
                    limit: 3,
                    filter: FilteringTextInputFormatter.digitsOnly,
                    type: TextInputType.number),
                myTextformfield(
                    hint: "Age",
                    icon: const Icon(Icons.edit),
                    controller: controller.ageController,
                    limit: 2,
                    filter: FilteringTextInputFormatter.digitsOnly,
                    type: TextInputType.number),
                4.heightBox,
                myTextformfield(
                  hint: "Username",
                  icon: const Icon(Icons.edit),
                  controller: controller.usernameController,
                  type: TextInputType.name,
                ),
                4.heightBox,
                myTextformfield(
                    hint: "Phone Number",
                    icon: const Icon(Icons.edit),
                    controller: controller.phoneNumberController,
                    limit: 10,
                    filter: FilteringTextInputFormatter.digitsOnly),
                4.heightBox,
                myTextformfield(
                  hint: "old Password (required)",
                  icon: const Icon(Icons.edit),
                  controller: controller.oldPasswordController,
                  limit: 16,
                  obsecure: true,
                ),
                4.heightBox,
                myTextformfield(
                  hint: "New Password (optional)",
                  icon: const Icon(Icons.edit),
                  controller: controller.newPasswordController,
                  limit: 16,
                  obsecure: true,
                ),
                4.heightBox,
              ]),
            ),
            controller.isloading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(red),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: TextButton(
                        onPressed: () async {
                          controller.isloading(true);
                          //if image is not selected
                          if (controller.profileImgPath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }
                          //if old password matches database
                          //data['password']
                          if (data['password'] ==
                              controller.oldPasswordController.text) {
                            var password =
                                controller.newPasswordController.text;
                            if (controller.newPasswordController.text == "") {
                              password = controller.oldPasswordController.text;
                            }
                            controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldPasswordController.text,
                                newpassword: password);

                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              fullName: controller.fullNameController.text,
                              username: controller.usernameController.text,
                              age: controller.ageController.text,
                              height: controller.heightController.text,
                              weight: controller.weightController.text,
                              phoneNumber:
                                  controller.phoneNumberController.text,
                              password: password,
                            );

                            Get.snackbar(
                              "Updated !",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: white,
                            );
                          } else {
                            Get.snackbar(
                              "Wrong Password!",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: white,
                            );
                            controller.isloading(false);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 240,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF1E0F),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}
