import 'dart:io';

import 'package:bkapp_flutter/core/services/api/custom_exceptions.dart';
import 'package:bkapp_flutter/core/services/api/responses.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio httpClient;

  ApiProvider({@required this.httpClient}) : assert(httpClient != null);

  ApiProvider.test({@required this.httpClient});

  Future<Map<String, dynamic>> getTokenLogin(
      String username, String password) async {
    var getToken;
    try {
      final loginUrl = ApiEndpoints.login();
      final loginResponse = await this
          .httpClient
          .post(loginUrl, data: {"username": username, "password": password});
      getToken = ApiResponses.apiResponse(loginResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }

    return getToken;
  }
}
