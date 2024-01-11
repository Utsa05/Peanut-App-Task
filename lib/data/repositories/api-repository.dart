import 'package:peanut_app_task/data/services/api-service.dart';

import '../model/request/login-request.dart';
import '../model/request/request-model.dart';
import '../model/response/account-info-response-model.dart';
import '../model/response/login-response.dart';
import '../model/response/trade-response-model.dart';

class ApiRepository {
  ApiService apiService = ApiService();

  Future<LoginResponseModel> doUserLogin(LoginRequestModel login) async {
    return apiService.doUserLogin(login);
  }

  Future<AccountInfoResponseModel> getAccountInfo(RequestModel reques) async {
    return apiService.getAccountInfo(reques);
  }

  Future<String> getFoutPhoneNo(RequestModel reques) async {
    return apiService.getFoutPhoneNo(reques);
  }

  Future<List<TradeReponseModel>> getTrades(RequestModel request) async {
    return apiService.getTrades(request);
  }
}
