// To parse this JSON data, do
//
//     final accountInfoResponseModel = accountInfoResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AccountInfoResponseModel accountInfoResponseModelFromJson(String str) =>
    AccountInfoResponseModel.fromJson(json.decode(str));

String accountInfoResponseModelToJson(AccountInfoResponseModel data) =>
    json.encode(data.toJson());

class AccountInfoResponseModel {
  final String address;
  final double balance;
  final String city;
  final String country;
  final int currency;
  final int currentTradesCount;
  final double currentTradesVolume;
  final double equity;
  final double freeMargin;
  final bool isAnyOpenTrades;
  final bool isSwapFree;
  final int leverage;
  final String name;
  final String phone;
  final int totalTradesCount;
  final double totalTradesVolume;
  final int type;
  final int verificationLevel;
  final String zipCode;

  AccountInfoResponseModel({
    required this.address,
    required this.balance,
    required this.city,
    required this.country,
    required this.currency,
    required this.currentTradesCount,
    required this.currentTradesVolume,
    required this.equity,
    required this.freeMargin,
    required this.isAnyOpenTrades,
    required this.isSwapFree,
    required this.leverage,
    required this.name,
    required this.phone,
    required this.totalTradesCount,
    required this.totalTradesVolume,
    required this.type,
    required this.verificationLevel,
    required this.zipCode,
  });

  factory AccountInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      AccountInfoResponseModel(
        address: json["address"],
        balance: json["balance"]?.toDouble(),
        city: json["city"],
        country: json["country"],
        currency: json["currency"],
        currentTradesCount: json["currentTradesCount"],
        currentTradesVolume: json["currentTradesVolume"]?.toDouble(),
        equity: json["equity"]?.toDouble(),
        freeMargin: json["freeMargin"]?.toDouble(),
        isAnyOpenTrades: json["isAnyOpenTrades"],
        isSwapFree: json["isSwapFree"],
        leverage: json["leverage"],
        name: json["name"],
        phone: json["phone"],
        totalTradesCount: json["totalTradesCount"],
        totalTradesVolume: json["totalTradesVolume"]?.toDouble(),
        type: json["type"],
        verificationLevel: json["verificationLevel"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "balance": balance,
        "city": city,
        "country": country,
        "currency": currency,
        "currentTradesCount": currentTradesCount,
        "currentTradesVolume": currentTradesVolume,
        "equity": equity,
        "freeMargin": freeMargin,
        "isAnyOpenTrades": isAnyOpenTrades,
        "isSwapFree": isSwapFree,
        "leverage": leverage,
        "name": name,
        "phone": phone,
        "totalTradesCount": totalTradesCount,
        "totalTradesVolume": totalTradesVolume,
        "type": type,
        "verificationLevel": verificationLevel,
        "zipCode": zipCode,
      };
}
