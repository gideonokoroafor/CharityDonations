// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CharityDonationsModel {
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late final _uid;
  final auth = FirebaseAuth.instance;
  late User currentUser;
  late firebase_storage.Reference ref;
  late CollectionReference imgRef;
  var uuid = const Uuid();

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
    await FirebaseFirestore.instance
        .collection('organizations')
        .doc(docId)
        .set({
      'orgName': orgName,
      'email': email,
      'userId': getCurrentUser(),
    });
  }

  Future dbDonationDetails(
      String fullname,
      String itemName,
      String docId,
      String category,
      String itemDescription,
      List<String> url,
      String uuid) async {
    await FirebaseFirestore.instance.collection('donations').doc(uuid).set({
      'fullname': fullname,
      'itemName': itemName,
      'category': category,
      'description': itemDescription,
      'url': url,
      'userId': docId,
      'datePublished': DateTime.now()
    });
  }

  // Future dbAddUserProfile(
  //   String pic, String phoneNumber, String aboutMe, String gender, String proffession) async {
  //     await FirebaseFirestore.instance.collection('users').add('data':pic,);
  //   }

}
