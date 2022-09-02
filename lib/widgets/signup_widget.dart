import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/shared/exports.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';
  bool obscurePassword = true;
  bool selected = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Username Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _usernameController,
            keyboardType: TextInputType.name,
            validator: (value) => value!.length < 5
                ? 'Username should be 5 to 10 characters'
                : '',
            onChanged: (value) {
              setState(() => username = value);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Fullname field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _fullnameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.length < 8 ? 'Kindly Provide your Fullname' : null,
            onChanged: (value) {
              setState(() => fullname = value);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'Fullname',
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
            validator: (value) => value != confirmpassword
                ? ' Characters should match Password characters'
                : '',
            onChanged: (value) {
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
            onPressed: () => _showMyDialog(),
            text: 'Sign Up',
            word: 'Already Have an Account? Sign In',
            onTap: () {
              Get.off(() => const SignIn());
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
                  Text('A Subscriber account allows you to: '),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      '1. Purchase contents on AwStore.\n2. Read and Download(optional) contents on AwStore.'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Do you wish to proceed with creating an account type via this profile?'),
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
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();

                      // loading();
                    }
                    Navigator.of(context).pop();
                  }),
            ],
          );
        },
      );

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
