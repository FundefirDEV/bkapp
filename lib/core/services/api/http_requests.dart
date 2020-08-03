import 'dart:convert';
import 'dart:io';

import 'package:bkapp_flutter/core/services/api/responses.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

import 'package:alice/alice.dart';
import 'package:alice/core/alice_http_extensions.dart';

import 'custom_exceptions.dart';

Alice alice = Alice(
  showNotification: true,
  navigatorKey: navigationKey
);

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class HttpRequests {

  Future<dynamic> post({
    @required http.Client httpClient,
    @required String url,
    dynamic body
  }) async {
    var response;
    try {
      final loginResponse = await httpClient.post(
        url,
        body: jsonEncode(body),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
      ).interceptWithAlice(alice, body: body);
      response = ApiResponses.apiResponse(loginResponse);
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }
    return response;
  }

  Future<dynamic> get({
    @required String url,
    @required http.Client httpClient
  }) async {
    var response;
    try {
      final loginResponse = await httpClient.get(
        url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
      ).interceptWithAlice(alice);
      response = ApiResponses.apiResponse(loginResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    } finally {
      httpClient.close();
    }
    return response;
  }
}
