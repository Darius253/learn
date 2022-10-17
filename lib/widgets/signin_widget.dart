import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/authenticate/admin_login.dart';
import 'package:learn/authenticate/wrapper.dart';
import 'package:learn/services/authservice.dart';
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
  AuthService authService = AuthService();

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
            validator: (value) => value!.isEmail ? '' : 'Incorrect Email',
            onChanged: (value) {
              setState(() => email = value);
            },
            onSaved: (value) {
              setState(() => password = value!);
            },
            decoration: const InputDecoration(
                hintText: 'berince@gmail.com',
                suffixIcon: Icon(Icons.mail),
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Password Field
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              validator: (value) => value!.length < 5
                  ? 'Password should be more than 5 characters'
                  : '',
              onChanged: (value) {
                setState(() => password = value);
              },
              onSaved: (value) {
                setState(() => password = value!);
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
                    fontWeight: FontWeight.w200,
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
            onPressed: () async {
              Get.snackbar('Please Wait', 'Signing In...',
                  showProgressIndicator: true,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 5));
              Wrapper.instance.validateAndSignIn(email, password);
              print(password);
              print(email);
            },
            text: 'Sign In',
            word: "Don't have an account yet? Sign Up",
            onTap: () => Get.offAll(() => const SignUP()),
          ),
          const SizedBox(
            height: 20,
          ),
          admin(),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      onTap: () => Get.to(() => const ForgotPassword()),
      child: const Text(
        'Forgotten Password?',
        style: TextStyle(color: Color.fromARGB(255, 67, 64, 255), fontSize: 15),
      ),
    );
  }

  Widget admin() {
    return GestureDetector(
      onTap: () => Get.to(() => const AdminLogin()),
      child: const Text(
        'Sign In as An Admin',
        style: TextStyle(
            color: Color.fromARGB(255, 12, 11, 12),
            decoration: TextDecoration.underline,
            fontSize: 15),
      ),
    );
  }
}
