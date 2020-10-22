import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ValidationCodeRepository {
  final ApiProvider apiProvider;

  ValidationCodeRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  ValidationCodeRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> postValidationCode(
      {@required String phone,
      @required String email,
      String countryCode}) async {
    final Map validationCode =
        await apiProvider.postValidationCode(phone, email, countryCode);
    return validationCode;
  }
}
