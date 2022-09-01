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
      backgroundColor: const Color.fromARGB(240, 12, 12, 12),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            ClipRRect(
              child: SvgPicture.asset(
                'assets/images/test.svg',
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            const Back(),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      left: 20,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: const [
                        DragHandle(),
                        SignupWidget(),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
