import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'authentication.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (appState) => Authentication(
          loginState: appState.loginState,
          signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
          startRegistration: appState.startRegistration,
          cancelRegistration: appState.cancelRegistration,
          registerAccount: appState.registerAccount,
        ),
      ),
    );
  }
}
