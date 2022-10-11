import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class FirestoreService {
  // user uid
  final String uid;

  FirestoreService({required this.uid});

  // collection references
  static final CollectionReference subjectsCollection =
      FirebaseFirestore.instance.collection('subjects');
  static final CollectionReference classCollection =
      FirebaseFirestore.instance.collection('class');

  static final CollectionReference schoolCOllection =
      FirebaseFirestore.instance.collection('school');

  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

// -------------------- Setting stuff -------------------------
// data for a new user
  Future setInitialUserData({
    required String id,
    required String firstname,
    required String email,
    required String lastname,
  }) async {
    return await usersCollection.doc(uid).set({
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    });
  }

// -------------------- Fetch methods -------------------------
  // get and make a Person object for a user
  Future<Person> personFuture() async {
    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return Person.fromDocument(document);
  }

  // get user doc stream
  Stream<Person> get userData {
    return usersCollection.doc(uid).snapshots().map((snapshot) {
      return Person.fromDocument(snapshot);
    });
  }

// -------------------- Add methods -------------------------

  // add subject to subject collection
  Future addSubjects({@required Subject? subject}) async {
    await subjectsCollection.doc(subject!.subjectID).set(subject.toMap());
  }
}
