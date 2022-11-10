// ignore_for_file: unused_field, dead_code, unused_label
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.blueGrey,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blueGrey.shade400,
              tabBorderRadius: 50,
              curve: Curves.easeInExpo,
              iconSize: 25,
              haptic: true,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Donation',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome!'),
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
