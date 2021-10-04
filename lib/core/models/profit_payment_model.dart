import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:intl/intl.dart';

class ProfitPartnerModel {
  ProfitPartnerModel({
    this.accumulableEarnings, 
    this.earningPerMonthModel
  });
    
  final String accumulableEarnings;
  get profitDetail => _makeProfitDetail();
  final List<EarningPerMonthModel> earningPerMonthModel;

  factory ProfitPartnerModel.fromJson(Map<String, dynamic> json) => ProfitPartnerModel(
    accumulableEarnings: UtilsTools.formatTwoDecimals().format((json["totalEarning"])) ?? null,
    earningPerMonthModel: List<EarningPerMonthModel>.from(
      json["earningPerYear"].map((x) => EarningPerMonthModel.fromJson(x))) ?? [],
  );

  Map<String, dynamic> toJson() => {
    "accumulableEarnings": accumulableEarnings,
    "earningPerMonthModel": List<dynamic>
      .from(earningPerMonthModel.map((x) => x.toJson())),
  };

  List<ProfitPartnerDetailModel> _makeProfitDetail(){

    final List<ProfitPartnerDetailModel> _profitDetail = [];
    
    final List<DataEarningPerMonth> allEarning = [];

    earningPerMonthModel.forEach((earning) { 
      allEarning.addAll(earning.dataEarningPerMonth);
    });

    final monthMap =
      groupBy(allEarning, (allEarning) => allEarning.month).map((k, v) => 
        MapEntry( k, v.map((item) {
          return item;
      }).toList()));

    print(monthMap);

    monthMap.forEach((month, detailList) {

      final totalEarning = 
        detailList.fold(0, (pre, value) => pre + value.earning) as double;

      _profitDetail.add(
        ProfitPartnerDetailModel(
          month: month.toString(),
          earningsMonth: totalEarning.toString(),
          detail: detailList
        )
      );
    });

    return _profitDetail;
  }
}

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
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
    this.earning,
    this.isPaid = false,
    this.earningShareIds}
  );

  final String month;
  final String year;
  double earning; 
  final bool isPaid;
  final List<int> earningShareIds;


  final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: r'$');

  get getEarning => formatConfig.format(earning);


  factory DataEarningPerMonth.fromJson(Map<String, dynamic> json) => DataEarningPerMonth(
    year: json["year"].toString() ?? null,
    month: UtilsTools.getMounthWithNumber(json["month"])  ?? [],
    earning: json["amount"] as double ?? null,
    isPaid: json["isPaid"] ?? null,
    earningShareIds: List<int>.from(
      json["earningShareIds"]) ?? []
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "month": month,
    "amount": earning,
    "isPaid": isPaid,
    "earningShareIds": earningShareIds,
  };
}

class ProfitPartnerDetailModel {
  ProfitPartnerDetailModel({this.month, this.earningsMonth, this.detail});
  final String month;
  final String earningsMonth;
  final List<DataEarningPerMonth> detail;


  final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: r'$');


  get getEarningsMonth => formatConfig.format(double.tryParse(earningsMonth));
}
