import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

final List _partnersInfo = [
  {"gender": "m", "name": "Daniel Tavera", "shareValue": r'$250.000'},
  {"gender": "o", "name": "Javier Cantor", "shareValue": r'$250.000'},
  {"gender": "f", "name": "Maria Camila", "shareValue": r'$500.000'}
];

class ShareContent extends StatelessWidget {
  ShareContent({Key key , @required this.report});
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
              title: I18n.of(context).reportsScreenSharesChartTitle,
              axisTitle: I18n.of(context).reportsScreenSharesChartAxisTitle,
              total: report.totalAmountShares.toString(),
              spotList: [
                FlSpot(0, 0),
                FlSpot(2.5, 3),
                FlSpot(5.8, 4.5),
                FlSpot(7.4, 7),
              ],
            ),
          ),
          DoubleCardsInfo(
            totalSustainability:report.expenseFund.toString(),
            totalReserve: report.badDebtReserve.toString(),
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenSharesChartSharesValue,
            partnersInfo: report.sharePartnerList(),
          )
        ],
      ),
    );
  }
}
