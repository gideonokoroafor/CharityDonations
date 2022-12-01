import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/loading.dart';
import '../../utils/post_card.dart';

class Clothings extends StatefulWidget {
  const Clothings({super.key});

  @override
  State<Clothings> createState() => _ClothingsState();
}

class _ClothingsState extends State<Clothings> {

  User? user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
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
          title: const Text('Clothing'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('donations')
              .where('category', isEqualTo: 'CLOTHING')
              .where('userId', isNotEqualTo: user!.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Loading(),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text('This category is empty'),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => PostCard(
                      snap: snapshot.data!.docs[index].data(),
                    ));
          },
        ));
  }
}