import 'dart:convert';
import 'dart:io';

import 'package:peanut_app_task/app/constatns/api.dart';
import 'package:peanut_app_task/app/utils.dart';
import 'package:peanut_app_task/data/model/request/login-request.dart';
import 'package:peanut_app_task/data/model/request/request-model.dart';
import 'package:peanut_app_task/data/model/response/account-info-response-model.dart';
import 'package:peanut_app_task/data/model/response/login-response.dart';
import 'package:peanut_app_task/data/model/response/trade-response-model.dart';

class ApiService {
  Future<LoginResponseModel> doUserLogin(LoginRequestModel login) async {
    var reponseBody = await postHttp(API.loginUrl, login, true);
    LoginResponseModel response = LoginResponseModel.fromJson(reponseBody);
    return response;
  }

  Future<AccountInfoResponseModel> getAccountInfo(RequestModel reques) async {
    var reponseBody = await postHttp(API.accountInfoUrl, reques, true);
    AccountInfoResponseModel response =
        AccountInfoResponseModel.fromJson(reponseBody);
    return response;
  }

  Future<String> getFoutPhoneNo(RequestModel reques) async {
    var reponseBody = await postHttp(API.fourPhoneNoUrl, reques, false);
    String response = reponseBody as String;
    return response;
  }

  Future<List<TradeReponseModel>> getTrades(RequestModel request) async {
    final reponse = await postHttp(API.tradeUrl, request, true);
    List<dynamic> responseData = reponse;

    List<TradeReponseModel> list =
        responseData.map((e) => TradeReponseModel.fromJson(e)).toList();
    return list;
  }
}
