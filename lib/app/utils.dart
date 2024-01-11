import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:peanut_app_task/app/theme.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/views/pages/login/login-page.dart';

SizedBox box(double size) => SizedBox(
      height: size,
      width: size,
    );

Size size() => Get.size;

ThemeData themdata() => Get.theme;

dynamic postHttp(String path, dynamic body, bool isNeedDecode) async {
  Client client = Client();

  final response = await client.post(
    Uri.parse(path),
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return isNeedDecode ? jsonDecode(response.body) : response.body;
  } else {
    debugPrint(response.statusCode.toString());

    Get.find<InitialController>().logOutUser();
    Get.offAll(const LoginPage());
    Get.snackbar("OPS", "Need To Logout",
        backgroundColor: AppTheme.redColor, colorText: AppTheme.whiteColor);

    throw Exception("API ERROR");
  }
}

snackBar(String type, String title, Color color) {
  Get.snackbar(type, title, backgroundColor: color);
}
