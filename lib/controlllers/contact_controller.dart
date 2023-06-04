import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/firebase_consts.dart';

class ContactController extends GetxController {
  updateContact({
    email,
    phoneNumber,
    facebook,
  }) async {
    var store = firestore.collection('contact').doc('FV9hIQsIH28cHKLII8qh');
    await store.set(
      {
        'email': email,
        'phoneNumber': phoneNumber,
        'facebook': facebook,
      },
      SetOptions(merge: true),
    );
  }
}
