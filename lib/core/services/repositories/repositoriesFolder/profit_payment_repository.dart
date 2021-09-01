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

  Future<List<dynamic>> getPartners(String token) async {
    final List<dynamic> partners = await apiProvider.getPartners(token);
    return partners;
  }
}
