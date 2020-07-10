import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RulesEditFormBloc extends FormBloc<String, String> {
  final maxCreditAmount =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final maxDues = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final ordinaryInterest =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final defaultInterest =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final typePayment = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final sharesValue = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final spendingReserve =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final incobrableFund =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final reunionWeek = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final reunionDay =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  RulesEditFormBloc() {
    addFieldBlocs(fieldBlocs: [
      maxCreditAmount,
      maxDues,
      ordinaryInterest,
      defaultInterest,
      typePayment,
      sharesValue,
      spendingReserve,
      incobrableFund,
      reunionWeek,
      reunionDay
    ]);
  }

  @override
  void onSubmitting() async {
    print(maxCreditAmount.value);
    print(maxDues.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  Future<void> close() {
    maxCreditAmount.close();
    maxDues.close();
    ordinaryInterest.close();
    defaultInterest.close();
    typePayment.close();
    sharesValue.close();
    spendingReserve.close();
    incobrableFund.close();
    reunionWeek.close();
    reunionDay.close();

    return super.close();
  }
}
