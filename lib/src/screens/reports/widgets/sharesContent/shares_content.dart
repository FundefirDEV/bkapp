import 'package:bkapp_flutter/core/models/reports_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';


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
              spotList: report.makeShareFlSpot(),
            ),
          ),
          DoubleCardsInfo(
            totalSustainability:report.expenseFund.toString(),
            totalReserve: report.badDebtReserve.toString(),
          ),
          PartnersDetail(
            titleDetail: I18n.of(context).reportsScreenSharesChartSharesValue,
            titleDetail2:I18n.of(context).meetingClosedQuantity ,
            partnersInfo: report.sharePartnerList(),
          )
        ],
      ),
    );
  }
}
