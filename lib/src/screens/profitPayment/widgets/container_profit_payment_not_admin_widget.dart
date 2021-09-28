import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'accordion_detail_profit_widget.dart';
import 'box_profit_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ContainerProfitPaymentNotAdminWidget extends StatelessWidget {
  const ContainerProfitPaymentNotAdminWidget(
      {Key key,
      @required this.historyProfit,
      @required this.profitPartner,
      })
      : super(key: key);
  final String historyProfit;
  final ProfitPartnerModel profitPartner;

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
          BoxProfitHistoyWidget(
            historyEarnings: historyProfit ,
            isAdmin: false,
            accumulableEarnings: profitPartner.accumulableEarnings
          ),
          LineSeparatorWidget(),
           _detailProfitPayment(
               context, profitPartner)
        ],
      ),
    );
  }

  Widget _detailProfitPayment(BuildContext context, ProfitPartnerModel detail,
      ) {
    return Container(
        child: Column(children: [
      _detailProfitAcordion(detail.profitDetail),
    ]));
  }

  Container _detailProfitAcordion(List<ProfitPartnerDetailModel> profitDetail,) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: profitDetail.length,
        itemBuilder: (BuildContext context, int index) {
          return AccordionDetailProfitWidget(
            profitDetail: profitDetail[index],
            showSelectCheckBox: false,
            onSelectedProfitPayment: ()=>{}
          );
        }
      ),
    );
  }
}
