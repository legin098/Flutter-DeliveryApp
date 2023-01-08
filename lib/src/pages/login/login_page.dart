import 'package:delivery_app/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Container(
          child: _textDontHaveAccount(),
        ),
      ),
      body: Stack(children: [
        _backgroundCover(context),
        _boxForm(context),
        Column(
          children: [_imageCover(), _textAppName()],
        )
      ]),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      color: Colors.amber,
      alignment: Alignment.topCenter,
    );
  }

  //Private
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/img/delivery.png",
          width: 130,
          height: 130,
        ),
      ),
    );
  }

  Widget _textAppName() {
    return const Text("Food Delivery",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.33, left: 50, right: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 10, offset: Offset(0, 0.80))
          ]),
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFieldEmail(),
          _textFieldPassword(),
          _buttonLogin()
        ]),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 45),
        child: const Text('Enter this information',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17)));
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: () => con.login(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12)),
          child: const Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          )),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'You do not have an account?',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: const Text(
            'Sign up here',
            style: TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}
