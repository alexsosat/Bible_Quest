import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new

import '../views/authentication.dart';

class LoginController extends GetxController {
  String? _email;
  String? get email => _email;
  ApplicationLoginState _loginState = ApplicationLoginState.login;
  ApplicationLoginState get loginState => _loginState;

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void startRegistration() {
    _loginState = ApplicationLoginState.register;
    update();
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.login;
    update();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
