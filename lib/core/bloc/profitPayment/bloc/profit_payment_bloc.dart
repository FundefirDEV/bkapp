import 'dart:async';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profit_payment_repository.dart';
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
            dropDownModelFromJson(response, 'id', 'name');
        yield ProfitPaymentLoaded(
            historyEarnings: r'$10.540.200', partners: partners);
      } catch (e) {
        print(e);
        yield ProfitPaymentFailure(error: e.toString());
      }
    }
    if (event is ProfitPaymentPartnerSelected) {
      try {
        yield ProfitPaymentLoading();
        print(event.idPartner);

        final profitResponse = await repository.getProfitPayment(event.token, event.idPartner);

        //print(profitResponse);

        YearProfitPayment year1 =
            new YearProfitPayment(year: '2018', earning: r'$220.000');
        YearProfitPayment year2 =
            new YearProfitPayment(year: '2019', earning: r'$20.000');
        YearProfitPayment year3 =
            new YearProfitPayment(year: '2020', earning: r'$100.300');
        List<YearProfitPayment> listProfit = [];
        listProfit.add(year1);
        listProfit.add(year2);
        listProfit.add(year3);
        ProfitPartnerDetailModel profitDetail1 = new ProfitPartnerDetailModel(
            month: 'Agosto', earningsMonth: r'$100.300', detail: listProfit);
        ProfitPartnerDetailModel profitDetail2 = new ProfitPartnerDetailModel(
            month: 'Septiembre',
            earningsMonth: r'$250.300',
            detail: listProfit);
        List<ProfitPartnerDetailModel> listProfileDetail = [];
        listProfileDetail.add(profitDetail1);
        listProfileDetail.add(profitDetail2);
        ProfitPartnerModel profitPartner = new ProfitPartnerModel(
            accumulableEarnings: r'$780.600', profitDetail: listProfileDetail);
        yield ProfitPaymentDetail(profitPartner: profitPartner);
      } catch (e) {
        print(e);
        yield ProfitPaymentFailure(error: e.toString());
      }
    }
    if (event is TurnIntoShares) {
      yield ProfitPaymentLoading();
      print(event.yearsTurnIntoShares);
      YearProfitPayment year1 =
          new YearProfitPayment(year: '2018', earning: r'$220.000', pay: true);
      YearProfitPayment year2 =
          new YearProfitPayment(year: '2019', earning: r'$20.000', pay: true);
      YearProfitPayment year3 =
          new YearProfitPayment(year: '2020', earning: r'$100.300', pay: true);
      List<YearProfitPayment> listProfit = [];
      listProfit.add(year1);
      listProfit.add(year2);
      listProfit.add(year3);
      ProfitPartnerDetailModel profitDetail1 = new ProfitPartnerDetailModel(
          month: 'Agosto', earningsMonth: null, detail: listProfit);

      YearProfitPayment year4 =
          new YearProfitPayment(year: '2018', earning: r'$220.000');
      YearProfitPayment year5 =
          new YearProfitPayment(year: '2019', earning: r'$20.000');
      YearProfitPayment year6 =
          new YearProfitPayment(year: '2020', earning: r'$100.300');
      List<YearProfitPayment> listProfit2 = [];
      listProfit2.add(year4);
      listProfit2.add(year5);
      listProfit2.add(year6);
      ProfitPartnerDetailModel profitDetail2 = new ProfitPartnerDetailModel(
          month: 'Septiembre', earningsMonth: r'$100.300', detail: listProfit2);
      List<ProfitPartnerDetailModel> listProfileDetail = [];
      listProfileDetail.add(profitDetail1);
      listProfileDetail.add(profitDetail2);
      ProfitPartnerModel profitPartner = new ProfitPartnerModel(
          accumulableEarnings: r'$780.600', profitDetail: listProfileDetail);
      yield ProfitPaymentDetail(profitPartner: profitPartner);
    }
  }
}
