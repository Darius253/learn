import 'dart:async';

import 'package:flutter/material.dart';

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
      const Duration(milliseconds: 2000),
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
          child: SvgPicture.asset('assets/images/teaching.svg',
              width: 200, height: 150),
        ),
      ),
    );
  }
}
