import 'package:bkapp_flutter/core/bloc/buySharesBloc/buy_shares_form_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BuySharesFormWidget extends StatelessWidget {
  const BuySharesFormWidget(
      {Key key, this.token, this.buySharesBloc, this.valueShareRuleBank})
      : super(key: key);

  final String token;
  final String valueShareRuleBank;
  final BuySharesFormBloc buySharesBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      key: Key('buy-shares-form-column'),
      children: <Widget>[
        Container(
          key: Key('buy-shares-form-container'),
          width: SizeConfig.blockSizeHorizontal * 80,
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
          child: Material(
            key: Key('material-shares-form-container'),
            color: Colors.transparent,
            child: TextFieldBlocBuilder(
                key: Key('buy-shares-form-numberactions'),
                keyboardType: TextInputType.number,
                textFieldBloc: buySharesBloc?.numberactions,
                errorBuilder: (context, string) =>
                    I18n.of(context).errorRequired,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10)
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  labelText: I18n.of(context).buySharesNumberActions,
                  labelStyle:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                )),
          ),
        ),
        Container(
          key: Key('buy-shares-form-button-container'),
          margin:
              EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 5),
          child: FlatButton(
              key: Key('flatbutton-buy-shares-form'),
              onPressed: () {
                buySharesBloc.token.updateInitialValue(token);
                buySharesBloc.valueShareRuleBank
                    .updateInitialValue(valueShareRuleBank);
                buySharesBloc.submit();
              },
              color: Theme.of(context).colorScheme.primaryColor,
              child: Padding(
                  key: Key('padding-label-button-buy-shares-form'),
                  child: Text(
                    I18n.of(context).buySharesBuy,
                    style: TextStyle(color: Colors.white, letterSpacing: 3.9),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
        )
      ],
    );
  }
}
