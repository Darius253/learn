import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/widgets/uploaded_subjects.dart';
import 'package:learn/widgets/uploading_widget.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late bool _show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            // setState(() {
            //   _show = !_show;

            // });
            addDataWidget(BuildContext, context);
          },
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
