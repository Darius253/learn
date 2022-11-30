import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController();
  int pageIndex = 0;

  List<Widget> screens = [
    const OnboardingOne(),
    const OnboardingTwo(),
    const OnboardingThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          pageSnapping: true,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          controller: _pageController,
          children: screens,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    pageIndex != 2
                        ? TextButton(
                            onPressed: () {
                              Get.to(() => const SignUP());
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: const SwapEffect(
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: Color.fromARGB(
                        204, 20, 72, 214)), // your preferred effect
              )),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: pageIndex != 2
                    ? () {
                        _pageController.animateToPage(pageIndex + 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      }
                    : () {
                        Get.off(() => const SignUP());
                      },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(234, 24, 8, 250),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
