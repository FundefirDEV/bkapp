import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

List<dynamic> blocProviders = [
  BlocProvider(
    create: (context) =>
        BuySharesFormBloc(repository: shareRepository),
  ),
  BlocProvider(
    create: (context) =>
        ApprovalsBloc(repository: approvalsRepository),
  ),
  BlocProvider(
    create: (context) => BuySharesBloc(
        repoApproval: approvalsRepository,
        repoHome: homeRepository),
  ),
  BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: homeRepository,
        partnerRepository: partnerRepository
      )),
  BlocProvider(
    create: (context) =>
        CreditFormBloc(creditRepository: creditRepository),
  ),
  BlocProvider(
      create: (context) =>
          ApprovalsBloc(repository: approvalsRepository)),
  BlocProvider(
      create: (context) =>
          MeetingBloc(repository: meetingRepository)),
  BlocProvider(
    create: (context) =>
        BankRulesBloc(repository: bankRulesRepository),
  ),
];
