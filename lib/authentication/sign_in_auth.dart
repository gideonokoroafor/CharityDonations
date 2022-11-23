import 'package:charity_donations/authentication/auth_page.dart';
import 'package:charity_donations/users_view/build_profile.dart';
import 'package:charity_donations/users_view/home_page.dart';
import 'package:charity_donations/utils/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInAuth extends StatelessWidget {
  const SignInAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return const HomePage();
            return const LandingPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
