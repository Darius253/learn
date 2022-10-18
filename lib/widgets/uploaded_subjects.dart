import 'package:flutter/material.dart';

class UploadedSubject extends StatelessWidget {
  final String subjectname;
  const UploadedSubject({super.key, required this.subjectname});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: const Color.fromARGB(255, 77, 75, 75),
      child: ListTile(
        title: Text(subjectname),
        trailing: Container(
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          child: const Text('Uploaded',
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.green)),
        ),
      ),
    );
  }
}
