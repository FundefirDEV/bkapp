import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class ProfitPaymentRepository {
  final ApiProvider apiProvider;
  ProfitPaymentRepository({@required this.apiProvider})
      : assert(apiProvider != null);
  ProfitPaymentRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getProfitPayment(String token , String partnerId) async {
    final Map profitPayment = await apiProvider.profitPayment(token: token, partnerId: partnerId);
    return profitPayment;
  }

  postProfitPayment({
      @required String token , 
      @required String partnerId,
      @required List<int> earningShareIds
    }
    ) async {
    final Map profitPayment = await apiProvider.postProfitPayment(
      token: token, partnerId: partnerId,
      earningShareIds: earningShareIds,
    );
    return profitPayment;
  }

  Future convertShares({
      @required String token , 
      @required String partnerId,
      @required List<int> earningShareIds,
      @required int quantity,
    }
    ) async {
    final Map profitPayment = await apiProvider.convertShares(
      token: token, partnerId: partnerId,
      earningShareIds: earningShareIds,
      quantity: quantity,
    );
    return profitPayment;
  }


  getPartners(String token) async {
    final Map<String, dynamic> partners = await apiProvider.profitPaymentGetPartners(token);
    return partners;
  }

  getShareValue(String token) async {
    final Map<String, dynamic> rules = await apiProvider.getBankRules(token);
    return rules['shareValue'];
  }
}
