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

  Future<Map<String, dynamic>> postValidationCode(
      String phone, String email) async {
    var response;
    try {
      final validationCodeUrl = ApiEndpoints.validationCode();
      final validationCodeResponse = await this
          .httpClient
          .post(validationCodeUrl, data: {"phone": phone, "email": email});
      response = ApiResponses.apiResponse(validationCodeResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }

    return response;
  }

  Future<Map<String, dynamic>> postValidationCodeConfirm(
      String code, String phone, String email) async {
    var response;
    try {
      final validationCodeConfirmUrl = ApiEndpoints.validationConfirmCode();
      final validationCodeConfirmResponse = await this.httpClient.post(
          validationCodeConfirmUrl,
          data: {"code": code, "phone": phone, "email": email});
      response = ApiResponses.apiResponse(validationCodeConfirmResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }

    return response;
  }

  Future<Map<String, dynamic>> getApprovals() async {
    var response;
    try {
      final getApprovals = ApiEndpoints.getApprovals();
      final getApprovalsResponse = await this.httpClient.get(getApprovals);
      response = ApiResponses.apiResponse(getApprovalsResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on NotFoundException {
      throw FetchDataException('Endpoint not exists');
    }

    return response;
  }
}
