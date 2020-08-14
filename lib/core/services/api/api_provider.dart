import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'http_requests.dart';

class ApiProvider {
  http.Client httpClient;
  HttpRequests _httpRequest = HttpRequests();

  ApiProvider({@required this.httpClient}) : assert(httpClient != null);

// Request: POST
  Future<Map<String, dynamic>> getTokenLogin(
      String username, String password) async {
    final loginUrl = ApiEndpoints.login();
    final loginResponse = await _httpRequest.post(
        httpClient: httpClient,
        url: loginUrl,
        body: {"username": username, "password": password});
    return loginResponse;
  }

  Future<Map<String, dynamic>> postValidationCode(
      String phone, String email) async {
    final validationCodeUrl = ApiEndpoints.validationCode();
    final validationCodeResponse = await _httpRequest.post(
        httpClient: httpClient,
        url: validationCodeUrl,
        body: {"phone": phone, "email": email});
    return validationCodeResponse;
  }

  Future<Map<String, dynamic>> postValidationCodeConfirm(
      String code, String phone, String email) async {
    final validationCodeConfirmUrl = ApiEndpoints.validationConfirmCode();
    final validationCodeConfirmResponse = await _httpRequest.post(
        httpClient: httpClient,
        url: validationCodeConfirmUrl,
        body: {"code": code, "phone": phone, "email": email});
    return validationCodeConfirmResponse;
  }

  Future<Map<String, dynamic>> postRegisterUser(PartnerModel data) async {
    final postRegisterUser = ApiEndpoints.postRegisterUser();
    final validationCodeConfirmResponse = await _httpRequest
        .post(httpClient: httpClient, url: postRegisterUser, body: {
      "firstname": data.firstname,
      "lastname": data.lastname,
      "gender": data.gender,
      "country": data.country,
      "phone": data.phone,
      "email": data.email,
      "validationCode": data.validationCode,
      "password": data.password,
      "passwordConfirmation": data.passwordConfirmation
    });
    return validationCodeConfirmResponse;
  }

  // Request: GET
  Future<Map<String, dynamic>> getApprovals() async {
    final getApprovals = ApiEndpoints.getApprovals();
    return await _httpRequest.get(httpClient: httpClient, url: getApprovals);
  }

  Future<Map<String, dynamic>> getInformationBkHome(String token) async {
    final getInformationBkHome = ApiEndpoints.getInformationBkHome();
    return await _httpRequest.get(
        httpClient: httpClient, url: getInformationBkHome, token: token);
  }
}
