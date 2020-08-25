import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class BankRulesRepository {
  final ApiProvider apiProvider;

  BankRulesRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  BankRulesRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getBankRules(String token) async {
    final Map getBankRules = await apiProvider.getBankRules(token);
    return getBankRules;
  }
}
