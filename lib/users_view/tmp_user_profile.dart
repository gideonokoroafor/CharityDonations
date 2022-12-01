import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TmpUserProfile extends StatefulWidget {
  const TmpUserProfile({super.key});

  @override
  State<TmpUserProfile> createState() => _TmpUserProfileState();
}

class _TmpUserProfileState extends State<TmpUserProfile> {
  User? user = FirebaseAuth.instance.currentUser!;
  String _firstname = "";
  String _lastname = "";
  String _fullname = "";
  String _email = "";
  String _uid = "";

  void getData() async {
    _uid = user!.uid;
    final DocumentSnapshot dbReference =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    // if (mounted) {
    setState(() {
      _firstname = dbReference.get('firstname');
      _lastname = dbReference.get('lastname');
      _fullname = "$_firstname $_lastname";
      _email = dbReference.get('email');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome! $_fullname'),
            Text(_email),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.blueGrey,
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}