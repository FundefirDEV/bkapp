import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ApprovalsRepository {
  final ApiProvider apiProvider;

  ApprovalsRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  ApprovalsRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getApprovals() async {
    final Map getAllApprovals = await apiProvider.getApprovals();
    return getAllApprovals;
  }
}
