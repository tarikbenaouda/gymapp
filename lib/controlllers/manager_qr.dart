import 'package:gymapp/consts/consts.dart';

class Manager_Qr extends GetxController {
  Future<Map<String, dynamic>> verifyPayment(String code) async {
    try {
      var userQr = await firestore
          .collection(usersCollection)
          .where('code', isEqualTo: code)
          .get();

      if (userQr.docs.isEmpty) {
        return {
          "error": true,
          "message": "Athlete not found",
        };
      }
      //Map<String, dynamic> data = userQr.docs.first.data();
      return {
        "error": false,
        "message": "Athlete has been found",
        "data": null,
      };
    } catch (e) {
      return {
        "error": true,
        "message": "Athlete not found",
      };
    }
  }
}
