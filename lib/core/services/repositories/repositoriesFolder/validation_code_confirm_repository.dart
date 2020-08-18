import 'package:flutter/foundation.dart';
import 'package:bkapp_flutter/core/services/api/api_provider.dart';

class ValidationCodeConfirmRepository {
  final ApiProvider apiProvider;

  ValidationCodeConfirmRepository({@required this.apiProvider})
      : assert(apiProvider != null);

  ValidationCodeConfirmRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> postValidationCodeConfirm(
      {@required String code,
      @required String phone,
      @required String email}) async {
    final Map validationCodeConfirm =
        await apiProvider.postValidationCodeConfirm(code, phone, email);
    return validationCodeConfirm;
  }
}
