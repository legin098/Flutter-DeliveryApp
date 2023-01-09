import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      Get.snackbar('Valid form', "Are you ready to send the Http request");
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the email");
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid form', "The email is not valid");
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the password");
      return false;
    }

    return true;
  }
}
