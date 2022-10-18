import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class AdminLoginWidget extends StatefulWidget {
  const AdminLoginWidget({Key? key}) : super(key: key);

  @override
  State<AdminLoginWidget> createState() => _AdminLoginWidgetState();
}

class _AdminLoginWidgetState extends State<AdminLoginWidget> {
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
                hintText: 'darius@gmail.com',
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
              Get.to(() => const AdminHome());
            },
            text: 'Sign In',
            word: "Not an Admin? Sign In",
            onTap: () => Get.offAll(() => const SignIn()),
          )
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      onTap: () async => await sendMail(),
      child: const Text(
        'Forgotten Password?',
        style: TextStyle(color: Color.fromARGB(255, 67, 64, 255), fontSize: 15),
      ),
    );
  }

  Future<void> sendMail() async {
    final Email email = Email(
      body: '',
      subject: 'Admin Reset Password',
      recipients: ['trondarius13@gmail.com', 'trontech2021@gmail.com'],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      Get.snackbar('Error: ', error.toString(),
      snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent);
          
    }
  }
}
