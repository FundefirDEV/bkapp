import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class AdminCreateBankRepository {
  final ApiProvider apiProvider;
  AdminCreateBankRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  Future<Map<String, dynamic>> adminCreateBank(
    String token,
  ) async {
    final Map createBankRes = await apiProvider.adminCreateBank(token: token);
    return createBankRes;
  }

  Future<bool> verifyEmail(
    String email,
  ) async {
    try {
      await apiProvider.validateMail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyPhone(
    String phone,
  ) async {
    try {
      await apiProvider.validatePhone(phone: phone);
      return true;
    } catch (e) {
      return false;
    }
  }
}
