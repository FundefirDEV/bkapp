import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/buttons_pay_and_convert_earnings_widget.dart';
import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'accordion_detail_profit_widget.dart';
import 'box_profit_history_widget.dart';
import 'package:flutter/material.dart';
import 'subtitle_accumulated_earnings_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ContainerProfitPaymentWidget extends StatelessWidget {
  const ContainerProfitPaymentWidget(
      {Key key,
      this.historyProfit,
      this.profitPaymentFormBloc,
      this.showAccordionDetail,
      this.profitPartner,
      this.selectedYearProfitPayment,
      this.onSelectedProfitPayment,
      @required this.dataEarningPerMonth
      })
      : super(key: key);
  final String historyProfit;
  final ProfitPartnerModel profitPartner;
  final ProfitPaymentFormBloc profitPaymentFormBloc;
  final bool showAccordionDetail;
  final List<String> selectedYearProfitPayment;
  final Function onSelectedProfitPayment;
  final DataEarningPerMonth dataEarningPerMonth;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          TitleHeaderWidget(
              title: I18n.of(context).profitPaymentTitle,
              showArrow: false,
              menuNavigatorBloc: context.read<MenuNavigatorBloc>()),
          BoxProfitHistoyWidget(historyEarnings: historyProfit),
          LineSeparatorWidget(),
          if (showAccordionDetail)
            _detailProfitPayment(
                context, profitPartner, selectedYearProfitPayment)
        ],
      ),
    );
  }

  Widget _detailProfitPayment(BuildContext context, ProfitPartnerModel detail,
      List<String> selectedYearProfitPayment) {
    return Container(
        child: Column(children: [
      SubtitleAccumulatedEarningsWidget(
          accumulableEarnings: detail.accumulableEarnings),
      _detailProfitAcordion(detail.profitDetail, selectedYearProfitPayment),
      if (selectedYearProfitPayment.length > 0)
        ButtonsPayAndConvertEarningsWidget(
          selectedYearsPay: selectedYearProfitPayment,
          earningPerMonth: dataEarningPerMonth  
        )
    ]));
  }

  Container _detailProfitAcordion(List<ProfitPartnerDetailModel> profitDetail,
      List<String> selectedYearProfitPayment) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: profitDetail.length,
          itemBuilder: (BuildContext context, int index) {
            return AccordionDetailProfitWidget(
                profitDetail: profitDetail[index],
                //earningsMonth: profitDetail[index].getEarningsMonth ,
                onSelectedProfitPayment: onSelectedProfitPayment);
          }),
    );
  }
}
