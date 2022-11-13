import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/services/database.dart';
import '../shared/exports.dart';

class JHSCourses extends StatefulWidget {
  final String formname;
  const JHSCourses({Key? key, required this.formname}) : super(key: key);

  @override
  State<JHSCourses> createState() => _JHSCoursesState();
}

class _JHSCoursesState extends State<JHSCourses> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'JHS Subjects',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () => Get.back(),
          )),
      body: FutureBuilder(
        future: FirestoreService.subjectsCollection
            .where('form', isEqualTo: widget.formname)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
            children: snapshot.data!.docs.map((document) {
              return SubjectCard(
                  name: document['name'],
                  image: document['image'],
                  onTap: ((() => Get.to(() => SubjectDetails(
                        formname: '${widget.formname}  ' '${document['name']}',
                        about: document['about'],
                        name: document['id'],
                        image: document['image'],
                      )))));
            }).toList(),
          );
        },
      ),
    );
  }

  Future<List<Subject>> getsubjects() async {
    CollectionReference ref = FirestoreService.subjectsCollection;
    QuerySnapshot eventsQuery =
        await ref.where('form', isEqualTo: widget.formname).get();

    HashMap<String, Subject> eventsHashMap = HashMap<String, Subject>();

    for (var document in eventsQuery.docs) {
      eventsHashMap.putIfAbsent(
          document['id'],
          () => Subject(
              name: document['name'],
              form: document['form'],
              school: document['school'],
              file: document['file'],
              about: document['about']));
    }

    return eventsHashMap.values.toList();
  }
}
