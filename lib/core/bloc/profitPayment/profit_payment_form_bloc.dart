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
  double shareValue = 0.0;
  int shareQuantity = 0;
  double profitRes = 0.0;

  DataEarningPerMonth dataEarningPerMonth;

  void initShareQuantityAndProfitRes (){
    shareQuantity = dataEarningPerMonth.earning ~/ shareValue;
    profitRes = dataEarningPerMonth.earning % shareValue;
  }


  void updateShareQuantity(int newQuantity){

    shareQuantity = newQuantity;
    updateProfitRes();
  }

  void updateProfitRes(){
   
    final shareAmount =  shareQuantity * shareValue;
    final earning = dataEarningPerMonth.earning;

    profitRes = earning - shareAmount;
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
