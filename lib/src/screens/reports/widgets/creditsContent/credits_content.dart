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

class CreditsContent extends StatelessWidget {
  const CreditsContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 40,
            child: Chart(
              title: I18n.of(context).reportsScreenCreditsChartTitle,
              axisTitle: I18n.of(context).reportsScreenCreditsChartAxisTitle,
              total: r'$2.500.000',
              spotList: [
                FlSpot(0, 0),
                FlSpot(2, 6),
                FlSpot(5.8, 3.5),
                FlSpot(7.4, 7),
              ],
            ),
          ),
          DoubleCardsInfo(
            totalSustainability: r'$213.000',
            totalReserve: r'$55.000',
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenCreditsChartSharesValue,
            partners: _partnersInfo,
          )
        ],
      ),
    );
  }
}
