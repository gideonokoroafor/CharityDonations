// ignore_for_file: unused_import, library_prefixes

import 'package:charity_donations/model/charity_donations_model.dart';
import 'package:charity_donations/users_view/home_page.dart';
import 'package:charity_donations/utils/my_drop_down_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:charity_donations/utils/constants.dart' as Constants;

import '../utils/myButtons.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({super.key});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  // final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _numberController = TextEditingController();
  final _pronounsController = TextEditingController();

  List<String> gender = ['Male', 'Female', 'Other'];

  final firestoreInstance = FirebaseFirestore.instance;
  CharityDonationsModel model = CharityDonationsModel();

  // void pickUploadImage() async {
  //   final img = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 512,
  //     maxHeight: 512,
  //     imageQuality: 75,
  //   );
  //   Reference ref = FirebaseStorage.instance.ref().child('assets/amal_bluegrey_logo1.png');
  // }

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
                const SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Thank you for signing up!',
                //   style: GoogleFonts.bebasNeue(
                //       fontSize: 45, color: Colors.black.withOpacity(0.8)),
                //   textAlign: TextAlign.left,
                // ),
                // Text(
                //   "Let's build your profile",
                //   style: GoogleFonts.bebasNeue(
                //       fontSize: 25, color: Colors.blueGrey.shade400),
                //   textAlign: TextAlign.left,
                // ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //       'Thank you for signing up!',
                      //       style: GoogleFonts.bebasNeue(
                      //           fontSize: 45, color: Colors.black.withOpacity(0.8)),
                      //       textAlign: TextAlign.left,
                      // ),
                      // Text(
                      //       "Let's build your profile",
                      //       style: GoogleFonts.bebasNeue(
                      //           fontSize: 25, color: Colors.blueGrey.shade400),
                      //       textAlign: TextAlign.left,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      _imageProfile(),
                      const SizedBox(
                        height: 10,
                      ),
                      _inputPhoneNumber(),
                      const SizedBox(
                        height: 10,
                      ),
                      _inputGender(),
                      const SizedBox(
                        height: 10,
                      ),
                      _inputPronouns(),
                      const SizedBox(
                        height: 10,
                      ),
                      _inputDescription(),
                      const SizedBox(
                        height: 10,
                      ),
                      _continueButton(context)
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _imageProfile() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 84,
          backgroundColor: Colors.blueGrey,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/amal_logo1.png'),
            backgroundColor: Colors.white,
            // foregroundColor: ,
          ),
        ),
        _changeProfilePicture()
      ],
    );
  }

  _continueButton(context) {
    return Center(
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
    );
  }

  // _inputUsername() {
  //   return TextField(
  //       controller: _addressController,
  //       decoration: textDecoration('Enter address'));
  // }

  _inputPhoneNumber() {
    return TextField(
        controller: _numberController,
        decoration: textDecoration('Enter mobile number: (444)444-4444'));
  }

  _inputDescription() {
    return TextField(
        controller: _descriptionController,
        maxLines: 4,
        decoration: textDecoration('Tell us about yourself'));
  }

  _inputPronouns() {
    return TextField(
        controller: _pronounsController,
        decoration: textDecoration('Enter your Pronouns (he/him)'));
  }

  _inputGender() {
    return MyDropDownMenu(
      items: Constants.gender,
      buttonHeight: 56,
      buttonWidth: 450,
      dropDownHeight: 200,
      dropDownWidth: 200,
      dropdownDirection: DropdownDirection.left,
      label: 'Select your Gender',
    );
  }

  _changeProfilePicture() {
    return Center(
      child: TextButton(
        child: const Text(
          'Change profile picture',
        ),
        onPressed: () {},
      ),
    );
  }

  InputDecoration textDecoration(String hint) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueGrey)),
      hintText: hint,
      fillColor: Colors.grey[200],
      filled: true,
    );
  }
}
