import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/core/bloc/profitPayment/bloc/profit_payment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/accordion_detail_profit_widget.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/container_profit_payment_not_admin_widget.dart';
import 'package:bkapp_flutter/src/screens/profitPayment/widgets/container_profit_payment_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfitPaymentScreen extends StatefulWidget {
  ProfitPaymentScreen({
    Key key,
    @required this.userName,
    @required this.tokenUser,
    @required this.role,
    @required this.partnerId,
    this.oldIndex ,
  })
      : super(key: key);
  final String userName;
  final String tokenUser;
  final int oldIndex;
  final String role;
  final int partnerId;

  @override
  _ProfitPaymentScreenState createState() => _ProfitPaymentScreenState();
}

class _ProfitPaymentScreenState extends State<ProfitPaymentScreen> {
  String historyProfit = r'$0';
  ProfitPartnerModel profitPartner;
  List<String> selectedYearProfitPayment;

  @override
  void initState() {
    BlocProvider.of<ProfitPaymentBloc>(context)
        .add(ProfitPaymentInitialize(token: widget.tokenUser , 
          role: widget.role , 
          parnerId: widget.partnerId));
    super.initState();
    selectedYearProfitPayment = new List<String>();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<ProfitPaymentBloc, ProfitPaymentState>(
        builder: (context, state) {
      if (state is ProfitPaymentFailure) {
        return ErrorPage(errorMessage: state.error);
      }

      if (state is ProfitPaymentLoading) {
        selectedYearProfitPayment = [];
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ProfitPaymentPartnerNotAdmin) {

        profitPartner = state.profitPartner;
        return AppBarWidget(
          userName: widget.userName,
          container: ContainerProfitPaymentNotAdminWidget(
            historyProfit: state.historyEarnings,
            profitPartner: profitPartner,
          ),
        );
      }   

      return Builder(builder: (context) {
        // ignore: close_sinks
        ProfitPaymentFormBloc profitPaymentFormBloc =
            context.read<ProfitPaymentFormBloc>();

        profitPaymentFormBloc.userToken.updateValue(widget.tokenUser);

        if (state is ProfitPaymentLoaded) {
          historyProfit = state.historyEarnings;
          profitPaymentFormBloc.userList.updateItems(state.partners);
          profitPaymentFormBloc.shareValue = state.shareValue;
          selectedYearProfitPayment = [];
        }
        if (state is ProfitPaymentDetail) {
          profitPartner = state.profitPartner;
        }

        return FormBlocListener<ProfitPaymentFormBloc, DropDownModel, Object>(
            key: Key('bloc-listener-profit-payment-screen'),
            onSuccess: (context, state) {
              context.read<ProfitPaymentBloc>().add(
                ProfitPaymentPartnerSelected(
                  idPartner:
                    profitPaymentFormBloc.idPartner.value.toString(),
                  token:widget.tokenUser )
              );
            },
            onFailure: (context, state) {
              UtilsTools.showErrorDialog(context, state.failureResponse);
            },
            child: AppBarWidget(
              userName: widget.userName,
              container: ContainerProfitPaymentWidget(
                historyProfit: historyProfit,
                profitPartner: profitPartner,
                profitPaymentFormBloc: profitPaymentFormBloc,
                selectedYearProfitPayment: selectedYearProfitPayment,
                dataEarningPerMonth: profitPaymentFormBloc.dataEarningPerMonth,
                showAccordionDetail:
                    state is ProfitPaymentDetail ? true : false,
                onSelectedProfitPayment: (EnarningsPerYear value) {
                 print('value: ${value.earningShareIds}');
                  setState(() {
                    value.pay
                     // ignore: unnecessary_statements
                    ? {
                        print('A??o a pagar ganancias: ' + value.year),
                        selectedYearProfitPayment.add(value.year),
                        profitPaymentFormBloc.dataEarningPerMonth = DataEarningPerMonth(
                          earning: value.earningWihtOutFotmat ,
                          year: value.year,
                          isPaid: value.pay,
                          month: value.month,
                          earningShareIds: value.earningShareIds,
                        ),
                      }
                    : selectedYearProfitPayment.remove(value.year);
                  }
                );
              }
            )
          )
        );
      });
    });
  }
}