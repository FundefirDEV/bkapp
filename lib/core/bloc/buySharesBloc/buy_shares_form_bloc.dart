import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/shares_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesFormBloc extends FormBloc<String, String> {
  final ShareRepository repository;

  final token = TextFieldBloc();

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
          quantity:
              numberactions?.value != null ? int.parse(numberactions.value) : 0,
          amount: 10000.0,
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
    token?.close();
    return super.close();
  }
}
