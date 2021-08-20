import 'package:bkapp_flutter/core/models/update_profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ReportsRepository {
  final ApiProvider apiProvider;

  ReportsRepository({@required this.apiProvider}) : assert(apiProvider != null);

  ReportsRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getReports(String token) async {
    final Map getReports = await apiProvider.getReports(token: token);
    return getReports;
  }
}
