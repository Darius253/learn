import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn/widgets/images.dart';

import '../shared/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: SizedBox(
          height: 200,
          width: 150,
          child: Image.network(Images.image, width: 300, height: 200),
        ),
      ),
    );
  }
}
