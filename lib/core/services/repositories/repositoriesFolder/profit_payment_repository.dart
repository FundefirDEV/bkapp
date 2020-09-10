import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class ProfitPaymentRepository {
  final ApiProvider apiProvider;
  ProfitPaymentRepository({@required this.apiProvider})
      : assert(apiProvider != null);
  ProfitPaymentRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getProfitPayment(String token) async {
    final Map profitPayment = {'hola': 'hola'};
    return profitPayment;
  }
}
