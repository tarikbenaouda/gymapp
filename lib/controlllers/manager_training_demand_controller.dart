import 'package:gymapp/consts/consts.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ManagerTrainingDemandController extends GetxController {
  acceptAthlete({
    training,
    type,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'type': type,
        'training': training,
      },
      SetOptions(merge: true),
    );
  }

  refuseAthlete({
    training,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'training': training,
      },
      SetOptions(merge: true),
    );
  }
}