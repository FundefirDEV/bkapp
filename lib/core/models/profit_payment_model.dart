import 'package:bkapp_flutter/src/utils/utils.dart';

class ProfitPartnerModel {
  ProfitPartnerModel({
    this.profitDetail, 
    this.accumulableEarnings, 
    this.earningPerMonthModel
  });
  final String accumulableEarnings;
  List<ProfitPartnerDetailModel> profitDetail;
  final List<EarningPerMonthModel> earningPerMonthModel;

  factory ProfitPartnerModel.fromJson(Map<String, dynamic> json) => ProfitPartnerModel(
    accumulableEarnings: json["totalEarning"].toString() ?? [],
    earningPerMonthModel: List<EarningPerMonthModel>.from(
      json["earningPerMonth"].map((x) => EarningPerMonthModel.fromJson(x))) ?? [],
  );

  Map<String, dynamic> toJson() => {
    "accumulableEarnings": accumulableEarnings,
    "earningPerMonthModel": List<dynamic>
      .from(earningPerMonthModel.map((x) => x.toJson())),
  };

  List<ProfitPartnerDetailModel> makeProfitDetail(){
    
  }
}

class EarningPerMonthModel {
  EarningPerMonthModel({this.year, this.dataEarningPerMonth});
  final String year;
  final List<DataEarningPerMonth> dataEarningPerMonth;

  factory EarningPerMonthModel.fromJson(Map<String, dynamic> json) => EarningPerMonthModel(
    year: json["year"].toString() ?? null,
    dataEarningPerMonth: List<DataEarningPerMonth>.from(
      json["dataEarningPerMonth"].map((x) => DataEarningPerMonth.fromJson(x))) ?? [],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "dataEarningPerMonth": List<dynamic>
      .from(dataEarningPerMonth.map((x) => x.toJson())),
  };
}

class DataEarningPerMonth{
  DataEarningPerMonth(
    {this.month,
    this.year,
    this.amount,
    this.isPaid}
  );

  final String month;
  final String year;
  final String amount; 
  final bool isPaid;

  factory DataEarningPerMonth.fromJson(Map<String, dynamic> json) => DataEarningPerMonth(
    year: json["year"].toString() ?? null,
    month: UtilsTools.getMounthWithNumber(json["month"])  ?? null,
    amount: json["amount"].toString() ?? null,
    isPaid: json["isPaid"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "month": month,
    "amount": amount,
    "isPaid": isPaid,
  };
}

class ProfitPartnerDetailModel {
  ProfitPartnerDetailModel({this.month, this.earningsMonth, this.detail});
  final String month;
  final String earningsMonth;
  final List<YearProfitPayment> detail;
}

class YearProfitPayment {
  YearProfitPayment({this.year, this.earning, this.pay = false});
  final String year;
  final String earning;
  final bool pay;
}
