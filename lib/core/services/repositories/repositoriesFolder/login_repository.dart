import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class LoginRepository {
  final ApiProvider apiProvider;

  LoginRepository({
    @required this.apiProvider
  }) : assert(apiProvider != null);

  Future<Map<String, dynamic>> postLogin({
    @required String username,
    @required String password
  }) async {
    final Map getToken = await apiProvider.getTokenLogin(
      username,
      password
    );
    return getToken;
  }
}
