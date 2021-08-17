// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:bkapp_flutter/src/utils/utils_tools.dart';

String meetingDetailToJson(MeetingDetail data) => json.encode(data.toJson());

class MeetingDetail {
  MeetingDetail(
      {this.totalCapital,
      this.totalInterest,
      this.totalInstallmentsPays,
      this.totalAdanceInsterest,
      this.totalEarning,
      this.cashBalance,
      this.activeCredits,
      this.creditsThisMeeting,
      this.partnertsPayments});

  String totalCapital;
  String totalInterest;
  String totalInstallmentsPays;
  String totalAdanceInsterest;
  String totalEarning;
  String cashBalance;
  String activeCredits;
  List<CreditsThisMeeting> creditsThisMeeting;
  List<PartnertsPayments> partnertsPayments;

  factory MeetingDetail.fromJson(Map<String, dynamic> json) => MeetingDetail(
        totalCapital: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["totalCapital"]) ??
            r'$0.0',
        totalInterest: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["totalInterest"]) ??
            r'$0.0',
        totalInstallmentsPays: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["totalInstallmentsPays"]) ??
            r'$0.0',
        totalAdanceInsterest: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["totalAdanceInsterest"]) ??
            r'$0.0',
        totalEarning: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["totalEarning"]) ??
            r'$0.0',
        cashBalance: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["cashBalance"]) ??
            r'$0.0',
        activeCredits: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["activeCredits"]) ??
            r'$0.0',
        creditsThisMeeting: List<CreditsThisMeeting>.from(
            json["creditsThisMeetig"]
                .map((x) => CreditsThisMeeting.fromJson(x))),
        partnertsPayments: List<PartnertsPayments>.from(
            json["partnertsPayments"]
                .map((x) => PartnertsPayments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCapital": totalCapital,
        "totalInterest": totalInterest,
        "totalInstallmentsPays": totalInstallmentsPays,
        "totalEarning": totalEarning,
        "creditsThisMeetig":
            List<dynamic>.from(creditsThisMeeting.map((x) => x.toJson())),
      };
}

class CreditsThisMeeting {
  CreditsThisMeeting({
    this.partnerName,
    this.quantity,
    this.interest,
    this.creditType,
  });

  String partnerName;
  String quantity;
  String interest;
  String creditType;

  factory CreditsThisMeeting.fromJson(Map<String, dynamic> json) =>
      CreditsThisMeeting(
        partnerName: json["partnerName"],
        quantity: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["quantity"]) ??
            r'$0.0',
        interest: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["interest"]) ??
            r'$0.0',
        creditType: json["creditType"],
      );

  Map<String, dynamic> toJson() => {
        "partnerName": partnerName,
        "quantity": quantity,
        "interest": interest,
        "creditType": creditType,
      };
}

class PartnertsPayments {
  PartnertsPayments({
    this.name,
    this.capital,
    this.interest,
    this.creditType,
  });

  String name;
  String capital;
  String interest;
  String creditType;

  factory PartnertsPayments.fromJson(Map<String, dynamic> json) =>
      PartnertsPayments(
        name: json["name"],
        capital:
            UtilsTools.formatConfig(decimalDigits: 2).format(json["capital"]) ??
                r'$0.0',
        interest: UtilsTools.formatConfig(decimalDigits: 2)
                .format(json["interest"]) ??
            r'$0.0',
        creditType: json["creditType"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
        "interest": interest,
        "creditType": creditType,
      };
}
