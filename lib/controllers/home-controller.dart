import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/data/model/request/request-model.dart';
import 'package:peanut_app_task/data/model/response/account-info-response-model.dart';
import 'package:peanut_app_task/data/model/response/trade-response-model.dart';
import 'package:peanut_app_task/data/repositories/api-repository.dart';

import '../app/theme.dart';
import '../app/utils.dart';

class HomeController extends GetxController {
  final _apiRepository = ApiRepository();
  final _initialController = Get.find<InitialController>();
  var tradeList = <TradeReponseModel>[].obs;
  var phoneNo = "".obs;
  var totalProfit = 0.0.obs;
  late Rx<AccountInfoResponseModel> userData = AccountInfoResponseModel(
          address: "",
          balance: 0,
          city: "",
          country: "",
          currency: 0,
          currentTradesCount: 0,
          currentTradesVolume: 0,
          equity: 0,
          freeMargin: 0,
          isAnyOpenTrades: true,
          isSwapFree: true,
          leverage: 0,
          name: "",
          phone: "",
          totalTradesCount: 0,
          totalTradesVolume: 0,
          type: 0,
          verificationLevel: 0,
          zipCode: "")
      .obs;
  var loadingData = false.obs;
  var loadingTrade = false.obs;

  void getAllData() {
    getTrade();
    _getUserAccountInformation();
  }

  void _getUserAccountInformation() async {
    try {
      loadingData(true);

      RequestModel requestModel = RequestModel(
          token: _initialController.token.value,
          login: _initialController.login.value);
      var resposne = await _apiRepository.getAccountInfo(requestModel);
      userData.value = resposne;
      debugPrint(userData.value.name);

      _getUserPhoneNo();
      loadingData(false);
    } on SocketException {
      snackBar("OPS", "No Internet Connecion", AppTheme.redColor);
      loadingData(false);
    } catch (e) {
      debugPrint(e.toString());
      snackBar("OPS", e.toString(), AppTheme.redColor);
      loadingData(false);
    }
  }

  void _getUserPhoneNo() async {
    RequestModel requestModel = RequestModel(
        token: _initialController.token.value,
        login: _initialController.login.value);
    var resposne = await _apiRepository.getFoutPhoneNo(requestModel);

    phoneNo.value = resposne;
  }

  void getTrade() async {
    loadingTrade(true);
    RequestModel requestModel = RequestModel(
        token: _initialController.token.value,
        login: _initialController.login.value);
    var resposne = await _apiRepository.getTrades(requestModel);

    tradeList.value = resposne;

    totalProfit.value =
        tradeList.fold(0, (sum, trade) => sum + trade.currentPrice);
    loadingTrade(false);
  }
}
