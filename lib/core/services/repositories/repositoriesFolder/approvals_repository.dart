import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ApprovalsRepository {
  final ApiProvider apiProvider;

  ApprovalsRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  ApprovalsRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> getApprovals(String token) async {
    final Map getAllApprovals = await apiProvider.getApprovals(token);
    return getAllApprovals;
  }

  Future<Map<String, dynamic>> postApprovals(
      String requestType,
      int idRequest,
      String approvalStatus,
      String token
    ) async {
    final Map postApprovals = await apiProvider.postApprovals(
      requestType,
      idRequest,
      approvalStatus,
      token
    );
    return postApprovals;
  }
}
