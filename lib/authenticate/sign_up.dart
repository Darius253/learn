import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';
import 'package:learn/widgets/signup_widget.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SvgPicture.asset(
              'assets/images/test.svg',
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  const Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  ),
                  const SignupWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
