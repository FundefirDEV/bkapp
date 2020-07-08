import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesFormBloc extends FormBloc<String, String> {
  final numberactions =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  BuySharesFormBloc() {
    addFieldBlocs(fieldBlocs: [numberactions]);
  }

  @override
  void onSubmitting() async {
    print(numberactions.value);
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    numberactions?.close();
    return super.close();
  }
}
