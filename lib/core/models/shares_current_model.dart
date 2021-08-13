// To parse this JSON data, do

import 'dart:convert';

import 'package:bkapp_flutter/src/utils/utils_tools.dart';

String welcomeToJson(SharesCurrentModel data) => json.encode(data.toJson());

class SharesCurrentModel {
  SharesCurrentModel({
    this.lastCashBalance,
    this.totalSharesMeeting,
    this.newCashBalance,
    this.sharesByPartners,
  });

  String lastCashBalance;
  String totalSharesMeeting;
  String newCashBalance;
  List<SharesByPartner> sharesByPartners;

  factory SharesCurrentModel.fromJson(Map<String, dynamic> json) =>
      SharesCurrentModel(
        lastCashBalance: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["lastCashBalance"]) ??
            r'$0',
        // totalSharesMeeting: UtilsTools.formatConfig(decimalDigits: 2)
        //         .format(json["totalSharesMeeting"]) ??
            //r'$0',
        totalSharesMeeting: json["totalSharesMeeting"].toString() ?? r'0',
        newCashBalance: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["newCashBalance"]) ??
            r'$0',
        sharesByPartners: List<SharesByPartner>.from(
            json["sharesByPartners"].map((x) => SharesByPartner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lastCashBalance": lastCashBalance,
        "totalSharesMeeting": totalSharesMeeting,
        "newCashBalance": newCashBalance,
        "sharesByPartners":
            List<dynamic>.from(sharesByPartners.map((x) => x.toJson())),
      };
}

class SharesByPartner {
  SharesByPartner({
    this.partnerName,
    this.sharesQuantity,
    this.sharesAmmount,
  });

  String partnerName;
  String sharesQuantity;
  String sharesAmmount;

  factory SharesByPartner.fromJson(Map<String, dynamic> json) =>
      SharesByPartner(
        partnerName: json["partnerName"] ?? '',
        // sharesQuantity: UtilsTools.formatConfig(decimalDigits: 2)
        //         .format(json["sharesQuantity"]) ??
        //     r'$0',
        sharesQuantity: json["sharesQuantity"].toString() ?? r'0',
        sharesAmmount: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["sharesAmmount"]) ??
            r'$0',
      );

  Map<String, dynamic> toJson() => {
        "partnerName": partnerName,
        "sharesQuantity": sharesQuantity,
        "sharesAmmount": sharesAmmount,
      };
}
