import 'package:bkapp_flutter/core/bloc/reporstBloc/reports_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/noDataScreen/no_data_screen.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'widgets/widgets.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key key, @required this.userName , @required this.token}) : super(key: key);
  final String userName;
  final String token;

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

    @override
  void initState() {
    context.read<ReportsBloc>().add(ReportsInitialize(token: widget.token));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<String> tabList = [
      I18n.of(context).reportsScreenTabsShares,
      I18n.of(context).reportsScreenTabsCredits,
      I18n.of(context).reportsScreenTabsInstallments,
      I18n.of(context).reportsScreenTabsProfits
    ];

  return BlocBuilder<ReportsBloc, ReportsState>(builder: (context, state) {
    if (state is ReportsLoaded) {
      return AppBarWidget(
          userName: widget.userName,
          enableScrolling: false,
          container: Container(
            child: MultipleTabs(
              tabContentSize: SizeConfig.blockSizeVertical * 70,
              tabsText: tabList,
              tabsContent: [
                SingleChildScrollView(child: ShareContent(report: state.reportsModel,)),
                SingleChildScrollView(child: CreditsContent(report: state.reportsModel)),
                SingleChildScrollView(child: InstallmentsContent(report: state.reportsModel)),
                SingleChildScrollView(child: ProfitsContent(report: state.reportsModel))
            ],
          )
        ),
      );
      }
      if (state is ReportsFailure) {
        return ErrorPage(errorMessage: state.error);
      }
      if (state is NoDataReport) {
        return NoDataScreen(noDataMessage: I18n.of(context).noDataScreenReportsMessage,);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
