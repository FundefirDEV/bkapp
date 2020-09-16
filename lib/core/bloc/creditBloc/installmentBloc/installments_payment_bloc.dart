import 'dart:async';

import 'package:bkapp_flutter/core/models/my_bank_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/my_bank_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'installments_payment_event.dart';
part 'installments_payment_state.dart';

class InstallmentsPaymentBloc
    extends Bloc<InstallmentspaymentEvent, InstallmentsPaymentState> {
  InstallmentsPaymentBloc(
      {@required this.creditRepository, @required this.myBankRepository})
      : super((InstallmentInitialize()));

  final CreditRepository creditRepository;
  final MyBankRepository myBankRepository;

  @override
  Stream<InstallmentsPaymentState> mapEventToState(
    InstallmentspaymentEvent event,
  ) async* {
    if (event is PayInstallment) {
      yield InstallmentLoading();
      try {
        await creditRepository.postInstallmentPaid(
            event.token, event.installmentRequest);

        final response = await myBankRepository.getMyBankInfo(event.token);
        MyBankModel myBankModel = myBankModelFromJson(response);
        yield InstallmentPaid(
            myBankInfo: myBankModel.activeCredits[0].scheduleInstallment);
      } catch (e) {
        yield InstallmentFailed();
      }
    }
  }
}
