import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NameBkFormWidget extends StatelessWidget {
  const NameBkFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: Colors.transparent,
      child: Theme(
      key: Key('theme-input-namebk'),
      data: Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.copyWith(
          // FIXME this subhead has to be replaced
          subhead: Theme.of(context).textTheme.subhead.copyWith(
            color: Colors.white,
            fontSize: SizeConfig.blockSizeHorizontal * 10,
            fontWeight: FontWeight.w100
          ),
        ),
      ),
        child: TextFieldBlocBuilder(
          key: Key('input-namebk'),
          maxLengthEnforced: false,
          textFieldBloc: context.bloc<AppBloc>().bankRegisterBloc.name,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          padding: EdgeInsets.all(0),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            hintText: I18n.of(context).bankNameWriteHere,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          )
        ),
      ),
    );
  }
}
