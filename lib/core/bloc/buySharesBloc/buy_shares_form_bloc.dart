import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/shares_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesFormBloc extends FormBloc<String, String> {
  final ShareRepository repository;

  final token = TextFieldBloc();
  final valueShareRuleBank = TextFieldBloc();

  final numberactions =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  BuySharesFormBloc({@required this.repository}) {
    addFieldBlocs(fieldBlocs: [numberactions]);
  }

  @override
  void onSubmitting() async {
    try {
      await repository.postMyShares(
          typeRequest: "share",
          quantity: int.parse(numberactions?.value) ?? 0,
          amount: double.parse(
                  UtilsTools.removeMoneyFormatter(valueShareRuleBank?.value)) *
              int.parse(numberactions?.value),
          token: token.value);
      emitSuccess(canSubmitAgain: true);
      clear();
    } catch (e) {
      print(e);
      emitFailure(failureResponse: e.message);
    }
  }

  Future<void> close() {
    numberactions?.close();
    valueShareRuleBank?.close();
    token?.close();
    return super.close();
  }
}
