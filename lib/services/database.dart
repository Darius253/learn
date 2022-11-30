import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class FirestoreService {
  // user uid
  final String? uid;

  FirestoreService({this.uid});

  // collection references
  static final CollectionReference subjectsCollection =
      FirebaseFirestore.instance.collection('subjects');

  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

// -------------------- Setting stuff -------------------------
// data for a new user
  Future setInitialUserData(
      {required String id,
      required String firstname,
      required String email,
      required String lastname,
      required String fullname}) async {
    return await usersCollection.doc(uid).set({
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'fullname': fullname,
    });
  }


// -------------------- Add methods -------------------------
Future<Person> personFuture() async {
    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return Person.fromDocument(document);
  }
  // add subject to subject collection
  Future addSubjects({@required Subject? subject}) async {
    await subjectsCollection.doc(subject!.subjectID).set(subject.toMap());
  }
}
