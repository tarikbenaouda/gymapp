import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/consts.dart';

import '../consts/firebase_consts.dart';

class OfferController extends GetxController {
  storeOfferData({
    months,
    type,
    price,
    sessions,
  }) async {
    DocumentReference store = firestore.collection(offersCollection).doc();
    store.set({
      'months': months,
      'type': type,
      'price': price,
      'sessions': sessions,
    });
  }

  editOfferData({
    months,
    type,
    price,
    sessions,
    id,
  }) async {
    DocumentReference store = firestore.collection(offersCollection).doc(id);
    store.set({
      'months': months,
      'type': type,
      'price': price,
      'sessions': sessions,
    });
  }

  void deleteDocument(String documentId) {
    FirebaseFirestore.instance
        .collection(offersCollection)
        .doc(documentId)
        .delete()
        .then((value) {})
        .catchError((error) {});
  }
}
