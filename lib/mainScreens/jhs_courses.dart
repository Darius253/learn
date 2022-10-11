import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class JHSCourses extends StatefulWidget {
  const JHSCourses({Key? key}) : super(key: key);

  @override
  State<JHSCourses> createState() => _JHSCoursesState();
}

class _JHSCoursesState extends State<JHSCourses> {
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
        body: Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (BuildContext context, int index) {
                return SubjectCard(
                  name: 'Mathematics',
                  image: 'Darius',
                  onTap: () => Get.to(() => const SubjectDetails()),
                );
              },
            )));
  }
}
