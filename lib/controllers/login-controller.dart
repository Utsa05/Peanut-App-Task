import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app_task/app/route.dart';
import 'package:peanut_app_task/app/theme.dart';
import 'package:peanut_app_task/app/utils.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/data/model/request/login-request.dart';
import 'package:peanut_app_task/data/repositories/api-repository.dart';

class LoginController extends GetxController {
  late Timer _timer;

  final _intitalController = Get.find<InitialController>();
  final ApiRepository _apiRepository = ApiRepository();
  var loging = false.obs;

  //text-controller
  final TextEditingController loginEditingController =
      TextEditingController(text: "2088888");
  final TextEditingController passwordEditingController =
      TextEditingController(text: "ral11lod");

  void loginUser() async {
    try {
      loging(true);
      LoginRequestModel requestModel = LoginRequestModel(
          login: int.parse(loginEditingController.text),
          password: passwordEditingController.text);
      var resposne = await _apiRepository.doUserLogin(requestModel);
      _intitalController.setToken(resposne.token);
      _intitalController.setLogin(loginEditingController.text);
      await Future.delayed(
          const Duration(seconds: 1)); // You might need to adjust the delay

      if (_intitalController.token.isNotEmpty &&
          _intitalController.login.isNotEmpty) {
        Get.offNamed(AppRoute.homeRoute);
      }
      loging(false);
    } on SocketException {
      snackBar("OPS", "No Internet Connecion", AppTheme.redColor);
      loging(false);
    } catch (e) {
      debugPrint(e.toString());
      snackBar("OPS", e.toString(), AppTheme.redColor);
      loging(false);
    }
  }

  autoTokenCollector() {
    debugPrint("auto call on");
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) async {
      LoginRequestModel requestModel = LoginRequestModel(
          login: int.parse(loginEditingController.text),
          password: passwordEditingController.text);
      var resposne = await _apiRepository.doUserLogin(requestModel);
      _intitalController.setToken(resposne.token);
      _intitalController.setLogin(loginEditingController.text);
    });
  }

  @override
  void onInit() {
    autoTokenCollector();
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
