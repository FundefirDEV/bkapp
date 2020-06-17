import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPhoneFormWidget extends StatelessWidget {
  final ItemCountry country;

  const RegisterPhoneFormWidget({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //ignore: close_sinks
    final profile = context.bloc<AppBloc>().profileRegisterBloc;

    return Container(
      child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
          right: SizeConfig.blockSizeHorizontal * 1,
          top: SizeConfig.blockSizeVertical * 4),
          child: Text(country.phoneCode)),
        Container(
          width: SizeConfig.blockSizeHorizontal * 80,
          height: SizeConfig.blockSizeVertical * 15,
          child: TextFieldBlocBuilder(
            textFieldBloc: profile.phoneBloc.phone,
            errorBuilder: (context, string) =>
              I18n.of(context).errorRequired,
            decoration:
              InputDecoration(labelText: I18n.of(context).formPhone)
          ),
        ),
      ],
      )
    );
  }
}
