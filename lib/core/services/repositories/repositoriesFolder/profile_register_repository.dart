import 'package:bkapp_flutter/core/models/partner_model.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class ProfileRegisterRepository {
  final ApiProvider apiProvider;

  ProfileRegisterRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  ProfileRegisterRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> registerUser(PartnerModel data) async {
    final Map informationBkHome = await apiProvider.postRegisterUser(data);
    return informationBkHome;
  }

  Future<Map<String, dynamic>> registerBank(
      int city, String nameBank, List<Object> partner, String token) async {
    final Map informationBkHome =
        await apiProvider.postNewBank(city, nameBank, partner, token);
    return informationBkHome;
  }

  Future<Map<String, dynamic>> validateMailAndPhone(String email, String phone) async {
    final res = await apiProvider.validateMailAndPhone(email: email, phone: phone);
    return res;
  }

  validateMail(String email) async {
    final res = await apiProvider.validateMail(email: email);
    return res;
  }

  validatePhone(String phone) async {
    final res = await apiProvider.validatePhone(phone: phone);
    return res;
  }
}
