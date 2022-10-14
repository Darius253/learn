import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/authservice.dart';
import '../services/database.dart';
import '../shared/exports.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  static final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const Welcome();
          }
        }
        return FutureBuilder<void>(
          future: getUserFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const HomePage();
            }
            return Container();
          },
        );
      },
    );
  }

  Future<void> getUserFromFirestore() async {
    String userId = authService.getCurrentUserID ?? '';
    DocumentSnapshot docSnap =
        await FirestoreService.usersCollection.doc(userId).get();
  }
}
