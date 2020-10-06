// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

// TimeLineShares.fromJson(data);

String timeLineSharesToJson(TimeLineShares data) => json.encode(data.toJson());

class TimeLineShares {
  TimeLineShares({
    this.totalShares,
    this.shares,
  });

  String totalShares;
  List<Date> shares;

  factory TimeLineShares.fromJson(Map<String, dynamic> json) => TimeLineShares(
        totalShares: json["totalShares"]?.toString() ?? '0',
        shares: List<Date>.from(json["shares"].map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalShares": totalShares,
        "shares": List<dynamic>.from(shares.map((x) => x.toJson())),
      };
}

class Date {
  Date({
    this.date,
    this.quantity,
  });

  String date;
  String quantity;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateFormat("MMM dd, yyyy")
                .format(DateTime.parse(json["date"]))
                .toString() ??
            '',
        quantity: json["quantity"]?.toString() ?? '0',
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "quantity": quantity,
      };
}
