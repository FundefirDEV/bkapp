import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditFormBloc extends FormBloc<String, String> {
  final CreditRepository creditRepository;

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

  final creditUse = SelectFieldBloc(
    items: [
      'Generación de ingresos',
      'Fortalecimiento familiar',
      'Consumo'
    ],
  );

  final paymentMethods = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  final creditDetail = TextFieldBloc();

  final tokenProfile = TextFieldBloc();

  CreditFormBloc({@required this.creditRepository}) {
    addFieldBlocs(fieldBlocs: [
      specialPerson,
      specialInterest,
      valueCredit,
      installments,
      creditUse,
      paymentMethods,
      tokenProfile,
      creditDetail
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      await creditRepository.postCreditRequest(
        tokenProfile.value,
        {
          "typeRequest": "credit",
          "quantity": int.parse(installments.value),
          "amount": double.parse(
            UtilsTools.removeCurrencyFormatter(valueCredit.value)
          )
        }
      );
      emitSuccess(canSubmitAgain: true);
      clear();
    } catch(e) {
      emitFailure(failureResponse: e.message);
    }
  }

  Future<void> close() {
    specialPerson?.close();
    specialInterest?.close();
    valueCredit?.close();
    installments?.close();
    creditUse?.close();
    paymentMethods?.close();
    tokenProfile?.close();
    creditDetail?.close();
    return super.close();
  }
}
