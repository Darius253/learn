import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/widgets/uploaded_subjects.dart';
import 'package:learn/widgets/uploading_widget.dart';

import '../shared/exports.dart';
import '../widgets/upload_textfield.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() => Get.off(() => const UploadingWidget())),
          child: const Icon(CupertinoIcons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const UploadedSubject(
                  subjectname: 'Mathematics',
                );
              },
            ),
          ),
        ));
  }
}
