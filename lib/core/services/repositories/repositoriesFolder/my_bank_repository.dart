import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class MyBankRepository {
  final ApiProvider apiProvider;

  MyBankRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  Future<Map<String, dynamic>> getMyBankInfo(String token) async {
    final Map getMyBankInfo = await apiProvider.getMyBankInfo(token);
    return getMyBankInfo;
  }
}
