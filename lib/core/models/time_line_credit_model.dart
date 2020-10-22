import 'dart:convert';
import 'package:intl/intl.dart';

TimeLineCreditModel timeLineCreditModelFromJson(String str) =>
    TimeLineCreditModel.fromJson(json.decode(str));

String timeLineCreditModelToJson(TimeLineCreditModel data) =>
    json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');

class TimeLineCreditModel {
  TimeLineCreditModel({
    this.total,
    this.credits,
  });

  String total;
  List<Credit> credits;

  factory TimeLineCreditModel.fromJson(Map<String, dynamic> json) =>
      TimeLineCreditModel(
        total: json["total"].toString() ?? '0',
        credits:
            List<Credit>.from(json["credits"].map((x) => Credit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "credits": List<dynamic>.from(credits.map((x) => x.toJson())),
      };
}

class Credit {
  Credit({
    this.amount,
    this.approvalDate,
    this.isActive,
  });

  String amount;
  String approvalDate;
  bool isActive;

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        amount: formatConfig.format(json["amount"]) ?? r'$0',
        approvalDate: DateFormat("MMM dd, yyyy")
                .format(DateTime.parse(json["approvalDate"]))
                .toString() ??
            '',
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "approvalDate": approvalDate.toString(),
        "isActive": isActive,
      };
}
