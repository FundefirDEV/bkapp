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
  MeetingModel({
    this.cashBalance,
    this.fundReserve,
    this.badDebtReserve,
    this.earningByShare,
  });

  String cashBalance;
  String fundReserve;
  String badDebtReserve;
  String earningByShare;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
      cashBalance: formatConfig.format(json["cashBalance"]) ?? null,
      fundReserve: formatConfig.format(json["fundReserve"]) ?? null,
      badDebtReserve: formatConfig.format(json["badDebtReserve"]) ?? null,
      earningByShare: formatConfig.format(json["earningByShare"]) ?? null);

  Map<String, dynamic> toJson() => {
        "cashBalance": cashBalance,
        "fundReserve": fundReserve,
        "badDebtReserve": badDebtReserve,
        "earningByShare": earningByShare,
      };
}
