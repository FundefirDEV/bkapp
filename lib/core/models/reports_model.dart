import 'dart:convert';

import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

ReportsModel reportsModelFromJson(Map<String, dynamic> data) =>
    ReportsModel.fromJson(data);

String reportsModelToJson(ReportsModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: r'$');

final numberConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: '');

class ReportsModel {
  ReportsModel({
    this.badDebtReserve,
    this.expenseFund,
    this.totalQuantityShares,
    this.totalAmountShares,
    this.totalAmountEarning,
    this.shares,
    this.creditsInfo,
    this.earnings,
  });

  final double badDebtReserve;
  final double expenseFund;
  final double totalQuantityShares;
  final double totalAmountShares;
  final double totalAmountEarning;
  final ReportShares shares;
  final ReportCredit creditsInfo;
  final ReportEarning earnings;

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    badDebtReserve: json["badDebtReserve"] ?? null,
    expenseFund: json["expenseFund"] ?? null,
    totalQuantityShares: json["totalQuantityShares"] ?? null,
    totalAmountShares: json["totalAmountShares"] ?? null,
    totalAmountEarning: json["totalAmountEarning"] ?? null,
    shares: ReportShares.fromJson(json["shares"]) ?? null,
    creditsInfo: ReportCredit.fromJson(json["creditsInfo"]) ?? null,
    earnings: ReportEarning.fromJson(json["earnings"]) ?? null,
  );

  Map<String, dynamic> toJson() => {
    "badDebtReserve": badDebtReserve,
    "expenseFund": expenseFund,
    "totalQuantityShares": totalQuantityShares,
    "totalAmountShares": totalAmountShares,
    "creditsInfo": creditsInfo,
    "shares": shares,
    "earnings": earnings,
  };

  static String formatNumber(String num){
    return UtilsTools.formatConfig(decimalDigits: 2).format(double.tryParse(num));
  }

  List<Map<String , String>> sharePartnerList(){
    final List<Map<String , String>> dataList = [];
    shares.sharesPerPartner.forEach((element) { 
      dataList.add({
        "gender": element.gender, 
        "name": element.partner, 
        "detailValue1": element.amount.toString(),
        "detailValue2": element.quantity.toString()
        }
      );
    });
    return dataList;
  }

  List<FlSpot> makeShareFlSpot(){
    final List<FlSpot>  dataList = [FlSpot(0.0 , 0.0)];
    shares.totalSharesPerMeeting.asMap().forEach((index, value) { 
      dataList.add(FlSpot(index.toDouble() + 1 , value.toDouble()));
    });
    return dataList;
  } 

  List<Map<String , String>> creditsPartnerList(){

    final List<Map<String , String>> dataList = [];
    creditsInfo.activesCredits.forEach((element) { 
      dataList.add({
        "gender": element.gender, 
        "name": element.partner, 
        "detailValue1": element.amount.toString(),
        "detailValue2": element.approvalDate.toString()
        }
      );
    });
    return dataList;
  }

  List<FlSpot> makeCreditFlSpot(){
    final List<FlSpot> dataList = [FlSpot(0.0 , 0.0)];
    creditsInfo.totalCreditsPerMeeting.asMap().forEach((index, value) { 
      dataList.add(FlSpot(index.toDouble() + 1 , value.toDouble()));
    });
    return dataList;
  }  

  List<Map<String , String>> instalmentPartnerList(){
    final List<Map<String , String>> dataList = [];
    creditsInfo.activesCredits.forEach((element) { 
      dataList.add({
        "gender": element.gender, 
        "name": element.partner, 
        "detailValue1": element.currentDebt.toString(),
        "detailValue2": '',
        }
      );
    });
    return dataList;
  }

  List<FlSpot> makeInstallmentFlSpot(){
    final List<FlSpot>  dataList = [FlSpot(0.0 , 0.0)];
    creditsInfo.totalCapitalPayPerMeeting.asMap().forEach((index, value) { 
      dataList.add(FlSpot(index.toDouble() + 1 , value.toDouble()));
    });
    return dataList;
  }  

  List<Map<String , String>> earningPartnerList(){
    final List<Map<String , String>> dataList = [];
    earnings.earningPerPartner.forEach((element) { 
      dataList.add({
        "gender": element.gender, 
        "name": element.partner, 
        "detailValue1": element.earning.toString(),
        "detailValue2":'',
        }
      );
    });
    return dataList;
  }

  List<FlSpot> makeEarningFlSpot(){
    final List<FlSpot>  dataList = [FlSpot(0.0 , 0.0)];
    earnings.earningsBySharePerMeeting.asMap().forEach((index, value) { 
      dataList.add(FlSpot(index.toDouble() + 1 , value.toDouble()));
    });
    return dataList;
  }  
}


ReportShares reportsSharesFromJson(Map<String, dynamic> data) =>
    ReportShares.fromJson(data);

String reportsSharesToJson(ReportShares data) => json.encode(data.toJson());
class ReportShares{

  ReportShares({
    this.totalSharesPerMeeting,
    this.sharesPerPartner,
  });
  
  final List<int> totalSharesPerMeeting;
  final List<SharesPerPartner> sharesPerPartner;

   factory ReportShares.fromJson(Map<String, dynamic> json) => ReportShares(
        totalSharesPerMeeting: List<int>.from(json["totalSharesPerMeeting"]) ?? null,
        sharesPerPartner: List<SharesPerPartner>.from(
                json["sharesPerPartner"].map((x) => SharesPerPartner.fromJson(x))) ?? null,
      );

  Map<String, dynamic> toJson() => {
    "totalSharesPerMeeting": totalSharesPerMeeting,
    "sharesPerPartner": List<dynamic>.from(sharesPerPartner.map((x) => x.toJson())),
  };

}

SharesPerPartner reportsSharesPerPartnerFromJson(Map<String, dynamic> data) =>
    SharesPerPartner.fromJson(data);

String reportsSharesPerPartnerToJson(SharesPerPartner data) => json.encode(data.toJson());

class SharesPerPartner{

  SharesPerPartner({
    this.partner,
    this.amount,
    this.quantity,
    this.gender,
  });
    
  final String partner;
  final String gender;
  final double amount;
  final int quantity;

    factory SharesPerPartner.fromJson(Map<String, dynamic> json) => SharesPerPartner(
      partner: json["partner"] ?? '',
      amount: json["amount"] ?? null,
      quantity: json["quantity"] ?? null,
      gender: json["gender"] ?? null,
    );

  Map<String, dynamic> toJson() => {
    "partner": partner,
    "amount": amount,
    "quantity": quantity,
    "gender" : gender,
  };
}


ReportEarning reportEarningFromJson(Map<String, dynamic> data) =>
    ReportEarning.fromJson(data);

String reportEarningToJson(ReportEarning data) => json.encode(data.toJson());

class ReportEarning{
 ReportEarning({
    this.earningsBySharePerMeeting,
    this.totalEarningPerMeeting,
    this.earningPerPartner,
  });
  
  final List<double> earningsBySharePerMeeting;
  final List<double> totalEarningPerMeeting;
  final List<EarningPerPartner> earningPerPartner;

   factory ReportEarning.fromJson(Map<String, dynamic> json) => ReportEarning(
    earningsBySharePerMeeting: List<double>.from(json["earningsBySharePerMeeting"]) ?? null,
    totalEarningPerMeeting: List<double>.from(json["totalEarningPerMeeting"]) ?? null,
    earningPerPartner: List<EarningPerPartner>.from(
                json["earningPerPartner"].map((x) => EarningPerPartner.fromJson(x))) ?? null,
  );

    Map<String, dynamic> toJson() => {
    "earningsBySharePerMeeting": earningsBySharePerMeeting,
    "totalEarningPerMeeting": totalEarningPerMeeting,
    "earningPerPartner": List<dynamic>.from(earningPerPartner.map((x) => x.toJson())),
  };
}

EarningPerPartner reportEarningPerPartnerFromJson(Map<String, dynamic> data) =>
    EarningPerPartner.fromJson(data);

String reportEarningPerPartnerToJson(EarningPerPartner data) => json.encode(data.toJson());

class EarningPerPartner{

  EarningPerPartner({
    this.partner,
    this.earning,
    this.gender,

  });

  final String partner;
  final double earning;
  final String gender;

   factory EarningPerPartner.fromJson(Map<String, dynamic> json) => EarningPerPartner(
    partner: json["partner"] ?? null,
    earning: json["earning"] ?? null,
    gender: json["gender"] ?? null,

  );

    Map<String, dynamic> toJson() => {
    "partner": partner,
    "earning": earning,
    "gender" : gender,
  };
}

ReportCredit reportCreditsFromJson(Map<String, dynamic> data) =>
    ReportCredit.fromJson(data);

String reportCreditsToJson(ReportCredit data) => json.encode(data.toJson());
class ReportCredit{

  ReportCredit({

    this.activesCredits,
    this.totalAmountCredit,
    this.totalCapitalPayPerMeeting,
    this.totalCreditsPerMeeting,
    this.totalCurrentDebt,
    this.totalInterestPayPerMeeting,
    this.totalPayedValue,
  });
  
  final List<double> totalCreditsPerMeeting;
  final List<double> totalCapitalPayPerMeeting;
  final List<double> totalInterestPayPerMeeting;

  final double totalAmountCredit;
  final double totalPayedValue;
  final double totalCurrentDebt;

  final List<ActivesCredits> activesCredits;

  factory ReportCredit.fromJson(Map<String, dynamic> json) => ReportCredit(
    totalCreditsPerMeeting:List<double>.from(json["totalCreditsPerMeeting"]) ?? null,
    totalCapitalPayPerMeeting: List<double>.from(json["totalCapitalPayPerMeeting"]) ?? null,
    totalInterestPayPerMeeting: List<double>.from(json["totalInterestPayPerMeeting"]) ?? null,
    totalAmountCredit: json["totalAmountCredit"] ?? null,
    totalPayedValue: json["totalPayedValue"] ?? null,
    totalCurrentDebt: json["totalCurrentDebt"] ?? null,
    activesCredits: List<ActivesCredits>.from(
                json["activesCredits"].map((x) => ActivesCredits.fromJson(x))) ?? null,
  );

    Map<String, dynamic> toJson() => {
    "totalCreditsPerMeeting": totalCreditsPerMeeting,
    "totalCapitalPayPerMeeting": totalCapitalPayPerMeeting,
    "totalInterestPayPerMeeting": totalInterestPayPerMeeting,
    "totalAmountCredit": totalAmountCredit,
    "totalPayedValue": totalPayedValue,
    "totalCurrentDebt": totalCurrentDebt,
    "activesCredits": List<dynamic>.from(activesCredits.map((x) => x.toJson())),
  };
}

ActivesCredits reportActivesCreditsFromJson(Map<String, dynamic> data) =>
    ActivesCredits.fromJson(data);

String reportActivesCreditsToJson(ActivesCredits data) => json.encode(data.toJson());

class ActivesCredits{

  ActivesCredits({
    this.partner,
    this.amount,
    this.approvalDate,
    this.currentDebt,
    this.payedValue,
    this.gender,
  });
  
  final String partner;
  final double amount;
  final double payedValue;
  final double currentDebt;
  final String gender;
  final String approvalDate;

    factory ActivesCredits.fromJson(Map<String, dynamic> json) => ActivesCredits(
    partner: json["partner"] ?? null,
    amount: json["amount"] ?? null,
    payedValue: json["payedValue"] ?? null,
    currentDebt: json["currentDebt"] ?? null,
    gender: json["gender"] ?? null,
    approvalDate: DateFormat.yMMMd().format(DateTime.parse(json["approvalDate"])) ?? null,  
  );

    Map<String, dynamic> toJson() => {
    "partner": partner,
    "earning": amount,
    "payedValue": payedValue,
    "currentDebt": currentDebt,
    "approvalDate": approvalDate,
    "gender" : gender,
  };
}

