import 'package:bkapp_flutter/core/models/update_profile_model.dart';
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

    Future<Map<String, dynamic>> updateProfile(UpdatePeofile updatePeofile , String token) async {
    final Map getProfile = await apiProvider.updateProfile(updateProfile: updatePeofile, token: token);
    return getProfile;
  }
}
