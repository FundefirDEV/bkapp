import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class LoginRepository {
  final ApiProvider apiProvider;

  LoginRepository({
    @required this.apiProvider
  }) : assert(apiProvider != null);

  LoginRepository.test({@required this.apiProvider});

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

  Future<void> deleteToken() async {
    //TODO delete from keystore/keychain
  }

  Future<void> persistToken() async {
    //TODO write to keystore/keychain
  }

  Future<bool> hasToken({bool token = false}) async {
    //TODO read from keystore/keychain
    return token;
  }
}
