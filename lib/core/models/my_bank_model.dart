// To parse this JSON data, do
//
//     final myBankModel = myBankModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

MyBankModel myBankModelFromJson(Map<String, dynamic> data) =>
  MyBankModel.fromJson(data);

String myBankModelToJson(MyBankModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class MyBankModel {
    MyBankModel({
        this.activeCredits,
    });

    List<ActiveCredit> activeCredits;

    factory MyBankModel.fromJson(Map<String, dynamic> json) => MyBankModel(
        activeCredits: json["activeCredits"] == null ? [] : List<ActiveCredit>.from(json["activeCredits"].map((x) => ActiveCredit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "activeCredits": activeCredits == null ? [] : List<dynamic>.from(activeCredits.map((x) => x.toJson())),
    };
}

class ActiveCredit {
    ActiveCredit({
        this.id,
        this.amount,
        this.installments,
        this.scheduleInstallment,
    });

    int id;
    String amount;
    int installments;
    List<ScheduleInstallment> scheduleInstallment;

    factory ActiveCredit.fromJson(Map<String, dynamic> json) => ActiveCredit(
        id: json["id"] == null ? null : json["id"],
        amount: json["amount"] == null ? r'$0' : formatConfig.format(json["amount"]).toString(),
        installments: json["installments"] == null ? 0 : json["installments"],
        scheduleInstallment: json["scheduleInstallment"] == null ? [] : List<ScheduleInstallment>.from(json["scheduleInstallment"].map((x) => ScheduleInstallment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "amount": amount == null ? 0.0 : amount,
        "installments": installments == null ? 0 : installments,
        "scheduleInstallment": scheduleInstallment == null ? [] : List<dynamic>.from(scheduleInstallment.map((x) => x.toJson())),
    };
}

class ScheduleInstallment {
    ScheduleInstallment({
        this.numberInstallment,
        this.capital,
        this.interestCalculate,
        this.ordinaryInterestPercentage,
        this.totalPayment,
    });

    int numberInstallment;
    String capital;
    String interestCalculate;
    String ordinaryInterestPercentage;
    String totalPayment;

    factory ScheduleInstallment.fromJson(Map<String, dynamic> json) => ScheduleInstallment(
        numberInstallment: json["numberInstallment"] == null ? 0 : json["numberInstallment"],
        capital: json["capital"] == null ? r'$0' : formatConfig.format(json["capital"]).toString(),
        interestCalculate: json["interestCalculate"] == null ? r'$0' : formatConfig.format(json["interestCalculate"]).toString(),
        ordinaryInterestPercentage: json["ordinaryInterestPercentage"] == null ? r'$0' : formatConfig.format(json["ordinaryInterestPercentage"]).toString(),
        totalPayment: json["totalPayment"] == null ? r'$0' : formatConfig.format(json["totalPayment"])?.toString(),
    );

    Map<String, dynamic> toJson() => {
        "numberInstallment": numberInstallment == null ? 0 : numberInstallment,
        "capital": capital == null ? 0.0 : capital,
        "interestCalculate": interestCalculate == null ? 0.0 : interestCalculate,
        "ordinaryInterestPercentage": ordinaryInterestPercentage == null ? 0.0 : ordinaryInterestPercentage,
        "totalPayment": totalPayment,
    };
}
