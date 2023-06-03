import 'package:cloud_firestore/cloud_firestore.dart';
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
          'error': true,
          'message': "Athlete not found",
        };
      }
      Map<String, dynamic> data0 = userQr.docs.first.data();
      return {
        'error': false,
        'message': "Athlete has been found",
        'data': data0,
      };
    } catch (e) {
      return {
        'error': true,
        'message': "Athlete not found",
      };
    }
  }

  scanned({
    id,
  }) async {
    var user = await firestore.collection(usersCollection).doc(id).get();
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'scanned': !(user['scanned']),
      },
      SetOptions(merge: true),
    );
  }

  sessionCountdown({
    id,
  }) async {
    var user = await firestore.collection(usersCollection).doc(id).get();
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'offerSessions': user['offerSessions'] - 1,
      },
      SetOptions(merge: true),
    );
  }
}
