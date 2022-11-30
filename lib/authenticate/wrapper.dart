import 'package:flutter/material.dart';
import '../shared/exports.dart';

class Wrapper extends GetxController {
  static Wrapper instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  AuthService authService = AuthService();

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);

    //User will be notified when there is any changes
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const Welcome());
    } else if (user.uid.contains('0Rlq1mpkU7htQY4BskWRKpo4hvM2')) {
      Get.offAll(() => const AdminHome());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  Future validateAndSignIn(String email, password) async {
    dynamic result = await authService.login(
      email: email,
      password: password,
    );

    if (result!.contains('Success')) {
      Get.snackbar('Welcome Back', 'Enjoy',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error:', result,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  Future adminSignin(String email, password) async {
    dynamic result = await authService.adminLogin(
      email: email,
      password: password,
    );

    if (result!.contains('Success')) {
      Get.snackbar('Welcome Back', 'Enjoy',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error:', result,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }
}
