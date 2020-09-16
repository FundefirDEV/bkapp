part of 'installments_payment_bloc.dart';

abstract class InstallmentsPaymentState extends Equatable {
  const InstallmentsPaymentState();

  @override
  List<Object> get props => [];
}

class InstallmentInitialize extends InstallmentsPaymentState {}

class InstallmentLoading extends InstallmentsPaymentState {}

class InstallmentPaid extends InstallmentsPaymentState {
  InstallmentPaid({@required this.myBankInfo});
  final List<ScheduleInstallment> myBankInfo;

  @override
  List<Object> get props => [myBankInfo];
}

class InstallmentFailed extends InstallmentsPaymentState {}
