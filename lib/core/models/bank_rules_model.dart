import 'dart:convert';

import 'package:intl/intl.dart';

BankRulesModel bankRulesFromJson(Map<String, dynamic> data) =>
    BankRulesModel.fromJson(data);

String bankRulesToJson(BankRulesModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class BankRulesModel {
  double ordinaryInterestPercentage;
  double defaultRatePercentage;
  int creditMaxInstallments;
  String creditMaxValue;
  String shareValue;
  double expenseFundPercentage;
  double badDebtReservePercentage;

  BankRulesModel(
      {this.ordinaryInterestPercentage,
      this.defaultRatePercentage,
      this.creditMaxInstallments,
      this.creditMaxValue,
      this.shareValue,
      this.expenseFundPercentage,
      this.badDebtReservePercentage});

  factory BankRulesModel.fromJson(Map<String, dynamic> json) => BankRulesModel(
      ordinaryInterestPercentage: json["ordinaryInterestPercentage"] ?? 0.0,
      defaultRatePercentage: json["defaultRatePercentage"] ?? 0.0,
      creditMaxInstallments: json["creditMaxInstallments"] ?? 0,
      creditMaxValue: formatConfig.format(json["creditMaxValue"]) ?? 0.0,
      shareValue: formatConfig.format(json["shareValue"]) ?? 0.0,
      expenseFundPercentage: json["expenseFundPercentage"] ?? 0.0,
      badDebtReservePercentage: json["badDebtReservePercentage"] ?? 0.0);

  Map<String, dynamic> toJson() => {
        "ordinaryInterestPercentage": ordinaryInterestPercentage,
        "defaultRatePercentage": defaultRatePercentage,
        "creditMaxInstallments": creditMaxInstallments,
        "creditMaxValue": creditMaxValue,
        "shareValue": shareValue,
        "expenseFundPercentage": expenseFundPercentage,
        "badDebtReservePercentage": badDebtReservePercentage,
      };
}
