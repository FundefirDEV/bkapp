import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class InstallmentsContent extends StatelessWidget {
  const InstallmentsContent({Key key , this.report}) : super(key: key);
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
              title: I18n.of(context).reportsScreenInstallmentsChartTitle,
              axisTitle:
                  I18n.of(context).reportsScreenInstallmentsChartAxisTitle,
              total: ReportsModel.formatNumber(report.creditsInfo.totalPayedValue.toString()),
              spotList: report.makeInstallmentFlSpot(),
            ),
          ),
          DoubleCardsInfo(
            totalSustainability:ReportsModel.formatNumber(report.expenseFund.toString()) ,
            totalReserve:ReportsModel.formatNumber(report.badDebtReserve.toString()) ,
          ),
          PartnersDetail(
            titleDetail:
                I18n.of(context).reportsScreenInstallmentsChartDebt,
            titleDetail2: '',
            partnersInfo: report.instalmentPartnerList(),
            padingMiddle: 0.0,
          )
        ],
      ),
    );
  }
}
