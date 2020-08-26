// To parse this JSON data, do
//
//     final MeetingModel = meetingModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

MeetingModel meetingFromJson(Map<String, dynamic> data) =>
    MeetingModel.fromJson(data);

String meetingToJson(MeetingModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class MeetingModel {
  MeetingModel(
      {this.cashBalance,
      this.fundReserve,
      this.badDebtReserve,
      this.earningByShare,
      this.totalShares,
      this.capitalAcumulable,
      this.totalDefaultInterest,
      this.totalOrdinaryInterest,
      this.totalCredit});

  String cashBalance;
  String fundReserve;
  String badDebtReserve;
  String earningByShare;
  String totalShares;
  String capitalAcumulable;
  String totalDefaultInterest;
  String totalOrdinaryInterest;
  String totalCredit;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
      cashBalance: formatConfig.format(json["cashBalance"]) ?? null,
      fundReserve: formatConfig.format(json["fundReserve"]) ?? null,
      badDebtReserve: formatConfig.format(json["badDebtReserve"]) ?? null,
      earningByShare: formatConfig.format(json["earningByShare"]) ?? null,
      totalShares: json["totalShares"].toString() ?? null,
      capitalAcumulable:
          formatConfig.format(json["totalShares"] * 10000) ?? r'$0',
      totalDefaultInterest:
          formatConfig.format(json["totalDefaultInterest"]) ?? null,
      totalOrdinaryInterest:
          formatConfig.format(json["totalOrdinaryInterest"]) ?? null,
      totalCredit: formatConfig.format(json["totalCredit"]) ?? null);

  Map<String, dynamic> toJson() => {
        "cashBalance": cashBalance,
        "fundReserve": fundReserve,
        "badDebtReserve": badDebtReserve,
        "earningByShare": earningByShare,
        "totalShares": totalShares,
        "capitalAcumulable": capitalAcumulable,
        "totalDefaultInterest": totalDefaultInterest,
        "totalOrdinaryInterest": totalOrdinaryInterest,
        "totalCredit": totalCredit
      };
}
