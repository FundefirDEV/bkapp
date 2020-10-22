import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

final List _partnersInfo = [
  {"gender": "m", "name": "Daniel Tavera", "shareValue": r'$1.200.000'},
  {"gender": "o", "name": "Javier Cantor", "shareValue": r'$540.000'},
  {"gender": "f", "name": "Maria Camila", "shareValue": r'$760.000'}
];

class InstallmentsContent extends StatelessWidget {
  const InstallmentsContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 40,
            child: Chart(
              title: I18n.of(context).reportsScreenInstallmentsChartTitle,
              axisTitle:
                  I18n.of(context).reportsScreenInstallmentsChartAxisTitle,
              total: r'$1.100.000',
              spotList: [
                FlSpot(0, 0),
                FlSpot(2, 2),
                FlSpot(5, 5),
                FlSpot(7.4, 0),
              ],
            ),
          ),
          DoubleCardsInfo(
            totalSustainability: r'$213.000',
            totalReserve: r'$55.000',
          ),
          PartnersDetail(
            titleDetail:
                I18n.of(context).reportsScreenInstallmentsChartSharesValue,
            partners: _partnersInfo,
          )
        ],
      ),
    );
  }
}
