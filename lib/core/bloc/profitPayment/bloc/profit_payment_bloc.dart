import 'dart:async';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profit_payment_repository.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profit_payment_event.dart';
part 'profit_payment_state.dart';

class ProfitPaymentBloc extends Bloc<ProfitPaymentEvent, ProfitPaymentState> {
  ProfitPaymentBloc({@required this.repository})
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
        //final profitResponse = await repository.getProfitPayment(event.token, '1');
        List<DropDownModel> partners =
            dropDownModelFromJson(response['partners'], 'id', 'name');

        final totalEarning =UtilsTools.formatTwoDecimals()
          .format(response['totalEarning']);

        yield ProfitPaymentLoaded(
            historyEarnings: totalEarning , partners: partners);
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
    if (event is TurnIntoShares) {
      yield ProfitPaymentLoading();
      print(event.yearsTurnIntoShares);
      DataEarningPerMonth year1 =
        DataEarningPerMonth(year: '2018', earning: 200.0, isPaid: true);
      DataEarningPerMonth year2 =
        DataEarningPerMonth(year: '2019', earning: 200.0, isPaid: true);
      DataEarningPerMonth year3 =
        DataEarningPerMonth(year: '2020', earning: 200.0, isPaid: true);
      List<DataEarningPerMonth> listProfit = [];
      listProfit.add(year1);
      listProfit.add(year2);
      listProfit.add(year3);
      ProfitPartnerDetailModel profitDetail1 = ProfitPartnerDetailModel(
          month: 'Agosto', earningsMonth: null, detail: listProfit);

      DataEarningPerMonth year4 =
        DataEarningPerMonth(year: '2018', earning: 200.0);
      DataEarningPerMonth year5 =
        DataEarningPerMonth(year: '2019', earning: 200.0);
      DataEarningPerMonth year6 =
        DataEarningPerMonth(year: '2020', earning: 200.0);
      List<DataEarningPerMonth> listProfit2 = [];
      listProfit2.add(year4);
      listProfit2.add(year5);
      listProfit2.add(year6);
      ProfitPartnerDetailModel profitDetail2 = ProfitPartnerDetailModel(
          month: 'Septiembre', earningsMonth: r'$100.300', detail: listProfit2);
      List<ProfitPartnerDetailModel> listProfileDetail = [];
      listProfileDetail.add(profitDetail1);
      listProfileDetail.add(profitDetail2);
      ProfitPartnerModel profitPartner = ProfitPartnerModel(
          accumulableEarnings: r'$780.600');
      yield ProfitPaymentDetail(profitPartner: profitPartner);
    }
  }
}
