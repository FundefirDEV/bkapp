import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profit_payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfitPaymentFormBloc extends FormBloc<DropDownModel, Object> {
  ProfitPaymentFormBloc({@required this.repository}) {
    addFieldBloc(fieldBloc: userList);
    userList.onValueChanges(onData: (previous, current) async* {
      idPartner.updateValue(current.value.id);
      submit();
    });
  }

  final ProfitPaymentRepository repository;
  final userList = SelectFieldBloc<DropDownModel, Object>();
  final idPartner = TextFieldBloc();
  final userToken = TextFieldBloc();
  final shareValue = TextFieldBloc();

  DataEarningPerMonth dataEarningPerMonth;


  int getShareQuantity(){

    return dataEarningPerMonth.earning ~/ shareValue.valueToDouble;
  }

  double getProfitRes(){

    return dataEarningPerMonth.earning % shareValue.valueToDouble;
  }    

  void clearDataEarning(){
    dataEarningPerMonth = DataEarningPerMonth();
  }

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    userList?.close();
    idPartner?.close();
    return super.close();
  }
}
