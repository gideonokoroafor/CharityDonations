// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class CharityDonationsModel {
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late final _uid;
  final auth = FirebaseAuth.instance;
  late User currentUser;
  late firebase_storage.Reference ref;
  late CollectionReference imgRef;
  getCurrentUser() {
    currentUser = auth.currentUser!;
    if (auth.currentUser != null) {
      // User is signed in
      _uid = FirebaseAuth.instance.currentUser!.uid.toString();
    }
    return _uid;
  }

  // Add user details to the database and store their userID
  Future dbAddUserDetails(
      String firstname, String lastName, String email, String docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).set({
      'firstname': firstname,
      'lastname': lastName,
      'email': email,
      'userId': getCurrentUser(),
    });
  }

  // Add organizations details to the database and store their userID
  Future dbAddOrgDetails(String orgName, String email, String docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).set({
      'orgName': orgName,
      'email': email,
      'userId': getCurrentUser(),
    });
  }

  Future dbUploadImgWithDetails(
    File img,
    String docId,
    String category,
    String fullName,
    String itemName,
    String itemDescription,
  ) async {
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$category/${Path.basename(img.path)}')
        .child('$category/${Path.basename(img.path)}');
    await ref.putFile(img).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        FirebaseFirestore.instance.collection(category).doc(DateTime.now().toString()).set({
          'fullname': fullName,
          'itemName': itemName,
          'category': category,
          'description': itemDescription,
          'url': value,
          'userId': docId
        });
      });
    });
  }
}
