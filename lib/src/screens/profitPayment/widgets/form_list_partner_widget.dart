import 'package:bkapp_flutter/core/bloc/profitPayment/profit_payment_form_bloc.dart';
import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class FormListPartnerWidget extends StatelessWidget {
  const FormListPartnerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: close_sinks
    ProfitPaymentFormBloc profitPaymentFormBloc =
        context.bloc<ProfitPaymentFormBloc>();
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 45.0, right: 25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.white),
      child: DropdownFieldBlocBuilder<DropDownModel>(
          key: Key('list-state-kgh'),
          showEmptyItem: false,
          selectFieldBloc: profitPaymentFormBloc.userList,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: I18n.of(context).profitPaymentSelectPartner,
              suffixIcon: Icon(Icons.keyboard_arrow_down,
                  size: 32.0,
                  color: Theme.of(context).colorScheme.primaryColor[100])),
          itemBuilder: (context, value) => value.text),
    );
  }
}
