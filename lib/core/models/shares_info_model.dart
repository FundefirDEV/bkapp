// To parse this JSON data, do
//
//     final bankInfo = bankInfoFromJson(jsonString);

import 'dart:convert';

import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:intl/intl.dart';

SharesInfoModel sharesInfoFromJson(Map<String, dynamic> data) =>
    SharesInfoModel.fromJson(data);

String sharesInfoToJson(SharesInfoModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class SharesInfoModel {
  String shares;
  String shareValue;
  String maxQuantitySharesForBuyByPartner;
  ApprovalsModel approvals;

  SharesInfoModel(
      {this.shares,
      this.shareValue,
      this.maxQuantitySharesForBuyByPartner,
      this.approvals});

  factory SharesInfoModel.fromJson(Map<String, dynamic> json) =>
      SharesInfoModel(
          shares: json["shares"]?.toString() ?? '0',
          shareValue:
              formatConfig.format(json["shareValue"]?.toString()) ?? r'$0',
          maxQuantitySharesForBuyByPartner:
              json["maxQuantitySharesForBuyByPartner"]?.toString() ??
                  'Sin límites',
          approvals: json["approvals"] ?? new ApprovalsModel());

  Map<String, dynamic> toJson() => {
        "shares": shares,
        "shareValue": shareValue,
        "maxQuantitySharesForBuyByPartner": maxQuantitySharesForBuyByPartner,
        "approvals": approvals
      };
}
