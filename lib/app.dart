import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app_task/app/constatns/string.dart';
import 'package:peanut_app_task/app/route.dart';
import 'package:peanut_app_task/app/theme.dart';
import 'package:peanut_app_task/bindings/binding.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/views/pages/home/home-page.dart';
import 'package:peanut_app_task/views/pages/login/login-page.dart';

class PeanutApp extends StatelessWidget {
  const PeanutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.appTheme,
      initialBinding: AppBinding(),
      getPages: AppRoute.route,
      home: _getInitialScreen(),
    );
  }
}

Widget _getInitialScreen() {
  final controller = Get.put(InitialController());
  return Obx(() {
    if (controller.token.value.isNotEmpty) {
      debugPrint("Logged in User");
      return const HomePage();
    } else {
      debugPrint("Not Logged in User");
      return const LoginPage();
    }
  });
}
