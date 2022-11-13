import 'package:charity_donations/users_view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/myButtons.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({super.key});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thank you for signing up!',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 45, color: Colors.black.withOpacity(0.8)),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Let's build your profile",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 25, color: Colors.blueGrey.shade400),
                  textAlign: TextAlign.left,
                ),
                _continueButton(context)
            ]),
          ),
        ),
      ),
    );
  }

  _continueButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: MyButton(
            label: 'Continue',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const HomePage();
              }));
            },
            height: 50,
            width: 200,
            color: Colors.blueGrey.withOpacity(0.8)),
      ),
    );
  }

}