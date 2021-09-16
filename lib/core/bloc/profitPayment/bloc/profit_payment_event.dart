part of 'profit_payment_bloc.dart';

abstract class ProfitPaymentEvent extends Equatable {
  const ProfitPaymentEvent();

  @override
  List<Object> get props => [];
}

class ProfitPaymentInitialize extends ProfitPaymentEvent {
  ProfitPaymentInitialize({this.token});
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'ProfiPaymentInitialize { token: $token }';
}

class ProfitPaymentPartnerSelected extends ProfitPaymentEvent {
  ProfitPaymentPartnerSelected({@required this.idPartner , @required this.token});
  final String idPartner;
  final String token;

  @override
  List<Object> get props => [idPartner];

  @override
  String toString() => 'ProfitPaymentPartnerSelected { idPartner: $idPartner }';
}


class PayProfits extends ProfitPaymentEvent {
  PayProfits({
    @required this.earningShareIds,
    @required this.idPartner, 
    @required this.token
  });
  final List<int> earningShareIds;
  final String idPartner;
  final String token;

  @override
  String toString() => 'PayProfits { earningShareIds: $earningShareIds idPartner: $idPartner token: $token }';

  @override
  List<Object> get props => [earningShareIds , idPartner , token];
}

class ConvertShares extends ProfitPaymentEvent {
  ConvertShares({
    @required this.token , 
    @required this.partnerId , 
    @required this.earningShareIds,
    @required this.quantity,
    @required this.earning,
    @required this.shareValue,
    
  });
  final List<int> earningShareIds;
  final String partnerId;
  final String token;
  final int quantity;
  final double earning;
  final shareValue;

  @override
  String toString() => 'ConvertShares { earningShareIds: $earningShareIds partnerId: $partnerId token: $token quantity $quantity earing $earning }';

  @override
  List<Object> get props => [earningShareIds , partnerId , token , quantity , earning];
}

