part of 'partner_bloc.dart';

abstract class PartnerEvent extends Equatable {
  const PartnerEvent();

  @override
  List<Object> get props => [];

}


class PartnerInitialize extends PartnerEvent {
  final String token;
  PartnerInitialize({@required this.token});

  @override
  List<Object> get props => [token];

  String get gettoken => token;

  @override
  String toString() => 'PartnerInitialize { token: $token }';
}
