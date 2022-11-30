import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';
  bool obscurePassword = true;
  bool selected = false;
  bool obscure = true;
  AuthService authentication = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // firstname Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstnameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.isEmpty ? 'Kindly Provide your First Name' : null,
            onChanged: (value) {
              setState(() => firstname = value);
            },
            onSaved: (value) {
              setState(() => firstname = value!);
            },
            onFieldSubmitted: (value) {
              setState(() => firstname = value);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'First Name',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // lastname field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastnameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.isEmpty ? 'Kindly Provide your Last Name' : null,
            onChanged: (value) {
              setState(() => lastname = value);
            },
            onSaved: (value) {
              setState(() => lastname = value!);
            },
            onFieldSubmitted: (value) {
              setState(() => lastname = value);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'Last Name',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          const SizedBox(
            height: 15,
          ),

          // Email Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmail ? '' : 'Provide a valid Email address',
            onChanged: (value) {
              setState(() => email = value);
            },
            onSaved: (value) {
              setState(() => email = value!);
            },
            onFieldSubmitted: (value) {
              setState(() => email = value);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.mail),
                hintText: 'Email',
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
            onSaved: (value) {
              setState(() => password = value!);
            },
            onFieldSubmitted: (value) {
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
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // Confirm Password Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscure,
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => value != password
                ? ' Characters should match Password characters'
                : '',
            onChanged: (value) {
              setState(() => confirmpassword = value);
            },
            onFieldSubmitted: (value) {
              setState(() => confirmpassword = value);
            },
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                suffixIcon: (confirmpassword.isNotEmpty)
                    ? GestureDetector(
                        onTap: () {
                          setState(() => obscure = !obscure);
                        },
                        child: Icon(
                          obscure
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
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          termsAndConditions(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Button(
            onPressed: () {
              _showMyDialog();
            },
            text: 'Sign Up',
            word: 'Already Have an Account? Sign In',
            onTap: () {
              Get.offAll(() => const SignIn());
            },
          ),
        ],
      ),
    );
  }

  Widget termsAndConditions() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;

        });
      },
      child: Row(children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: selected
                  ? const Color.fromARGB(255, 64, 33, 237)
                  : Colors.white),
        ),
        const SizedBox(
          width: 3,
        ),
        const Text('I agree to the Terms of Services and Privacy Policy'),
      ]),
    );
  }

  Future<void> _showMyDialog() async => showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create an Account'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Do you wish to proceed with creating an account? '),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text(
                    'Proceed',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  onPressed: () {
                    Get.snackbar('Please Wait', 'Creating Account...',
                        showProgressIndicator: true,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 5));

                    _validateAndSignUp();

                    Navigator.pop(context);
                  }),
            ],
          );
        },
      );

  Future _validateAndSignUp() async {
    dynamic result = await authentication.signUp(
      email: email,
      password: password,
      firstname: firstname,
      lastname: lastname,
    );

    if (result.contains('Success') && selected == true) {
      Get.offAll(() => const HomePage());
      Get.snackbar('Welcome ', 'Account  Created Successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error:', result,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }
}
