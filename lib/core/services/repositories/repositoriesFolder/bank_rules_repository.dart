import 'package:bkapp_flutter/core/models/bank_rules_model%20copy.dart';
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

  changeRules(AddBankRules bankRules , String token) async {
    final resChangeRules = await apiProvider.changeRules(bankRules: bankRules, token: token);
    return resChangeRules;
  }
}
