import 'package:bkapp_flutter/core/models/bank_rules_model%20copy.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/bank_rules_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RulesEditFormBloc extends FormBloc<String, String> {

  final token = TextFieldBloc();
  final BankRulesRepository repository;

  final ordinaryInterestPercentage =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final defaultRatePercentage = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final creditMaxInstallments =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final creditMaxValue =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final shareValue = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final expenseFundPercentage = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final badDebtReservePercentage =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final maxPercentageShareByPartner =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final maxActiveCreditsByPartner = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final maxCreditFactor =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final defaultInstallmentsPeriodDays =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  final _loadingController  = BehaviorSubject<bool>();
    Stream<bool> get loadingStream => _loadingController.stream;
    bool get loading => _loadingController.value;

  RulesEditFormBloc({@required this.repository}) {
    
    addFieldBlocs(fieldBlocs: [
      ordinaryInterestPercentage,
      defaultRatePercentage,
      creditMaxInstallments,
      creditMaxValue,
      shareValue,
      expenseFundPercentage,
      badDebtReservePercentage,
      maxPercentageShareByPartner,
      maxActiveCreditsByPartner,
      maxCreditFactor,
      defaultInstallmentsPeriodDays
    ]);
  }

  void initValues(){
    
    _loadingController.sink.add(false);
  }

  Future<bool> sumit() async {

     _loadingController.sink.add(true);

    try {
      final bankRules = AddBankRules(
        ordinaryInterestPercentage: ordinaryInterestPercentage.valueToDouble, 
        defaultRatePercentage: defaultRatePercentage.valueToDouble, 
        creditMaxInstallments: creditMaxInstallments.valueToInt, 
        creditMaxValue: creditMaxValue.valueToDouble, 
        shareValue: shareValue.valueToDouble, 
        expenseFundPercentage: expenseFundPercentage.valueToDouble, 
        badDebtReservePercentage: badDebtReservePercentage.valueToDouble, 
        maxPercentageShareByPartner: maxPercentageShareByPartner.valueToDouble, 
        maxActiveCreditsByPartner: maxActiveCreditsByPartner.valueToInt, 
        maxCreditFactor: maxCreditFactor.valueToInt, 
        defaultInstallmentsPeriodDays: defaultInstallmentsPeriodDays.valueToInt,
      );
      print(bankRules.toJson());

      await repository.changeRules(bankRules, token.value);
      
      _loadingController.sink.add(false);

      return true;

    } catch (e) {
      _loadingController.sink.add(false);

      return false;
    }
  }

  Future<void> close() {
      ordinaryInterestPercentage.close();
      defaultRatePercentage.close();
      creditMaxInstallments.close();
      creditMaxValue.close();
      shareValue.close();
      expenseFundPercentage.close();
      badDebtReservePercentage.close();
      maxPercentageShareByPartner.close();
      maxActiveCreditsByPartner.close();
      maxCreditFactor.close();
      defaultInstallmentsPeriodDays.close();
      _loadingController.close();

    return super.close();
  }

  @override
  void onSubmitting() {
    // TODO: implement onSubmitting
  }
}
