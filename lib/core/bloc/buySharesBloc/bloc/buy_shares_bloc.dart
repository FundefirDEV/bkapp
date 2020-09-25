import 'dart:async';

import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/core/models/bank_info_model.dart';
import 'package:bkapp_flutter/core/models/shares_info_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositories.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/approvals_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'buy_shares_event.dart';
part 'buy_shares_state.dart';

class BuySharesBloc extends Bloc<BuySharesEvent, BuySharesState> {
  BuySharesBloc({@required this.repoApproval, @required this.repoHome})
      : super(BuySharesInitial());

  final ApprovalsRepository repoApproval;
  final HomeRepository repoHome;

  @override
  Stream<BuySharesState> mapEventToState(
    BuySharesEvent event,
  ) async* {
    if (event is BuySharesInitialize) {
      yield BuySharesLoading();
      try {
        final getDetailBank = await repoHome.detailBank(event.token);
        BankInfoModel bankInfo = bankInfoFromJson(getDetailBank);
        final getApprovals = await repoApproval.getApprovals(event.token);
        ApprovalsModel approvals = approvalsModelFromJson(getApprovals);
        SharesInfoModel sharesInfo = new SharesInfoModel(
            shares: bankInfo.personal.shares,
            shareValue: bankInfo.rules.shareValue,
            maxQuantitySharesForBuyByPartner:
                bankInfo.rules.maxQuantitySharesForBuyByPartner,
            approvals: approvals);
        yield BuySharesLoaded(infoShares: sharesInfo);
      } catch (e) {
        print(e);
        yield BuySharesFailure(error: e.toString());
      }
    }
  }
}
