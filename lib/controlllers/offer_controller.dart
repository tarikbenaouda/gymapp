import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/firebase_consts.dart';

class OfferController extends GetxController {
  storeOfferData({
    days,
    type,
    price,
    sessions,
  }) async {
    DocumentReference store = firestore.collection(offersCollection).doc();
    store.set({
      'days': days,
      'type': type,
      'price': price,
      'sessions': sessions,
    });
  }

  editOfferData({
    days,
    type,
    price,
    sessions,
    id,
  }) async {
    DocumentReference store = firestore.collection(offersCollection).doc(id);
    store.set({
      'days': days,
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
