import 'package:bkapp_flutter/core/models/bank_rules_model%20copy.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/models/update_profile_model.dart';
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
      String phone, String email, String countryCode) async {
    final validationCodeUrl = ApiEndpoints.validationCode();
    final validationCodeResponse = await _httpRequest.post(
        httpClient: httpClient,
        url: validationCodeUrl,
        body: {"phone": phone, "email": email, "countryCode": countryCode});
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

  Future<List<dynamic>> getPartnersAdministrator(String token) async {
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

  Future<Map<String, dynamic>> postAdmin(
      String token, String name, String phone, String partnerType) async {
    final postAdmin = ApiEndpoints.postAdmin();
    return await _httpRequest
        .post(httpClient: httpClient, url: postAdmin, token: token, body: {
      "partners": [
        {"name": name, "phone": phone, "partnerType": partnerType}
      ]
    });
  }

  Future<Map<String, dynamic>> getMyBankInfo(String token) async {
    final bankInfoUrl = ApiEndpoints.getMyBankInfo();
    return await _httpRequest.get(
        httpClient: httpClient, url: bankInfoUrl, token: token);
  }

  Future<List<dynamic>> getLocation(String token) async {
    final getPartnersUrl = ApiEndpoints.getLocation();
    return await _httpRequest.get(
        httpClient: httpClient, url: getPartnersUrl, token: token);
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    final getPartnersUrl = ApiEndpoints.getProfile();
    return await _httpRequest.get(
        httpClient: httpClient, url: getPartnersUrl, token: token);
  }

  Future<Map<String, dynamic>> postInstallmentPayment(
      String token, Map<String, dynamic> bodyRequest) async {
    final postInvitePartner = ApiEndpoints.postCreditRequest();
    return await _httpRequest.post(
        httpClient: httpClient,
        url: postInvitePartner,
        token: token,
        body: bodyRequest);
  }

  Future<Map<String, dynamic>> myShares(String token) async {
    final getMySharesUrl = ApiEndpoints.getMyShares();
    return await _httpRequest.get(
        httpClient: httpClient, url: getMySharesUrl, token: token);
  }

  Future<Map<String, dynamic>> myCredits(String token) async {
    final getMyCreditUrl = ApiEndpoints.getMyCredits();
    return await _httpRequest.get(
        httpClient: httpClient, url: getMyCreditUrl, token: token);
  }

  Future<Map<String, dynamic>> getCreditsCurrentMeeting(String token) async {
    final endPoint = ApiEndpoints.getCreditsCurrentMeeting();
    return await _httpRequest.get(
        httpClient: httpClient, url: endPoint, token: token);
  }

  Future<Map<String, dynamic>> getSharesCurrentMeeting(String token) async {
    final endPoint = ApiEndpoints.getSharesCurrentMeeting();
    return await _httpRequest.get(
        httpClient: httpClient, url: endPoint, token: token);
  }

  Future<Map<String, dynamic>> changePassSendMail(
    {@required String email, @required String phone}) async {

    final endPoint = ApiEndpoints.changePassSendMail();
    return await _httpRequest.post(
      httpClient: httpClient, url: endPoint, body: {
      "phone": phone,
      "email": email
    });
  }

  Future<Map<String, dynamic>> validateMailAndPhone(
    {@required String email, @required String phone}) async {

    final endPoint = ApiEndpoints.validateMailAndPhone();
    return await _httpRequest.post(
      httpClient: httpClient, url: endPoint, body: {
      "phone": phone,
      "email": email
    });
  }

  validateMail(
    {@required String email}) async {

    final endPoint = ApiEndpoints.validateMail();
    return await _httpRequest.get(
      httpClient: httpClient, url: endPoint, param: email);
  }

  validatePhone(
    {@required String phone}) async {

    final endPoint = ApiEndpoints.validatePhone();
    return await _httpRequest.get(
      httpClient: httpClient, url: endPoint, param: phone);
  }

  validateUserPhone(
    {@required String phone}) async {

    final endPoint = ApiEndpoints.validateUserPhone();
    return await _httpRequest.get(
      httpClient: httpClient, url: endPoint, param: phone);
  }

  Future<Map<String, dynamic>> changePasswordWithCodeConfirm({
      @required String code, 
      @required String email, 
      @required String phone, 
      @required String password,
      @required String passwordConfirmation
    }) async {

    final endPoint = ApiEndpoints.changePasswordWithCodeConfirm();
    return await _httpRequest.post(
      httpClient: httpClient, url: endPoint, body: {
      "code": code,
      "email": email,
      "phone": phone,
      "password": password,
      "passwordConfirmation": passwordConfirmation
    });
  }


  updateProfile(
    {@required UpdatePeofile updateProfile , @required token
    }) async {

    final endPoint = ApiEndpoints.updateProfile();
      return await _httpRequest.post(
        httpClient: httpClient, url: endPoint, body: updateProfile.toJson() , 
        token: token
    );
  }

  changeRules(
    {@required AddBankRules bankRules , @required token
    }) async {

    final endPoint = ApiEndpoints.changeRules();
      return await _httpRequest.post(
        httpClient: httpClient, url: endPoint, body: bankRules.toJson() , 
        token: token
    );
  }

  getReports({@required String token}) async{
    final endPoint = ApiEndpoints.reports();
    return await _httpRequest.get(
      httpClient: httpClient, url: endPoint , token: token);
  }
  
  profitPaymentGetPartners(String token) async {
    final getPartnersUrl = ApiEndpoints.profitPayment();
    return await _httpRequest.get(
        httpClient: httpClient, url: getPartnersUrl, token: token);
  }

  profitPayment({@required String token , @required String partnerId}) async{
    final endPoint = ApiEndpoints.profitPayment();
    return await _httpRequest.get(
      httpClient: httpClient, url: endPoint , token: token,
      param: partnerId );
  }

  postProfitPayment({
    @required String token , 
    @required String partnerId , 
    @required List<int> earningShareIds
    
  }) async{
    final endPoint = ApiEndpoints.profitPayment();

    return await _httpRequest.post(
      httpClient: httpClient, url: endPoint , token: token,
      body: {
        "earningShareIds": earningShareIds,
        "partnerId": int.tryParse(partnerId),
      }
    );
  }
  convertShares({
    @required String token , 
    @required String partnerId , 
    @required List<int> earningShareIds,
    @required int quantity,
    
  }) async{
    final endPoint = ApiEndpoints.convertShares();

    return await _httpRequest.post(
      httpClient: httpClient, url: endPoint , token: token,
      body: {
        "earningShareIds": earningShareIds,
        "partnerId": int.tryParse(partnerId),
        'quantity': quantity,
      }
    );
  }
}
