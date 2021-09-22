import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'forms/login_form.dart';
import 'forms/register_form.dart';

enum ApplicationLoginState {
  login,
  register,
}

class Authentication extends StatelessWidget {
  const Authentication({
    required this.loginState,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.startRegistration,
  });

  final ApplicationLoginState loginState;

  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function() startRegistration;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.login:
        return PasswordForm(
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorSnackBar(context, 'login-failed'.tr, e));
          },
          startRegistration: startRegistration,
        );

      case ApplicationLoginState.register:
        return RegisterForm(
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          ) {
            registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorSnackBar(context, 'registration-failed'.tr, e));
          },
        );

      default:
        return Center(
          child: Row(
            children: const [
              Text("Internal error, this shouldn't happen..."),
            ],
          ),
        );
    }
  }

  void _showErrorSnackBar(BuildContext context, String title, Exception e) {
    print((e as dynamic).code);
    String message = (e as dynamic).code;
    Get.snackbar(
      title,
      message.tr,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
    );
  }
}
