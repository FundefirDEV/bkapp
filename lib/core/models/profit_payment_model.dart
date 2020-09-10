class ProfitPartnerModel {
  ProfitPartnerModel({this.profitDetail, this.accumulableEarnings});
  final String accumulableEarnings;
  final List<ProfitPartnerDetailModel> profitDetail;
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
