// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CharityDonationsModel {
  final firestoreInstance = FirebaseFirestore.instance;
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
      String firstname, String lastName, String email, String address) async {
        await FirebaseFirestore.instance.collection('users').add({
          'first name': firstname,
          'last name': lastName,
          'email': email,
          'address': address,
          'userId': getCurrentUser(),
      });
  }

  // Add organizations details to the database and store their userID
  Future dbAddOrgDetails(
      String orgName, String email, String address) async {
        await FirebaseFirestore.instance.collection('organizations').add({
          'organization name': orgName,
          'email': email,
          'address': address,
          'userId': getCurrentUser(),
      });
  }

}
