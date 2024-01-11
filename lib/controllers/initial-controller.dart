import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peanut_app_task/app/constatns/string.dart';
import 'package:peanut_app_task/app/route.dart';

class InitialController extends GetxController {
  //storage
  final storage = const FlutterSecureStorage();
  RxString token = "".obs;
  RxString login = "".obs;

  @override
  void onInit() {
    callTokenLogin();
    super.onInit();
  }

  //methods
  void setToken(String token) async {
    await storage.write(key: AppString.tokenKey, value: token);
    _getToken();
  }

  void setLogin(String login) async {
    await storage.write(key: AppString.loginKey, value: login);
    await _getLogin();
  }

  Future<void> _getToken() async {
    token.value = (await storage.read(key: AppString.tokenKey)) ?? "";
  }

  Future<void> _getLogin() async {
    login.value = (await storage.read(key: AppString.loginKey)) ?? "";
  }

  Future<void> logOutUser() async {
    await Future.delayed(const Duration(seconds: 1));
    await storage.deleteAll();
  }

  void callTokenLogin() async {
    await _getToken();
    await _getLogin();
  }

  Future<bool> checkUserAlreadyLogdInd() async {
    callTokenLogin();
    print(token.value);
    if (token.value.isNotEmpty) {
      debugPrint("Logdin User");
      return true;
    } else {
      debugPrint("Not Logedin User....");
      return false;
    }
  }
}
