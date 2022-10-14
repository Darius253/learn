import 'package:learn/services/database.dart';

import '../shared/exports.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get getCurrentUserID =>
      _auth.currentUser != null ? _auth.currentUser?.uid : '';

  Person? _userFromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? Person(id: user.uid) : null;
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // User? user = result.user;
      // // return _userFromFirebaseUser(user!);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await FirestoreService(uid: user!.uid).setInitialUserData(
        id: user.uid,
        firstname: firstname,
        email: email,
        lastname: lastname,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(const SignIn());
    } catch (error) {
      return error;
    }
  }
}
