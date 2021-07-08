import 'package:bkapp_flutter/core/bloc/administratorAsignmentBloc/administrator_asignment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/profileBloc/profile_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileEdition/bloc/profile_edit_Bloc.dart';
import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/core/bloc/timeLineCredit/time_line_credit_bloc.dart';
import 'package:bkapp_flutter/core/bloc/timeLineShares/bloc/time_line_shares_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

List<dynamic> blocProviders = [
  BlocProvider(
    create: (context) => BuySharesFormBloc(repository: shareRepository),
  ),
  BlocProvider(
    create: (context) => ApprovalsBloc(repository: approvalsRepository),
  ),
  BlocProvider(
    create: (context) => BuySharesBloc(
        repoApproval: approvalsRepository, repoHome: homeRepository),
  ),
  BlocProvider(
      create: (context) => HomeBloc(
          homeRepository: homeRepository,
          partnerRepository: partnerRepository)),
  BlocProvider(
    create: (context) => CreditFormBloc(creditRepository: creditRepository),
  ),
  BlocProvider(
      create: (context) => ApprovalsBloc(repository: approvalsRepository)),
  BlocProvider(create: (context) => MeetingBloc(repository: meetingRepository)),
  BlocProvider(
    create: (context) => BankRulesBloc(repository: bankRulesRepository),
  ),
  BlocProvider(
    create: (context) =>
        AdministratorAsignmentBloc(repository: administratorRepository),
  ),
  BlocProvider(
    create: (context) => MyBankBloc(
        myBankRepository: myBankRepository,
        rulesRepository: bankRulesRepository,
        homeRepository: homeRepository),
  ),
  BlocProvider(
    create: (context) => ProfileBloc(repository: profileRepository),
  ),

  BlocProvider(
    create: (context) => PartnerBloc(partnerRepository: partnerRepository),
  ),

  BlocProvider(
      create: (context) =>
          ProfitPaymentFormBloc(repository: profitPaymentRepository)),
  BlocProvider(
      create: (context) => ProfitPaymentBloc(repository: partnerRepository)),
  BlocProvider(
      create: (context) => InstallmentsPaymentBloc(
          creditRepository: creditRepository,
          myBankRepository: myBankRepository)),
  BlocProvider(create: (context) => ExemptionsFormBloc()),
  BlocProvider(
      create: (context) => TimeLineSharesBloc(homeRepository: homeRepository)),
  BlocProvider(create: (context) => TimeLineCreditBloc()),
  BlocProvider(
    create: (context) => ProfileEditBloc(repository: profileEditRepository),
  ),
];
