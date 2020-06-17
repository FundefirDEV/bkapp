import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterNameFormWidget extends StatelessWidget {
  const RegisterNameFormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final profileRegisterBloc =
      context.bloc<AppBloc>().profileRegisterBloc;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockVertical * 6),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFieldBlocBuilder(
              textFieldBloc: profileRegisterBloc.nameBloc.firstName,
              errorBuilder: (context, string) =>
                I18n.of(context).errorRequired,
              decoration: InputDecoration(
                labelText: I18n.of(context).formFirstName,
                prefixIcon: Icon(Icons.person)
              )
            ),
            TextFieldBlocBuilder(
              textFieldBloc: profileRegisterBloc.nameBloc.secondName,
              errorBuilder: (context, string) =>
                I18n.of(context).errorRequired,
              decoration: InputDecoration(
                labelText: I18n.of(context).formSecondName,
                prefixIcon: Icon(Icons.person)
              )
            ),
          ],
        ),
      )
    );
  }
}
