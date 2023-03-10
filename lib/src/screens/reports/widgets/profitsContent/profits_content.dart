import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
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
              axisTitle: I18n.of(context).reportsScreenProfitsChartEarningPerShare,
              total:ReportsModel.formatNumber(report.totalAmountEarning.toString()) ,
              spotList: report.makeEarningFlSpot(),
              meetingNumber: report.meettingNumber(),
            ),
          ),
         DoubleCardsInfo(
            totalSustainability:ReportsModel.formatNumber(report.expenseFund.toString()) ,
            totalReserve:ReportsModel.formatNumber(report.badDebtReserve.toString()) ,
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenProfitsChartSharesValue,
            titleDetail2: '',
            partnersInfo: report.earningPartnerList(),
            padingMiddle: 0.0,
          )
        ],
      ),
    );
  }
}
