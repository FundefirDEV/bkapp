import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class AdminCreateBankRepository {
  final ApiProvider apiProvider;
  AdminCreateBankRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  Future<Map<String, dynamic>> adminCreateBank(
    String token,
  ) async {
    final Map profitPayment = await apiProvider.adminCreateBank(token: token);
    return profitPayment;
  }
}
