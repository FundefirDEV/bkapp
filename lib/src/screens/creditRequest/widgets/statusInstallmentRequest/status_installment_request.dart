import 'package:bkapp_flutter/core/bloc/creditBloc/installmentBloc/installments_payment_bloc.dart';
import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:bkapp_flutter/core/models/approvals_model.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/appBar/app_bar_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/widgets/titleHeader/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/description_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/status_text_credit_request_widget.dart';
import 'package:bkapp_flutter/src/screens/creditRequest/widgets/textInfoRequestWidgets/descriptionCreditRequest/text_image_credit_status_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StatusInstallmentRequest extends StatefulWidget {
  StatusInstallmentRequest(
      {Key key, @required this.userName, this.myInstallmentRequest})
      : super(key: key);

  final String userName;
  final Request myInstallmentRequest;

  @override
  _StatusInstallmentRequestState createState() =>
      _StatusInstallmentRequestState();
}

class _StatusInstallmentRequestState extends State<StatusInstallmentRequest> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final navigateBloc = context.bloc<MenuNavigatorBloc>();
    String dateExist = widget.myInstallmentRequest?.requestDate ?? '';
    DateTime date =
        dateExist != '' ? DateTime.parse(dateExist) : DateTime.now();

    SizeConfig().init(context);
    return BlocBuilder<InstallmentsPaymentBloc, InstallmentsPaymentState>(
      builder: (context, state) {
        if (state is InstallmentPaid) {
          return AppBarWidget(
            userName: widget.userName,
            container: Column(
              key: Key('status-credit_request-widget-column'),
              children: <Widget>[
                TitleHeaderWidget(
                  title: I18n.of(context).approvalsScreenCredits,
                  oldIndex: 0,
                  navigateBloc: navigateBloc,
                ),
                Container(
                  key: Key('status-credit_request-widget-container-text'),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    I18n.of(context).statusCreditNormal,
                    key: Key('status-credit_request-widget-text'),
                    style: TextStyle(color: Colors.white, letterSpacing: 3.02),
                  ),
                ),
                CardInformationBkWidget(
                  childBlueWidth: 130.0,
                  childBlue: StatusTextCreditRequest(
                    bottomText: I18n.of(context).preApproveInstallmentFee,
                    installments:
                        state.myBankInfo[0].numberInstallment.toString(),
                  ),
                  childWhite: DescriptionCreditRequestWidget(
                      valueRequested:
                          widget.myInstallmentRequest?.amount ?? r'$0',
                      dateRequested:
                          DateFormat("dd / MMM / yyyy").format(date).toString(),
                      topText:
                          I18n.of(context).preApproveInstallmentPaymentValue),
                ),
                TextImageCreditStatusWidget()
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
