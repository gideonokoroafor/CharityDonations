// ignore_for_file: unused_field

import 'package:charity_donations/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Loading()
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome!'),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        _isLoading = false;
                      });
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
