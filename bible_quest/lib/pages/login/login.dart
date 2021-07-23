import 'package:bible_quest/pages/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () async {
            final GetStorage storage = GetStorage();
            await storage.write('userId', 1);
            Get.off(() => TabsPage());
          },
        ),
      ),
    );
  }
}
