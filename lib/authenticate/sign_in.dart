import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String image = 'assets/images/sigin.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 150, 144, 144),
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SvgPicture.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const DelayedDisplay(
              fadingDuration: Duration(seconds: 2),
              slidingCurve: Curves.ease,
              child: Text(
                'Hello Again',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // ignore: prefer_const_constructors
            const DelayedDisplay(
              child: Text("Welcome back you've been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  )),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: const SigninWidget(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    ));
  }
}
