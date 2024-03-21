import 'package:app_firebase_tutorial/services/auth_service.dart';
import 'package:app_firebase_tutorial/views/home_page.dart';
import 'package:app_firebase_tutorial/views/login_page.dart';
import 'package:app_firebase_tutorial/views/registe_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends AuthService {
  // show password field
  final showPassword = true.obs;

  // input controller email password
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();

  void clearTextField() {
    emailController.clear();
    passwordController.clear();
    passwordCheckController.clear();
  }
}

class AuthFunction extends InputController {
  // Login Function
  Future<User?> loginFunc() async {
    User? result = await login(emailController.text, passwordController.text);
    if (result == null) {
      Get.snackbar(
        'Login Error',
        errorAuth,
        backgroundColor: Colors.red,
        colorText: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Login Ok',
        result.email.toString(),
        backgroundColor: Colors.green,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return result;
  }

  // Register Function
  Future<User?> registerFunc() async {
    User? result = await register(emailController.text, passwordController.text);
    if (result == null) {
      Get.snackbar(
        'Register Error',
        errorAuth,
        backgroundColor: Colors.red,
        colorText: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Register Ok',
        result.email.toString(),
        backgroundColor: Colors.green,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return result;
  }

  var loginCheck = false.obs;
  var userEmail = ''.obs;

  bool loginReady() {
    firebaseAuth.authStateChanges().listen(
      (event) {
        if (event?.email == null) {
          loginCheck.value = false;
          userEmail.value = 'none';
        } else {
          loginCheck.value = true;
          userEmail.value = event!.email.toString();
        }
      },
    );
    return loginCheck.value;
  }
}

class MainController extends AuthFunction {
  // main controller getx

  var loadingIndicator = false.obs;

  // page controller and name of pages
  final pageController = PageController();

  final loginPage = const LoginPage();
  final registerPage = const RegisterPage();
  final homePage = const HomePage();
}

enum PageIndex {
  Login(0),
  Register(1),
  Homepage(2);

  final int page;
  const PageIndex(this.page);
}
