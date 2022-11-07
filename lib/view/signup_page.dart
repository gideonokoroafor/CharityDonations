import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/curve_clippers.dart';
import '../utils/mybuttons.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Sign up method
  Future signUp() async {
    try {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  // dispose of controllers when not in use
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backgroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Create Account',
              style: GoogleFonts.bebasNeue(
                  fontSize: 45, color: Colors.black.withOpacity(0.8)),
              // style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _inputEmail(),
          const SizedBox(
            height: 10,
          ),
          _inputPassword(),
          const SizedBox(
            height: 10,
          ),
          _confirmPassword(),
          const SizedBox(
            height: 10,
          ),
          _signUpButton(context),
          const SizedBox(
            height: 10,
          ),
          _returnToSignInPage(context)
        ],
      )),
    );
  }

  // text field for the users email

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

  _backgroundImage() {
    Size size = MediaQuery.of(context).size;
    const double appPadding = 20.0;
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: size.height * .53,
        width: size.width,
        color: Colors.blueGrey.withOpacity(0.8),
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appPadding / 2, vertical: appPadding * 3),
          child: Center(
            child: Image(
              image: AssetImage('assets/amal_white_logo1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // textfield for users password

  _inputPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueGrey)),
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

  _confirmPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: _confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          hintText: 'Confirm Password',
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

  _returnToSignInPage(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        'Already have an account? ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      GestureDetector(
        onTap: widget.showLoginPage,
        // () {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (BuildContext context) {
        //     return const LoginPage(
        //       showSignUpPage: SignUpPage(),
        //     );
        //   }));
        // },
        child: const Text(
          'Log in',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    ]);
  }

  _signUpButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MyButton(
          label: 'Sign Up',
          onTap: signUp,
          // () {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (BuildContext context) {
          //     return const SignInAuth();
          //   }));
          // },
          height: 50,
          width: 400,
          color: Colors.blueGrey.withOpacity(0.8)),
    );
  }

  // sign up as organization button
  _signUpAsOrgButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MyButton(
          label: 'Sign Up As Organization',
          onTap: signUp,
          // () {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (BuildContext context) {
          //     return const SignInAuth();
          //   }));
          // },
          height: 50,
          width: 400,
          color: Colors.blueGrey.withOpacity(0.8)),
    );
  }

}
