import 'dart:async';

import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/credit_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'installments_payment_event.dart';
part 'installments_payment_state.dart';

class InstallmentsPaymentBloc
    extends Bloc<InstallmentspaymentEvent, InstallmentsPaymentState> {
  InstallmentsPaymentBloc({@required this.creditRepository})
      : super((InstallmentInitialize()));

  final CreditRepository creditRepository;

  @override
  Stream<InstallmentsPaymentState> mapEventToState(
    InstallmentspaymentEvent event,
  ) async* {
    if (event is PayInstallment) {
      yield InstallmentLoading();
      try {
        await creditRepository.postInstallmentPaid(
            event.token, event.installmentRequest);
        yield InstallmentPaid();
      } catch (e) {
        yield InstallmentFailed();
      }
    }
  }
}
