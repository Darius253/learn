import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/database.dart';
import '../shared/exports.dart';

class SHSCourses extends StatefulWidget {
  final String formname;
  const SHSCourses({Key? key, required this.formname}) : super(key: key);

  @override
  State<SHSCourses> createState() => _SHSCoursesState();
}

class _SHSCoursesState extends State<SHSCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              'SHS Subjects',
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
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No Subjects'),
                );
              }

              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0),
                children: snapshot.data!.docs.map((document) {
                  return SubjectCard(
                      name: document['name'],
                      image: document['image'],
                      onTap: ((() => Get.to(() => SubjectDetails(
                            formname:
                                '${widget.formname}  ' '${document['name']}',
                            about: document['about'],
                            name:document['id'],
                            image: document['image'],
                          )))));
                }).toList(),
              );
            }));
  }
}
