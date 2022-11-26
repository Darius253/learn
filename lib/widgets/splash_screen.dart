import 'dart:async';
import 'package:flutter/material.dart';

import '../shared/constants.dart';
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
      const Duration(seconds: 5),
      () =>{},
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
              colors: [
            const Color.fromARGB(255, 80, 77, 250).withOpacity(0.9),
            // whiteColor,
            const Color.fromARGB(255, 5, 5, 5).withOpacity(0.4)
          ])),
      child: Padding(
        padding:  EdgeInsets.only(top: height *0.45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 2000),
                slidingCurve: Curves.bounceInOut,
                child: Text(
                  "LEARN",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32.0,
                    fontFamily: Fonts.poppins,
                    height: 39.2 / 32.0,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
               Text(
                "Based on GES Curriculum",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  fontFamily: Fonts.poppins,
                  height: 11.53 / 10.0,
                  color: Color(0xFF010033),
                ),
              ),
            
          ],
        ),
      ),
    ));
  }
}
