import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class CreditRepository {
  final ApiProvider apiProvider;

  CreditRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  CreditRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> postCreditRequest(
    String token, Map bodyCredit
  ) async {
    final Map creditRequest = await apiProvider.postCreditRequest(
      token,
      bodyCredit
    );
    return creditRequest;
  }
}
