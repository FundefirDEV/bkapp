import 'dart:convert';
import 'dart:io';

import 'package:bkapp_flutter/core/services/api/responses.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

import 'package:alice/alice.dart';
import 'package:alice/core/alice_http_extensions.dart';

import 'custom_exceptions.dart';

Alice alice = Alice(
    showNotification:
        EnvironmentConfig.ENV == 'QA' || EnvironmentConfig.ENV == 'DEV'
            ? true
            : false,
    navigatorKey: navigationKey);

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class HttpRequests {
  Future<dynamic> post(
      {@required http.Client httpClient,
      @required String url,
      dynamic body,
      String token}) async {
    var response;
    try {
      final request =
          await httpClient.post( Uri.parse(url), body: jsonEncode(body), headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": 'Bearer $token',
      }).interceptWithAlice(alice, body: body);
      response = ApiResponses.apiResponse(request);
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }
    return response;
  }

  Future<dynamic> get(
      {@required http.Client httpClient,
      @required String url,
      String token,
      String param}) async {
    var response;
    try {
      final request =
          await httpClient.get(param != null ? Uri.parse('$url/$param') : Uri.parse(url), headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": 'Bearer $token',
      }).interceptWithAlice(alice);
      response = ApiResponses.apiResponse(request);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }
    return response;
  }
}
