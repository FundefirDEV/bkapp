import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class AdministratorRepository {
  final ApiProvider apiProvider;

  AdministratorRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  AdministratorRepository.test({@required this.apiProvider});

  Future<List<dynamic>> getPartners(String token) async {
    final List<dynamic> partners =
        await apiProvider.getPartnersAdministrator(token);
    return partners;
  }

  Future<Map<String, dynamic>> postAdmin(
      String token, String name, String phone, String partnerType) async {
    final Map postAdmin =
        await apiProvider.postAdmin(token, name, phone, partnerType);
    return postAdmin;
  }
}
