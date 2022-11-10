import 'package:charity_donations/utils/myButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class OrgSignUp extends StatefulWidget {
  const OrgSignUp({Key? key}) : super(key: key);

  @override
  State<OrgSignUp> createState() => _OrgSignUpState();
}

class _OrgSignUpState extends State<OrgSignUp> {
  final _organisationnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // _backgroundImage(),
            const SizedBox(
              height: 50,
            ),
            const Image(
              image: AssetImage('assets/amal_bluegrey_logo1.png'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                'Create Account',
                style: GoogleFonts.bebasNeue(
                    fontSize: 45, color: Colors.blueGrey.shade400),
                // style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _inputOrgName(),
            _inputEmail(),
            _inputPassword(),
            _logInButton(context),
            ],
        ),
      ),
    );
  }

  _inputOrgName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: _organisationnameController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          hintText: 'Enter Organisation Name',
          prefixIcon: const Icon(
            Icons.work,
            color: Colors.blueGrey,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }

  _inputEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          hintText: 'Enter Email',
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.blueGrey,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }

  _inputPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.8))),
          hintText: 'Enter Password',
          prefixIcon: const Icon(
            Icons.lock_rounded,
            color: Colors.blueGrey,
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }

  _logInButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MyButton(
          label: 'Sign In',
          onTap: (() {
            
          }),
          height: 50,
          width: 400,
          color: Colors.blueGrey.withOpacity(0.8)),
    );
  }
}
