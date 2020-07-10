import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PaymentField extends StatelessWidget {
  const PaymentField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
            key: Key('payment_textFields_rules_edit_screen'),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: TextFieldBlocBuilder(
              textFieldBloc:
                  context.bloc<AppBloc>().rulesEditFormBloc.typePayment,
              style: TextStyle(fontSize: 12),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  labelText: I18n.of(context).rulesScreenPaymentMetods,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            )),
      ],
    );
  }
}
