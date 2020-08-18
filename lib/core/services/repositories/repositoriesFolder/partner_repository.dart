import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class PartnerRepository {
  final ApiProvider apiProvider;

  PartnerRepository({
    @required this.apiProvider
  }) : assert(apiProvider != null);

  Future<Map<String, dynamic>> getPartnerValidation(
    String phoneNumber,
    String token
  ) async {
    final dynamic validatePhoneNumber =
      await apiProvider.getPartnerValidation(token, phoneNumber);
    return validatePhoneNumber;
  }
}
