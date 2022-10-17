import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';
import '../widgets/admin_login_widget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String image = 'assets/images/educator.svg';
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
                'Hello Admin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins'),
              ),
            ),
            // ignore: prefer_const_constructors
            const DelayedDisplay(
              child: Text("Sign in to upload contents",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, height: 1.5, fontFamily: 'Poppins')),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: const AdminLoginWidget(),
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
