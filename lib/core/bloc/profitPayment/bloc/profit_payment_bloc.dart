import 'dart:async';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profit_payment_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';


part 'profit_payment_event.dart';
part 'profit_payment_state.dart';

class ProfitPaymentBloc extends Bloc<ProfitPaymentEvent, ProfitPaymentState> {
  ProfitPaymentBloc({@required this.repository })
      : super(ProfitPaymentInitial());
  final ProfitPaymentRepository repository;

  @override
  Stream<ProfitPaymentState> mapEventToState(
    ProfitPaymentEvent event,
  ) async* {
    if (event is ProfitPaymentInitialize) {
      yield ProfitPaymentLoading();
      try {

        final response = await repository.getPartners(event.token);

        final shareValue = await repository.getShareValue(event.token) as double;

        print(shareValue);

        List<DropDownModel> partners =
            dropDownModelFromJson(response['partners'], 'id', 'name');

        final totalEarning = UtilsTools.formatTwoDecimals()
          .format(response['totalProfitPayment']);

        yield ProfitPaymentLoaded(
            historyEarnings: totalEarning , partners: partners , shareValue: shareValue);

      } catch (e) {

        print(e);
        yield ProfitPaymentFailure(error: e.toString());

      }
    }

    if (event is ProfitPaymentPartnerSelected) {
      try {
        yield ProfitPaymentLoading();
        
        final profitResponse = await repository.getProfitPayment(event.token, event.idPartner);

        ProfitPartnerModel profitPartner = ProfitPartnerModel.fromJson(profitResponse);

        yield ProfitPaymentDetail(profitPartner: profitPartner);
      } catch (e) {
        print(e);
        yield ProfitPaymentFailure(error: e.toString());
      }
    }

    if (event is PayProfits) {
      try {
        
        yield ProfitPaymentLoading();

        try {

          final profitPayPostRes = await repository.postProfitPayment(
            token: event.token,  
            partnerId: event.idPartner , 
            earningShareIds: event.earningShareIds
          );
          print('PAY PROFIT RES: $profitPayPostRes ');
          print('PAY PROFIT: ${event.token} ${event.idPartner} ${event.earningShareIds}');
          
        } catch (e) {
          print(e);
          yield ProfitPaymentFailure(error: e.toString());
        }

        yield ProfitPaymentLoading();

        final profitResponse = await repository.getProfitPayment(event.token, event.idPartner);
        ProfitPartnerModel profitPartner = ProfitPartnerModel.fromJson(profitResponse);
        
        yield ProfitPaymentDetail(profitPartner: profitPartner);

      } catch (e) {
        print(e);
        yield ProfitPaymentFailure(error: e.toString());
      }
    }

    if (event is ConvertShares) {
      try {
        
        yield ProfitPaymentLoading();

        try {

          print(event.quantity);
          final profitPayPostRes = await repository.convertShares(
            token: event.token,  
            partnerId: event.partnerId , 
            earningShareIds: event.earningShareIds,
            quantity: event.quantity,
          );
          print('PAY PROFIT RES: $profitPayPostRes ');
          print(event.toString());
          
        } catch (e) {
          print(e);
          yield ProfitPaymentFailure(error: e.toString());
        }

        yield ProfitPaymentLoading();

        // final getProfitResponse = await repository.getPartners(event.token);
        // final shareValue = await repository.getShareValue(event.token) as double;

        // List<DropDownModel> partners =
        //     dropDownModelFromJson(getProfitResponse['partners'], 'id', 'name');

        // final totalEarning =UtilsTools.formatTwoDecimals()
        //   .format(getProfitResponse['totalProfitPayment']);

        // yield ProfitPaymentLoaded(
        //     historyEarnings: totalEarning , partners: partners , shareValue: shareValue);

        final profitResponse = await repository.getProfitPayment(event.token, event.partnerId);
        ProfitPartnerModel profitPartner = ProfitPartnerModel.fromJson(profitResponse);
        yield ProfitPaymentDetail(profitPartner: profitPartner);

      } catch (e) {
        print(e);
        yield ProfitPaymentFailure(error: e.toString());
      }
    }
  }
}
