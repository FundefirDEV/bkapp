// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TimeLineShares timeLineFromJson(Map<String, dynamic> data) =>
    TimeLineShares.fromJson(data);

String welcomeToJson(TimeLineShares data) => json.encode(data.toJson());

class TimeLineShares {
  TimeLineShares({
    this.shares,
    this.dates,
  });

  String shares;
  List<Date> dates;

  factory TimeLineShares.fromJson(Map<String, dynamic> json) => TimeLineShares(
        shares: json["shares"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shares": shares,
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
      };
}

class Date {
  Date({
    this.date,
    this.shares,
  });

  String date;
  String shares;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"],
        shares: json["shares"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "shares": shares,
      };
}
