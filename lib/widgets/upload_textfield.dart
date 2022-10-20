import 'package:flutter/material.dart';

Widget textfield(TextEditingController controller, String? hintText, int maxLines, ) {
  return TextFormField(
    controller: controller,
    maxLines: maxLines,
    keyboardType: TextInputType.multiline,
    style: const TextStyle(
      fontSize: 20,
      fontFamily: 'Poppins',
    ),
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

 