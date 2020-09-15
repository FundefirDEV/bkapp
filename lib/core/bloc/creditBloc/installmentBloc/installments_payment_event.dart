part of 'installments_payment_bloc.dart';

abstract class InstallmentspaymentEvent extends Equatable {
  const InstallmentspaymentEvent();

  @override
  List<Object> get props => [];
}

class PayInstallment extends InstallmentspaymentEvent {
  PayInstallment({@required this.token, @required this.installmentRequest});

  final String token;
  final Map<String, dynamic> installmentRequest;

  @override
  List<Object> get props => [token, installmentRequest];

  @override
  String toString() => 'PayInstallment { request: $installmentRequest }';
}
