// ignore_for_file: unused_field, dead_code, unused_label
import 'package:charity_donations/utils/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser!;
  String _firstname = "";
  String _lastname = "";
  String _fullname = "";
  String _email = "";
  String _uid = "";
  // final DocumentSnapshot dbReference = FirebaseFirestore.instance.collection('users');

  void getData() async {
    _uid = user!.uid;
    final DocumentSnapshot dbReference =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
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

  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  // Future<void> getUsers() async {
  //   DocumentSnapshot data = await retrieveData();
  //   print(data.data().toString());
  // }

  // Future<DocumentSnapshot> retrieveData() async {
  //   return dbReference.doc(user!.uid).get();
  // }

  // var currUser = FirebaseFirestore.instance.collection("users").doc(user!.uid);

  // void getData() async {
  //   var currUser = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get();
  //   setState(() {
  //     print('Hereeee');
  //     firstname = currUser['firstname'];
  //     lastname = currUser['lastname'].toString();
  //     email = currUser['email'].toString();
  //     print(firstname);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome! $_fullname'),
            Text('Welcome! $_email'),
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
      // body: Center(
      //     child: StreamBuilder<QuerySnapshot>(
      //   stream: _usersStream,
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) return const Text('Something went wrong');
      //     // if (snapshot.connectionState == ConnectionState.waiting) {
      //     //   print('Hereeee');
      //     //   return const Loading();
      //     // }
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       // Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
      //       // return Text("Full Name: ${data['firstname']} ${data['lastname']}");
      //       return Text(getUsers() as String);
      //     }
      //     // return ListView(
      //     //   children: snapshot.data!.docs.map((DocumentSnapshot doc) {
      //     //     Map<String, dynamic> data =
      //     //         doc.data! as Map<String, dynamic>;
      //     //     return ListTile(
      //     //       title: Text(data['firstname']),
      //     //       subtitle: Text(data['lastname']),
      //     //     );
      //     //   }).toList().cast(),
      //     // );
      //     // else if (snapshot.connectionState == ConnectionState.done) {
      //     //   Map<String, dynamic> data =
      //     //       snapshot.data!.data() as Map<String, dynamic>;
      //     //   return Text(
      //     //       "Full Name: ${data['fullname']} ${data['lastname']}");
      //     // }
      //     else {
      //       return const Loading();
      //     }
      //   },
      // )),
    );
  }
}

// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Welcome $firstname'),
//             MaterialButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//               },
//               color: Colors.blueGrey,
//               child: const Text('Sign Out'),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 print('Hereeee');
//                 print(user!.displayName);
//                 print(user!.uid);
//               },
//               color: Colors.blueGrey,
//               child: const Text('Click me'),
//             )
//           ],
//         ),
