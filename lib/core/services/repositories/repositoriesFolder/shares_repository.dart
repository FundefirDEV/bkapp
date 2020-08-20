import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ShareRepository {
  final ApiProvider apiProvider;

  ShareRepository({@required this.apiProvider}) : assert(apiProvider != null);

  ShareRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> postMyShares(
      {@required String typeRequest,
      @required int quantity,
      @required double amount,
      @required String token}) async {
    final Map getMyShareResponse =
        await apiProvider.postMyShares(typeRequest, quantity, amount, token);
    return getMyShareResponse;
  }
}
