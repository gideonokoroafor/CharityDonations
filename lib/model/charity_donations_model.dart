// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class CharityDonationsModel {
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late final _uid;
  final auth = FirebaseAuth.instance;
  late User currentUser;
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

  // Future<String> getFullname() async {
  //   return users.get().then((DataSnapshot snapshot) {
  //     final String fullName = snapshot.v
  //   })
  // }
}
