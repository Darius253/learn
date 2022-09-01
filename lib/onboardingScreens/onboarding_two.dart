import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class OnboardingTwo extends StatefulWidget {
  const OnboardingTwo({Key? key}) : super(key: key);

  @override
  State<OnboardingTwo> createState() => _OnboardingTwoState();
}

class _OnboardingTwoState extends State<OnboardingTwo> {
  String image = 'assets/images/educator.svg';
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
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.5,
            child: SvgPicture.asset(image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4),
          child: IgnorePointer(
            ignoring: true,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Column(
                  children: const [
                    Text(
                      'Learn Everywhere',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          height: 1.5,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                    DelayedDisplay(
                      fadingDuration: Duration(seconds: 1),
                      child: Text(
                        "Your growth is in your hands",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
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
