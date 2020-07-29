import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_phone_bloc.dart';
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
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBlocListener<ProfilePhoneBloc, String, String>(
          onSuccess: (context, state) {
            Navigator.pushNamed(context, registerpinCodeVerification,
                arguments: RegisterPinCodeScreenStepArgs(
                    widget.data.tag, widget.data.image));
          },
          child: _containerInfo(context)),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(context);
  }

  Widget _containerInfo(BuildContext context) {
    // ignore:close_sinks
    var registerBloc = context.bloc<AppBloc>().profileRegisterBloc;
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBackWidget(),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: RegisterPhoneContainerWidget(
                key: Key('register-phone-container'),
                tag: widget.data.tag,
                image: widget.data.image,
                country: country,
                openModalCountry: () => showDialog(context),
              ),
            ),
          ),
          FooterStepWidget(
              currentStep: 3,
              numberOfSteps: 5,
              currentBlocSubmit: () => nextWidgetTap(registerBloc))
        ]);
  }

  nextWidgetTap(ProfileRegisterBloc registerBloc) {
    registerBloc.phoneBloc.email
        .updateValue(registerBloc.emailBloc.email.value);

    registerBloc.phoneBloc.submit();
  }

  _receiveCountry(ItemCountry data) {
    setState(() {
      country = data;
    });
    print(data.name);
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
