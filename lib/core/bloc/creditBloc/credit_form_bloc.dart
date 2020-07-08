import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditFormBloc extends FormBloc<String, String> {

  final specialPerson = SelectFieldBloc(
    items: ['Opción 1', 'Opción 2']
  );

  final specialInterest = TextFieldBloc();

  final valueCredit = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  final installments = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  final selectState = SelectFieldBloc(
    items: [
      'Generación de ingresos',
      'Fortalecimiento familiar',
      'Consumo'
    ],
  );

  final paymentMethods = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  CreditFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      specialPerson,
      specialInterest,
      valueCredit,
      installments,
      selectState,
      paymentMethods
    ]);
  }

  @override
  void onSubmitting() async {
    print(paymentMethods.value);
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    specialPerson?.close();
    specialInterest?.close();
    valueCredit?.close();
    installments?.close();
    selectState?.close();
    paymentMethods?.close();
    return super.close();
  }
}
