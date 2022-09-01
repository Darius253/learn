import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 31, 196),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
