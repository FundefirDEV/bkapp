import 'dart:convert';

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

  final badDebtReserve;
  final expenseFund;
  final totalQuantityShares;
  final totalAmountShares;
  final totalAmountEarning;
  final shares;
  final creditsInfo;
  final earnings;

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
        badDebtReserve: json["badDebtReserve"] ?? null,
        expenseFund: json["expenseFund"] ?? null,
        totalQuantityShares: json["totalQuantityShares"] ?? null,
        totalAmountShares: json["totalAmountShares"] ?? null,
        shares: json["shares"] ?? null,
        creditsInfo: json["creditsInfo"] ?? null,
        earnings: json["earnings"] ?? null,
        // earnings: json["earnings"] != null
        //     ? formatConfig.format(json["earnings"])
        //     : "r\0",
        // activeCredit: json["activeCredit"] != null
        //     ? formatConfig.format(json["activeCredit"])
        //     : "r\0",
        // shares: json["shares"] != null
        //     ? numberConfig.format(json["shares"])
        //     : "r\0",
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
}

class ReportShares{

  ReportShares({
    this.totalSharesPerMeeting,
    this.sharesPerPartner,
  });
  
  final List<int> totalSharesPerMeeting;
  final List<SharesPerPartner> sharesPerPartner;

}

class SharesPerPartner{

  SharesPerPartner({
    this.partner,
    this.amount,
    this.quantity,
  });
  
  final String partner;
  final double amount;
  final int quantity;

}

class ReportEarning{
 ReportEarning({
    this.earningsBySharePerMeeting,
    this.totalEarningPerMeeting,
    this.totalearningsPerMeeting,
  });
  
  final List<double> earningsBySharePerMeeting;
  final List<double> totalEarningPerMeeting;

  final List<EarningPerPartner> totalearningsPerMeeting;
}

class EarningPerPartner{

  EarningPerPartner({
    this.partner,
    this.earning,
  });
  
  final String partner;
  final double earning;

}


class ReportCredit{

  ReportCredit({

    this.totalearningsPerMeeting,
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

  final List<EarningPerPartner> totalearningsPerMeeting;
}


class CreditsPerPartner{

  CreditsPerPartner({
    this.partner,
    this.earning,
    this.approvalDate,
    this.currentDebt,
    this.payedValue,
  });
  
  final String partner;
  final double earning;
  final double payedValue;
  final double currentDebt;
  final String approvalDate;
}

