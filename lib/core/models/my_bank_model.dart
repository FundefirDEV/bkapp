// To parse this JSON data, do
//
//     final myBankModel = myBankModelFromJson(jsonString);

import 'dart:convert';

import 'package:bkapp_flutter/core/models/bank_rules_model.dart';
import 'package:intl/intl.dart';

MyBankModel myBankModelFromJson(Map<String, dynamic> data) =>
    MyBankModel.fromJson(data);

String myBankModelToJson(MyBankModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class MyBankModel {
  MyBankModel({this.activeCredits, this.bankRulesModel});

  List<ActiveCredit> activeCredits;
  BankRulesModel bankRulesModel;

  factory MyBankModel.fromJson(Map<String, dynamic> json) => MyBankModel(
        activeCredits: json["activeCredits"] == null
            ? []
            : List<ActiveCredit>.from(
                json["activeCredits"].map((x) => ActiveCredit.fromJson(x))),
        bankRulesModel: json["bankRulesModel"] != null
            ? BankRulesModel.fromJson(json["bankRulesModel"])
            : new BankRulesModel(),
      );

  Map<String, dynamic> toJson() => {
        "activeCredits": activeCredits == null
            ? []
            : List<dynamic>.from(activeCredits.map((x) => x.toJson())),
        "bankRulesModel": bankRulesModel == null
            ? new BankRulesModel()
            : bankRulesModel.toJson()
      };
}

class ActiveCredit {
  ActiveCredit({
    this.id,
    this.approvalDate,
    this.dueDate,
    this.amount,
    this.installments,
    this.totalCredit,
    this.totalInterest,
    this.isAdvanceCredit,
    this.scheduleInstallment,
  });

  int id;
  String approvalDate;
  String dueDate;
  String amount;
  int installments;
  String totalCredit;
  String totalInterest;
  bool isAdvanceCredit;
  List<ScheduleInstallment> scheduleInstallment;

  factory ActiveCredit.fromJson(Map<String, dynamic> json) => ActiveCredit(
        id: json["id"] == null ? null : json["id"],
        approvalDate:
            json["approvalDate"] == null ? null : json["approvalDate"],
        dueDate: json["dueDate"] == null ? null : json["dueDate"],
        amount: json["amount"] == null
            ? r'$0'
            : formatConfig.format(json["amount"]).toString(),
        installments: json["installments"] == null ? 0 : json["installments"],
        totalCredit: json["totalCredit"] == null
            ? r'$0'
            : formatConfig.format(json["totalCredit"]).toString(),
        totalInterest: json["totalInterest"] == null
            ? r'$0'
            : formatConfig.format(json["totalInterest"]).toString(),
        isAdvanceCredit:
            json["isAdvanceCredit"] == null ? null : json["isAdvanceCredit"],
        scheduleInstallment: json["scheduleInstallment"] == null
            ? []
            : List<ScheduleInstallment>.from(json["scheduleInstallment"]
                .map((x) => ScheduleInstallment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "approvalDate": approvalDate == null ? null : approvalDate,
        "dueDate": dueDate == null ? null : dueDate,
        "amount": amount == null ? 0.0 : amount,
        "installments": installments == null ? 0 : installments,
        "totalCredit": totalCredit == null ? 0.0 : totalCredit,
        "totalInterest": totalInterest == null ? 0.0 : totalInterest,
        "isAdvanceCredit": isAdvanceCredit == null ? null : isAdvanceCredit,
        "scheduleInstallment": scheduleInstallment == null
            ? []
            : List<dynamic>.from(scheduleInstallment.map((x) => x.toJson())),
      };
}

class ScheduleInstallment {
  ScheduleInstallment(
      {this.id,
      this.numberInstallment,
      this.capital,
      this.interestCalculate,
      this.ordinaryInterestPercentage,
      this.totalPayment,
      this.isPaidOrdinaryInterestAdvance,
      this.datePayment});

  int id;
  int numberInstallment;
  String capital;
  String interestCalculate;
  String ordinaryInterestPercentage;
  String totalPayment;
  bool isPaidOrdinaryInterestAdvance;
  String datePayment;

  factory ScheduleInstallment.fromJson(Map<String, dynamic> json) =>
      ScheduleInstallment(
          id: json["id"] == null ? null : json["id"],
          numberInstallment:
              json["numberInstallment"] == null ? 0 : json["numberInstallment"],
          capital: json["capital"] == null
              ? r'$0'
              : formatConfig.format(json["capital"]).toString(),
          interestCalculate: json["interestCalculate"] == null
              ? r'$0'
              : formatConfig.format(json["interestCalculate"]).toString(),
          ordinaryInterestPercentage: json["ordinaryInterestPercentage"] == null
              ? r'$0'
              : formatConfig
                  .format(json["ordinaryInterestPercentage"])
                  .toString(),
          totalPayment: json["totalPayment"] == null
              ? r'$0'
              : formatConfig.format(json["totalPayment"])?.toString(),
          isPaidOrdinaryInterestAdvance:
              json["isPaidOrdinaryInterestAdvance"] == null
                  ? null
                  : json["isPaidOrdinaryInterestAdvance"],
          datePayment:
              json["datePayment"] == null ? null : json["datePayment"]);

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "numberInstallment": numberInstallment == null ? 0 : numberInstallment,
        "capital": capital == null ? 0.0 : capital,
        "interestCalculate":
            interestCalculate == null ? 0.0 : interestCalculate,
        "ordinaryInterestPercentage": ordinaryInterestPercentage == null
            ? 0.0
            : ordinaryInterestPercentage,
        "totalPayment": totalPayment,
        "isPaidOrdinaryInterestAdvance": isPaidOrdinaryInterestAdvance == null
            ? null
            : isPaidOrdinaryInterestAdvance,
        "datePayment": datePayment == null ? null : datePayment
      };
}
