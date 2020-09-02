part of 'mybank_bloc.dart';

abstract class MyBankEvent extends Equatable {
  const MyBankEvent();

  @override
  List<Object> get props => [];
}

class GetMyBankInfo extends MyBankEvent {
  GetMyBankInfo({@required this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'GetMyBankInfo { token: $token }';
}
