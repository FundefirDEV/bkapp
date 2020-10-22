import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key key, @required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<String> tabList = [
      I18n.of(context).reportsScreenTabsShares,
      I18n.of(context).reportsScreenTabsCredits,
      I18n.of(context).reportsScreenTabsInstallments,
      I18n.of(context).reportsScreenTabsProfits
    ];

    return Scaffold(
      body: AppBarWidget(
        userName: userName,
        enableScrolling: false,
        container: Container(
            child: MultipleTabs(
          tabContentSize: SizeConfig.blockSizeVertical * 70,
          tabsText: tabList,
          tabsContent: [
            SingleChildScrollView(child: ShareContent()),
            SingleChildScrollView(child: CreditsContent()),
            SingleChildScrollView(child: InstallmentsContent()),
            SingleChildScrollView(child: ProfitsContent())
          ],
        )),
      ),
    );
  }
}
