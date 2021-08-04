import 'package:bkapp_flutter/core/bloc/creditBloc/data_use_credit.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'requestHandler/request_credit_handler.dart';

class CreditFormBloc extends FormBloc<String, String> {
  final CreditRepository creditRepository;

  final specialPerson = SelectFieldBloc(items: ['Opción 1', 'Opción 2']);

  final specialInterest = TextFieldBloc();

  final valueCredit = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final installments =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  final creditUse = SelectFieldBloc(items: ['']);

  final creditDetail = SelectFieldBloc(items: ['']);

  final paymentMethods =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  final tokenProfile = TextFieldBloc();

  // PAYMENT
  final paymentAmount = TextFieldBloc();


  CreditFormBloc({@required this.creditRepository}) {
    creditUse.updateItems(itemsCreditUse);
    addFieldBlocs(fieldBlocs: [
      specialPerson,
      specialInterest,
      valueCredit,
      installments,
      creditUse,
      paymentMethods,
      tokenProfile,
      paymentAmount,
    ]);
    creditUse.onValueChanges(onData: (previous, current) async* {
      removeFieldBlocs(fieldBlocs: [creditDetail]);
      switch (itemsCreditUse.indexOf(current.value)) {
        case 0:
          creditDetail.updateItems(useCreditOption0);
          break;
        case 1:
          creditDetail.updateItems(useCreditOption1);
          break;
        case 2:
          creditDetail.updateItems(useCreditOption2);
          break;
        default:
          break;
      }
      addFieldBlocs(fieldBlocs: [creditDetail]);
    });
  }

  @override
  void onSubmitting() async {
    try {
      await creditRepository.postCreditRequest(tokenProfile.value, {
        "typeRequest": "credit",
        "quantity": int.parse(installments.value),
        "amount":
            double.parse(UtilsTools.removeCurrencyFormatter(valueCredit.value)),
        "creditUse": requestCreditHandler(creditUse.value),
        "detail": creditDetail.value,
        "paymentType": requestCreditHandler(paymentMethods.value)
      });
      emitSuccess(canSubmitAgain: true);
      clear();
    } catch (e) {
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
    paymentAmount?.close();
    return super.close();
  }
}
