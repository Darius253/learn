import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String image = 'assets/images/forgotpassword.svg';
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 150, 144, 144),
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const DelayedDisplay(
                fadingDuration: Duration(seconds: 2),
                slidingCurve: Curves.ease,
                child: Text(
                  'Enter your registered email below\n to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SvgPicture.asset(
                image,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmail ? '' : 'Please provide your email address',
                onChanged: (value) {
                  setState(() => email = value);
                },
                decoration: const InputDecoration(
                  hintText: 'darius@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () => Get.off(() => const SignIn()),
                  child: const Text('Remember Password? SignIn ')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 67, 64, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Send',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 243, 239, 239)),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
