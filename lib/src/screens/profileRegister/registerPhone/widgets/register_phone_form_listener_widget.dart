import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/country_modal_content_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/bottomModal/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPhoneFormListenerWidget extends StatefulWidget {
  final RegisterPhoneStepArgs data;
  const RegisterPhoneFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  _RegistePhoneFormListenerWidgetState createState() =>
      _RegistePhoneFormListenerWidgetState();
}

class _RegistePhoneFormListenerWidgetState
    extends State<RegisterPhoneFormListenerWidget>
    with AfterLayoutMixin<RegisterPhoneFormListenerWidget> {
  ItemCountry country = ItemCountry(
      image: 'assets/images/colombia.svg', phoneCode: '+57', name: 'Colombia');
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    // ignore:close_sinks
    var registerBloc = context.bloc<AppBloc>().profileRegisterBloc;
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RegisterPhoneContainerWidget(
            key: Key('register-phone-container'),
            tag: widget.data.tag,
            image: widget.data.image,
            country: country,
            isValidating: _isValidating,
            openModalCountry: () => showDialog(context),
          ),
          FooterStepWidget(
              currentStep: 3,
              numberOfSteps: 5,
              isDisabled: isDisabled,
              currentBlocSubmit: () => nextWidgetTap(registerBloc))
        ]);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(context);
  }

  nextWidgetTap(ProfileRegisterBloc registerBloc) {
    registerBloc.phoneBloc.email
        .updateValue(registerBloc.emailBloc.email.value);

    registerBloc.phoneBloc.submit();

    Navigator.pushNamed(context, registerpinCodeVerification,
        arguments:
            RegisterPinCodeScreenStepArgs(widget.data.tag, widget.data.image));
  }

  _isValidating(String phoneBloc) {
    phoneBloc.length > 13
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }

  _receiveCountry(ItemCountry data) {
    // ignore: close_sinks
    final bloc = context.bloc<AppBloc>().profileRegisterBloc.phoneBloc;
    setState(() {
      country = data;
    });
    bloc.countryCode.updateValue(data.iso);
    bloc.countryCode.value;
  }

  @visibleForTesting
  showDialog(context) {
    SizeConfig().init(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomModal(
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 30,
              child: CountryModalContentWidget(callback: _receiveCountry));
        });
  }
}
