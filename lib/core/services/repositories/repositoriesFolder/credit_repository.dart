import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class CreditRepository {
  final ApiProvider apiProvider;

  CreditRepository({@required this.apiProvider}) : assert(apiProvider != null);

  CreditRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> postCreditRequest(
      String token, Map bodyCredit) async {
    final Map creditRequest =
        await apiProvider.postCreditRequest(token, bodyCredit);
    return creditRequest;
  }

  Future<Map<String, dynamic>> postInstallmentPaid(
      String token, Map<String, dynamic> bodyRequest) async {
    final Map installmentRequest =
        await apiProvider.postInstallmentPayment(token, bodyRequest);
    return installmentRequest;
  }
}
