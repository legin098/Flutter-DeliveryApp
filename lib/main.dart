import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/pages/home/home_page.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? "/home" : "/",
      getPages: [
        GetPage(name: "/", page: (() => LoginPage())),
        GetPage(name: "/register", page: (() => RegisterPage())),
        GetPage(name: "/home", page: (() => HomePage()))
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
              primary: Colors.amber,
              secondary: Colors.amberAccent,
              onSecondary: Colors.amberAccent,
              brightness: Brightness.light,
              background: Colors.grey,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
