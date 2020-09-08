import 'dart:convert';

import 'package:intl/intl.dart';

ApprovalsModel approvalsModelFromJson(Map<String, dynamic> data) =>
    ApprovalsModel.fromJson(data);
String approvalsModelToJson(ApprovalsModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class ApprovalsModel {
  ApprovalsModel({
    this.cashBalance,
    this.totalRequestShares,
    this.totalCreditRequest,
    this.totalPaymentRequest,
    this.sharesRequest,
    this.creditRequest,
    this.paymentInstallmentRequest,
    this.myRequest,
  });
  String cashBalance;
  String totalRequestShares;
  String totalCreditRequest;
  String totalPaymentRequest;
  List<Request> sharesRequest;
  List<Request> creditRequest;
  List<Request> paymentInstallmentRequest;
  MyRequest myRequest;
  factory ApprovalsModel.fromJson(Map<String, dynamic> json) => ApprovalsModel(
        cashBalance: json["cashBalance"]?.toString() ?? r'$0',
        totalRequestShares: json["totalRequestShares"]?.toString() ?? '0',
        totalCreditRequest: json["totalCreditRequest"]?.toString() ?? r'$0',
        totalPaymentRequest: json["totalPaymentRequest"]?.toString() ?? r'$0',
        sharesRequest: List<Request>.from(
                json["sharesRequest"].map((x) => Request.fromJson(x))) ??
            new List<Request>(),
        creditRequest: List<Request>.from(
            json["creditRequest"].map((x) => Request.fromJson(x)) ??
                new List<Request>()),
        paymentInstallmentRequest: List<Request>.from(
            json["paymentInstallmentRequest"].map((x) => Request.fromJson(x)) ??
                new List<Request>()),
        myRequest: MyRequest.fromJson(json["myRequest"]) ?? new MyRequest(),
      );
  Map<String, dynamic> toJson() => {
        "cashBalance": cashBalance,
        "totalRequestShares": totalRequestShares,
        "totalCreditRequest": totalCreditRequest,
        "totalPaymentRequest": totalPaymentRequest,
        "sharesRequest":
            List<dynamic>.from(sharesRequest.map((x) => x.toJson())),
        "creditRequest":
            List<dynamic>.from(creditRequest.map((x) => x.toJson())),
        "paymentInstallmentRequest": List<dynamic>.from(
            paymentInstallmentRequest.map((x) => x.toJson())),
        "myRequest": myRequest.toJson(),
      };
}

class Request {
  Request({
    this.id,
    this.partnerName,
    this.amount,
    this.installments,
    this.requestDate,
    this.quantity,
  });
  int id;
  String partnerName;
  String amount;
  String installments;
  String requestDate;
  String quantity;
  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"] ?? 0,
        partnerName: json["partnerName"] ?? null,
        amount: formatConfig.format(json["amount"]) ?? r'$0',
        installments: json["installments"].toString() ?? '0',
        requestDate: json["requestDate"] ?? null,
        quantity: json["quantity"]?.toString() ?? '0',
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "partnerName": partnerName,
        "amount": amount,
        "installments": installments,
        "requestDate": requestDate,
        "quantity": quantity,
      };
}

class MyRequest {
  MyRequest({
    this.sharesRequest,
    this.creditRequest,
    this.paymentInstallmentRequest,
  });
  List<Request> sharesRequest;
  List<Request> creditRequest;
  List<Request> paymentInstallmentRequest;
  factory MyRequest.fromJson(Map<String, dynamic> json) => MyRequest(
        sharesRequest: List<Request>.from(
                json["sharesRequest"].map((x) => Request.fromJson(x))) ??
            new List<Request>(),
        creditRequest: List<Request>.from(
                json["creditRequest"].map((x) => Request.fromJson(x))) ??
            new List<Request>(),
        paymentInstallmentRequest: List<Request>.from(
                json["paymentInstallmentRequest"]
                    .map((x) => Request.fromJson(x))) ??
            new List<Request>(),
      );
  Map<String, dynamic> toJson() => {
        "sharesRequest":
            List<dynamic>.from(sharesRequest.map((x) => x.toJson())),
        "creditRequest":
            List<dynamic>.from(creditRequest.map((x) => x.toJson())),
        "paymentInstallmentRequest": List<dynamic>.from(
            paymentInstallmentRequest.map((x) => x.toJson())),
      };
}
