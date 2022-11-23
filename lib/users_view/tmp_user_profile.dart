import 'package:flutter/material.dart';

class TmpUserProfile extends StatefulWidget {
  const TmpUserProfile({super.key});

  @override
  State<TmpUserProfile> createState() => _TmpUserProfileState();
}

class _TmpUserProfileState extends State<TmpUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const Center(
          child: Text(
        'User Profile Page',
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}