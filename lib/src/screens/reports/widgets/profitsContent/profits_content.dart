import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

final List _partnersInfo = [
  {"gender": "m", "name": "Daniel Tavera", "shareValue": r'$345.000'},
  {"gender": "o", "name": "Javier Cantor", "shareValue": r'$1.200.000'},
  {"gender": "f", "name": "Maria Camila", "shareValue": r'$755.000'}
];

class ProfitsContent extends StatelessWidget {
  const ProfitsContent({Key key}) : super(key: key);

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
              total: r'$2.300.000',
              spotList: [
                FlSpot(0, 0),
                FlSpot(4, 2),
                FlSpot(6, 5),
                FlSpot(7.4, 0),
              ],
            ),
          ),
          DoubleCardsInfo(
            totalSustainability: r'$213.000',
            totalReserve: r'$55.000',
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenProfitsChartSharesValue,
            partners: _partnersInfo,
          )
        ],
      ),
    );
  }
}
