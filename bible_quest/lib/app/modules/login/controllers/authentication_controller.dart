import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  User? _firebaseUser;

  bool get isUserLoggedIn {
    _firebaseUser = FirebaseAuth.instance.currentUser;
    return _firebaseUser != null;
  }
  //bool get isUserLoggedIn => false;

  String? get userUID => _firebaseUser?.uid;

  String? get username => _firebaseUser?.displayName;

  @override
  void onInit() {
    _firebaseUser = FirebaseAuth.instance.currentUser;
    super.onInit();
  }
}
