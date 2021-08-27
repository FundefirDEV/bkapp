import 'package:bkapp_flutter/src/utils/errorHandler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class RegisterPhoneFormWidget extends StatelessWidget {
  const RegisterPhoneFormWidget(
      {Key key, this.country, @required this.isValidating})
      : super(key: key);

  final ItemCountry country;
  final Function isValidating;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final profile = context.read<AppBloc>().profileRegisterBloc;

    return Container(
      height: SizeConfig.blockSizeVertical * 30,
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
          width: SizeConfig.blockSizeHorizontal * 12,
          margin: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 1,
            top: SizeConfig.blockSizeVertical * 4),
          child: Text('${country.phoneCode}'),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 60,
          height: SizeConfig.blockSizeVertical * 15,
          child: TextFieldBlocBuilder(
            key: Key('phone-input-field'),
            keyboardType: TextInputType.number,
            textFieldBloc: profile.phoneBloc.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(20),
              //PhoneFormatter()
            ],
            errorBuilder: errorHandler,
            onChanged: (value) {
              isValidating(value);
              return value;
            },
            decoration: 
              InputDecoration(labelText: I18n.of(context).formPhone)
          ),
        ),
      ],
    ));
  }
}
