import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({Key? key}) : super(key: key);

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  String image = 'assets/images/learning.svg';
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
              horizontal: MediaQuery.of(context).size.width / 5),
          child: IgnorePointer(
            ignoring: true,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Column(
                  children: const [
                    Text(
                      'Journey to Excellence',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    DelayedDisplay(
                      fadingDuration: Duration(seconds: 1),
                      child: Text(
                        "Be educated enough to change the world",
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
