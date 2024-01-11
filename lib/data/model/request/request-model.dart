// To parse this JSON data, do
//
//     final accountInfoRequestModel = accountInfoRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RequestModel accountInfoRequestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String accountInfoRequestModelToJson(RequestModel data) =>
    json.encode(data.toJson());

class RequestModel {
  final String login;
  final String token;

  RequestModel({
    required this.login,
    required this.token,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        login: json["login"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "token": token,
      };
}
