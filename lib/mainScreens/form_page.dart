import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/exports.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              'Senior High',
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
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0),
              itemBuilder: (BuildContext context, int index) {
                return SubjectCard(
                  name: 'JHS 1',
                  image: 'Darius',
                  onTap: () => Get.to(() => const SubjectDetails()),
                );
              },
            )));
  }
}
