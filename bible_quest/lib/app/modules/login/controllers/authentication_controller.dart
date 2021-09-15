import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  User? _firebaseUser;

  bool get isAuthenticated => _firebaseUser != null;

  @override
  void onInit() {
    checkFirebaseCredentials();
    super.onInit();
  }

  void checkFirebaseCredentials() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _firebaseUser = user;
      } else {
        _firebaseUser = null;
      }
    });
  }
}
