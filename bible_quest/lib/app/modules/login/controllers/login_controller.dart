import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new

import '../views/authentication.dart';

class LoginController extends GetxController {
  String? _email;
  String? get email => _email;
  ApplicationLoginState _loginState = ApplicationLoginState.login;
  ApplicationLoginState get loginState => _loginState;

  void startRegistration() {
    _loginState = ApplicationLoginState.register;
    update();
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.login;
    update();
  }

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
      Get.offNamed(Routes.TABS);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      Get.offNamed(Routes.TABS);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
