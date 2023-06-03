import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gymapp/consts/consts.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  //text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      currentUser = userCredential.user;
    } on FirebaseAuthException catch (e) {
      // VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup method

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      currentUser = userCredential.user;
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method

  storeUserData({
    fullName,
    username,
    phoneNumber,
    age,
    weight,
    height,
    email,
    password,
  }) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'fullName': fullName,
      'username': username,
      'phoneNumber': phoneNumber,
      'age': age,
      'weight': weight,
      'height': height,
      'email': email,
      'password': password,
      'imageUrl': '',
      'id': currentUser!.uid,
      'type': 'user',
      'coaching': false,
      'training': false,
      'offerId': '0',
      'offerDays': '0',
      'offerName': '0',
      'offerSessions': 0,
      'offerPrice': '0',
      'code': UniqueKey().hashCode.toString(),
    });
  }

  //signout
  Future<void> signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
