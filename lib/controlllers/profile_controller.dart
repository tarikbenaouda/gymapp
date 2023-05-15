import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isloading = false.obs;

  //textfield
  var usernameController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var ageController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var passwordController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile(
      {fullName,
      username,
      phoneNumber,
      age,
      height,
      weight,
      password,
      imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set(
      {
        'fullName': fullName,
        'username': username,
        'phoneNumber': phoneNumber,
        'age': age,
        'height': height,
        'weight': weight,
        'password': password,
        'imageUrl': imgUrl,
      },
      SetOptions(merge: true),
    );
    isloading(false);
  }
}