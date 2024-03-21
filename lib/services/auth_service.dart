import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String errorAuth = '';

  // register auth google
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userRegister = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userRegister.user;
    } on FirebaseException catch (error) {
      errorAuth = error.message.toString();
    }
    return null;
  }

// login auth google
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userRegister = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userRegister.user;
    } on FirebaseException catch (error) {
      errorAuth = error.message.toString();
    }
    return null;
  }

  void loginOut() async {
    await firebaseAuth.signOut();
  }
}
