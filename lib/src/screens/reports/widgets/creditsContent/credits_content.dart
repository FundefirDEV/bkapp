import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';


class CreditsContent extends StatelessWidget {
  const CreditsContent({Key key , @required this.report}) : super(key: key);
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
              title: I18n.of(context).reportsScreenCreditsChartTitle,
              axisTitle: I18n.of(context).reportsScreenCreditsChartAxisTitle,
              total: report.creditsInfo.totalAmountCredit.toString(),
              spotList: report.makeCreditFlSpot(),
            ),
          ),
          DoubleCardsInfo(
            totalSustainability:report.expenseFund.toString(),
            totalReserve: report.badDebtReserve.toString(),
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenCreditsChartSharesValue,
            titleDetail2:I18n.of(context).reportsScreenApproveCreditDate ,
            partnersInfo: report.creditsPartnerList(),
          )
        ],
      ),
    );
  }
}
