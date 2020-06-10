import 'dart:io';

import 'package:bkapp_flutter/core/services/api/custom_exceptions.dart';
import 'package:bkapp_flutter/core/services/api/responses.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  static const String baseUrl = 'https://virtserver.swaggerhub.com/jairoFg12/bk_service/0.0.1/v3';
  final Dio httpClient;

  ApiProvider({
    @required this.httpClient
  }) : assert(httpClient != null);

  ApiProvider.test({@required this.httpClient});

  Future<Map<String, dynamic>> getTokenLogin(
    String username,
    String password
  ) async {
    var getToken;
    try {
      final loginUrl = '$baseUrl/login';
      final loginResponse = await this.httpClient.post(
        loginUrl,
        data: {
          "username": username,
          "password": password
        }
      );
      getToken = ApiResponses.apiResponse(loginResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return getToken;
  }
}
