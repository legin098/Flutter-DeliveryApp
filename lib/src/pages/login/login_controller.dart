import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await userProvider.login(email, password);

      if (responseApi.success == true) {
        GetStorage()
            .write("user", responseApi.data); //Datos del usuario en sesion
        goToHomePage();
      } else {
        Get.snackbar("login failed", responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.offNamedUntil("/home", (route) => false);
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
