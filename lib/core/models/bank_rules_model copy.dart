import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

AddBankRules bankRulesFromJson(Map<String, dynamic> data) =>
    AddBankRules.fromJson(data);

String bankRulesToJson(AddBankRules data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$');


class AddBankRules {
  AddBankRules({
    @required this.ordinaryInterestPercentage,//
    @required this.defaultRatePercentage,//
    @required this.creditMaxInstallments,//
    @required this.creditMaxValue,//
    @required this.shareValue,//
    @required this.expenseFundPercentage,//
    @required this.badDebtReservePercentage,//
    @required this.maxPercentageShareByPartner,//
    @required this.maxActiveCreditsByPartner,//
    @required this.maxCreditFactor,//
    @required this.defaultInstallmentsPeriodDays,
  });

  factory AddBankRules.fromJson(Map<String, dynamic> json) => AddBankRules( 
    ordinaryInterestPercentage : json['ordinaryInterestPercentage'] as double,
    defaultRatePercentage : json['defaultRatePercentage'] as double,
    creditMaxInstallments : json['creditMaxInstallments'] as int,
    creditMaxValue : json['creditMaxValue'] as double,
    shareValue : json['shareValue'] as double,
    expenseFundPercentage : json['expenseFundPercentage'] as double,
    badDebtReservePercentage : json['badDebtReservePercentage'] as double,
    maxPercentageShareByPartner :
        json['maxPercentageShareByPartner'] as double,
    maxActiveCreditsByPartner : json['maxActiveCreditsByPartner'] as int,
    maxCreditFactor : json['maxCreditFactor'] as int,
    defaultInstallmentsPeriodDays :
        json['defaultInstallmentsPeriodDays'] as int
  );

  double ordinaryInterestPercentage;
  double defaultRatePercentage;
  int creditMaxInstallments;
  double creditMaxValue;
  double shareValue;
  double expenseFundPercentage;
  double badDebtReservePercentage;
  double maxPercentageShareByPartner;
  int maxActiveCreditsByPartner;
  int maxCreditFactor;
  int defaultInstallmentsPeriodDays;

  Map<String, dynamic> toJson() {
    return {
      'ordinaryInterestPercentage': ordinaryInterestPercentage,
      'defaultRatePercentage': defaultRatePercentage,
      'creditMaxInstallments': creditMaxInstallments,
      'creditMaxValue': creditMaxValue,
      'shareValue': shareValue,
      'expenseFundPercentage': expenseFundPercentage,
      'badDebtReservePercentage': badDebtReservePercentage,
      'maxPercentageShareByPartner': maxPercentageShareByPartner,
      'maxActiveCreditsByPartner': maxActiveCreditsByPartner,
      'maxCreditFactor': maxCreditFactor,
      'defaultInstallmentsPeriodDays': defaultInstallmentsPeriodDays,
    };
  }
}
