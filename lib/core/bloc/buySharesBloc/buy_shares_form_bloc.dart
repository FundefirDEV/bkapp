import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesFormBloc extends FormBloc<String, String> {
  final numberactions =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  BuySharesFormBloc() {
    addFieldBlocs(fieldBlocs: [numberactions]);
  }

  @override
  void onSubmitting() async {
    try {
      print(numberactions.value);
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitLoadFailed();
    }
  }

  void dispose() {
    numberactions.close();
  }
}
