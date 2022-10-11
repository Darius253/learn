import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final String word;
  final VoidCallback onTap;
  final VoidCallback onPressed;
  const Button(
      {Key? key,
      required this.text,
      required this.word,
      required this.onTap,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 67, 64, 255),
                borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.15,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(239, 255, 251, 251)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            word,
            style: const TextStyle(
                decoration: TextDecoration.underline, fontSize: 15),
          ),
        )
      ],
    );
  }
}
