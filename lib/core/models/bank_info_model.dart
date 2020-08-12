// To parse this JSON data, do
//
//     final bankInfo = bankInfoFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

BankInfo bankInfoFromJson(Map<String, dynamic> data) => BankInfo.fromJson(data);

String bankInfoToJson(BankInfo data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class BankInfo {
  BankInfo({
    this.personal,
    this.group,
  });

  Personal personal;
  Group group;

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
        personal: Personal.fromJson(json["person"]),
        group: Group.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "person": personal.toJson(),
        "group": group.toJson(),
      };
}

class Group {
  Group({
    this.cashBalance = r'$0',
    this.activeCredits = r'$0',
    this.shares = '0',
  });

  String cashBalance;
  String activeCredits;
  String shares;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        cashBalance: formatConfig.format(json["cashBalance"]) ?? r'$0',
        activeCredits: formatConfig.format(json["activeCredits"]) ?? r'$0',
        shares: json["shares"]?.toString() ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "cashBalance": cashBalance,
        "activeCredits": activeCredits,
        "shares": shares,
      };
}

class Personal {
  Personal({
    this.earnings = r'$0',
    this.activeCredit = r'$0',
    this.shares = '0',
  });

  String earnings;
  String activeCredit;
  String shares;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        earnings: formatConfig.format(json["cashBalance"]) ?? r'$0',
        activeCredit: formatConfig.format(json["activeCredits"]) ?? r'$0',
        shares: json["shares"]?.toString() ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "earnings": earnings,
        "activeCredit": activeCredit,
        "shares": shares,
      };
}
