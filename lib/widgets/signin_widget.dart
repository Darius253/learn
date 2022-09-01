import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Email Field
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
                hintText: 'berince@gmail.com',
                suffixIcon: Icon(Icons.mail),
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Password Field
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              validator: (value) => value!.length < 6
                  ? 'Password should be more than 7 characters'
                  : '',
              onChanged: (value) {
                setState(() => password = value);
              },
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: (password.isNotEmpty)
                      ? GestureDetector(
                          onTap: () {
                            setState(() => obscurePassword = !obscurePassword);
                          },
                          child: Icon(
                            obscurePassword
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: const Color.fromARGB(255, 33, 54, 243),
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 12.0),
                              child: Icon(
                                CupertinoIcons.lock,
                              ),
                            ),
                          ],
                        ),
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))),

          const SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 2.5),
            child: forgotPassword(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          Button(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState?.save();
                loading();
              }
              // Navigator.of(context).pop();
            },
            text: 'Sign In',
            word: "Don't have an account yet? Sign Up",
            onTap: () => Get.off(() => const SignUP()),
          )
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      onTap: () => Get.to((const ForgotPassword())),
      child: const Text(
        'Forgotten Password?',
        style: TextStyle(color: Color.fromARGB(255, 67, 64, 255), fontSize: 15),
      ),
    );
  }

  Future<void> loading() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Please Wait...'),
          content: SizedBox(
              width: 150,
              height: 100,
              child: Center(child: CircularProgressIndicator.adaptive())),
        );
      },
    );
  }
}
