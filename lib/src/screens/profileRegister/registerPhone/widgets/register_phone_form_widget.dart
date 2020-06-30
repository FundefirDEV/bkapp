import 'package:bkapp_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

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
          width: SizeConfig.blockSizeHorizontal * 8,
          margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 1,
              top: SizeConfig.blockSizeVertical * 4),
          child: SvgPicture.asset(country.image),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 75,
          height: SizeConfig.blockSizeVertical * 15,
          child: TextFieldBlocBuilder(
            key: Key('phone-input-field'),
            textFieldBloc: profile.phoneBloc.phone,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              PhoneFormatter()
            ],
            errorBuilder: (context, string) {
              return string.contains('9')
              ? I18n.of(context).errorGraterThanNine
              : I18n.of(context).errorRequired;
            },
            decoration:
              InputDecoration(labelText: I18n.of(context).formPhone)
          ),
        ),
      ],
    ));
  }
}
