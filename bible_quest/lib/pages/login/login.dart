import 'package:bible_quest/pages/tabs/tabs.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () async {
            await Storage().write('userId', 1);
            Get.off(() => TabsPage());
          },
        ),
      ),
    );
  }
}
