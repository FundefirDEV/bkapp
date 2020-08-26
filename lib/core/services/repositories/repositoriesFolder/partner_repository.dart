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

  Future<List<dynamic>> getPartners(String token) async {
    final List<dynamic> partners = await apiProvider.getPartners(token);
    return partners;
  }

  Future<Map<String, dynamic>> postInvitePartner(
    String token, List<Map<String, String>> partners
  ) async {
    final Map<String, dynamic> invitePartner =
      await apiProvider.postInvitePartner(token, partners);
    return invitePartner;
  }
}
