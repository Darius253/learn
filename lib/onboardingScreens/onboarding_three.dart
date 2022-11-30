import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class OnboardingThree extends StatefulWidget {
  const OnboardingThree({Key? key}) : super(key: key);

  @override
  State<OnboardingThree> createState() => _OnboardingThreeState();
}

class _OnboardingThreeState extends State<OnboardingThree> {
  String image = 'assets/images/education.svg';
  PageController controller = PageController();
  int activeImage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.9,
            child: SvgPicture.asset(image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6),
          child: IgnorePointer(
            ignoring: true,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Column(
                  children: const [
                    Text(
                      'Get Involved Everywhere',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    DelayedDisplay(
                      fadingDuration: Duration(seconds: 1),
                      child: Text(
                        "Learn at your pace and at your own comfort",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
