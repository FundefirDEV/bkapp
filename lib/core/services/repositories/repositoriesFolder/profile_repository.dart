import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ProfileRepository {
  final ApiProvider apiProvider;

  ProfileRepository({@required this.apiProvider}) : assert(apiProvider != null);

  ProfileRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getProfile(String token) async {
    final Map getProfile = await apiProvider.getProfile(token);
    return getProfile;
  }
}
