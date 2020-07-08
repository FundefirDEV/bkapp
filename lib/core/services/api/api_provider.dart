import 'dart:io';

import 'package:bkapp_flutter/core/services/api/custom_exceptions.dart';
import 'package:bkapp_flutter/core/services/api/responses.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  String baseUrl;
  final Dio httpClient;

  ApiProvider({@required this.httpClient}) : assert(httpClient != null) {
    baseUrl = EnvironmentConfig.API_URL;
  }

  ApiProvider.test({@required this.httpClient});

  Future<Map<String, dynamic>> getTokenLogin(
      String username, String password) async {
    var getToken;
    baseUrl = EnvironmentConfig.API_URL_MOCK;
    try {
      final loginUrl = '$baseUrl/login';
      final loginResponse = await this
          .httpClient
          .post(loginUrl, data: {"username": username, "password": password});
      getToken = ApiResponses.apiResponse(loginResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return getToken;
  }
}
