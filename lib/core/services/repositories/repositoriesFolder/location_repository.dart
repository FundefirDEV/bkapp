import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class LocationRepository {
  final ApiProvider apiProvider;

  LocationRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  Future<List<dynamic>> getLocation({@required String token}) async {
    final List<dynamic> getLocation = await apiProvider.getLocation(token);
    return getLocation;
  }
}
