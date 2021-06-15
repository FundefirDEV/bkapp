import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'number_actions_widget.dart';

class SpecialCredit extends StatelessWidget {
  const SpecialCredit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    CreditFormBloc creditFormBloc = context.read<AppBloc>().creditFormBloc;
    SizeConfig().init(context);

    return Material(
      type: MaterialType.transparency,
      child: CardInformationBkWidget(
        // ignore: missing_required_param
        childBlue: NumberActions(),
        childBlueWidth: SizeConfig.blockSizeHorizontal * 30,
        childWhite: Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 2,
              horizontal: SizeConfig.safeBlockHorizontal * 8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: DropdownFieldBlocBuilder(
                      key: Key('dropdown-field-special-credit'),
                      selectFieldBloc: creditFormBloc.specialPerson,
                      decoration: InputDecoration(
                          labelText: I18n.of(context).creditScreenPerson),
                      itemBuilder: (context, value) => value,
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: TextFieldBlocBuilder(
                      key: Key('textfield-field-special-credit'),
                      textFieldBloc: creditFormBloc.specialInterest,
                      decoration: InputDecoration(
                          labelText:
                              I18n.of(context).creditScreenCurrentInterest),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
