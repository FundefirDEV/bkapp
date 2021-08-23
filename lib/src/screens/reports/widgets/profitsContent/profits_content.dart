import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';


class ProfitsContent extends StatelessWidget {
  const ProfitsContent({Key key , this.report}) : super(key: key);
  final ReportsModel report;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 40,
            child: Chart(
              title: I18n.of(context).reportsScreenProfitsChartTitle,
              axisTitle: I18n.of(context).reportsScreenProfitsChartAxisTitle,
              total: report.totalAmountEarning.toString(),
              spotList: report.makeEarningFlSpot(),
            ),
          ),
         DoubleCardsInfo(
            totalSustainability:report.expenseFund.toString(),
            totalReserve: report.badDebtReserve.toString(),
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenProfitsChartSharesValue,
            partnersInfo: report.earningPartnerList(),
          )
        ],
      ),
    );
  }
}
