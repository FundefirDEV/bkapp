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

  Future<Map<String, dynamic>> postNewBank(
      int city, String nameBank, List<Object> partners, String token) async {
    final postRegisterUser = ApiEndpoints.postNewBank();
    final validationCodeConfirmResponse = await _httpRequest.post(
        httpClient: httpClient,
        url: postRegisterUser,
        body: {"city": 1, "name": nameBank, "partners": partners},
        token: token);
    return validationCodeConfirmResponse;
  }

  Future<Map<String, dynamic>> getApprovals(String token) async {
    final getApprovals = ApiEndpoints.getApprovals();
    return await _httpRequest.get(
        httpClient: httpClient, url: getApprovals, token: token);
  }

  Future getPartnerValidation(String phoneNumber, String token) async {
    final getPartnerValidation = ApiEndpoints.getPartnerValidation();
    return await _httpRequest.get(
        httpClient: httpClient,
        url: getPartnerValidation,
        param: phoneNumber,
        token: token);
  }

  Future<Map<String, dynamic>> getInformationBkHome(String token) async {
    final getInformationBkHome = ApiEndpoints.getInformationBkHome();
    return await _httpRequest.get(
        httpClient: httpClient, url: getInformationBkHome, token: token);
  }

  Future<Map<String, dynamic>> postMyShares(
      String typeRequest, int quantity, double amount, String token) async {
    final postMySharesUrl = ApiEndpoints.postRequestBuyShare();
    return await _httpRequest.post(
        httpClient: httpClient,
        url: postMySharesUrl,
        body: {
          "typeRequest": typeRequest,
          "quantity": quantity,
          "amount": amount
        },
        token: token);
  }

  Future<Map<String, dynamic>> postCreditRequest(
      String token, Map creditRequest) async {
    final postCreditRequest = ApiEndpoints.postCreditRequest();
    return await _httpRequest.post(
        httpClient: httpClient,
        url: postCreditRequest,
        body: creditRequest,
        token: token);
  }

  Future<Map<String, dynamic>> postApprovals(String requestType, int idRequest,
      String approvalStatus, String token) async {
    final postMySharesUrl = ApiEndpoints.postApprovals();
    return await _httpRequest.post(
        httpClient: httpClient,
        url: postMySharesUrl,
        body: {
          "requestType": requestType,
          "idRequest": idRequest,
          "approval_status": approvalStatus
        },
        token: token);
  }

  Future<Map<String, dynamic>> getMeeting(String token) async {
    final getMeeting = ApiEndpoints.getMeeting();
    return await _httpRequest.get(
        httpClient: httpClient, url: getMeeting, token: token);
  }

  Future<Map<String, dynamic>> getBankRules(String token) async {
    final getBankRules = ApiEndpoints.getBankRules();
    return await _httpRequest.get(
        httpClient: httpClient, url: getBankRules, token: token);
  }

  Future<List<dynamic>> getPartners(String token) async {
    final getPartnersUrl = ApiEndpoints.getPartners();
    return await _httpRequest.get(
        httpClient: httpClient, url: getPartnersUrl, token: token);
  }

  Future<Map<String, dynamic>> postInvitePartner(
      String token, List<Map<String, dynamic>> partners) async {
    final postInvitePartner = ApiEndpoints.postInvitePartner();
    return await _httpRequest.post(
        httpClient: httpClient,
        url: postInvitePartner,
        token: token,
        body: {"partners": partners});
  }

  Future<Map<String, dynamic>> postMeetingClosed(String token) async {
    final postInvitePartner = ApiEndpoints.postMeetingClosed();
    return await _httpRequest.get(
        httpClient: httpClient, url: postInvitePartner, token: token);
  }
}
