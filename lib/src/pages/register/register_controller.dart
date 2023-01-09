import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (isValidForm(email, name, lastName, phone, password, confirmPassword)) {
      User user = User(
          email: email,
          name: name,
          lastname: lastName,
          phone: phone,
          password: password);

      Response response = await userProvider.create(user);

      print("RESPONSE: ${response.body}");

      Get.snackbar('Valid form', "Are you ready to send the Http request");
    }
  }

  bool isValidForm(String email, String name, String lastName, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the email");
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid form', "The email is not valid");
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the name");
      return false;
    }

    if (lastName.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the last name");
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the number phone");
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the password");
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Invalid form', "You must enter the confirm password");
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Invalid form', "Passwords do not match");
      return false;
    }

    return true;
  }
}
