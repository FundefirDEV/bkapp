import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
//import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/country_modal_content_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/countryCarousel/items_country.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/after_layaut.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
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
    var registerBloc = context.read<AppBloc>().profileRegisterBloc;
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
              // currentBlocSubmit: () => nextWidgetTap(registerBloc)
              currentBlocSubmit: () => nextWidgetTap(registerBloc)),
                  //_showConfirmDialog(context, registerBloc))
        ]);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(context);
  }

  nextWidgetTap(ProfileRegisterBloc registerBloc) async  {

    final validateRes = await registerBloc.validatePhone(context);

    registerBloc.phoneBloc.submit();
    if(validateRes){
      // go to code validation
      registerBloc.phoneBloc.email
        .updateValue(registerBloc.emailBloc.email.value);

      Navigator.pushNamed(context, 
        registerPasswordUser,
        arguments: RegisterPasswordStepArgs(
        widget.data.tag, 
        widget.data.image
      ));
    }

    // Navigator.pushNamed(context, registerpinCodeVerification,
    //     arguments:
    //         RegisterPinCodeScreenStepArgs(widget.data.tag, widget.data.image));
  }

  void _showConfirmDialog(context, ProfileRegisterBloc registerBloc) async {
    // validate mail and phone

    final validateRes = await registerBloc.validatePhone(context);

    if(validateRes){
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (_) {
          return ImageBottomModal(
              modalHeight: 47.0,
              image: 'assets/images/salo_pre_approved_modal.svg',
              isImageBg: true,
              title: I18n.of(context).registerPhoneSuccesCode,
              titleBold: I18n.of(context).registerPhoneSuccesCodeBold,
              isBold: true,
              isBtnAccept: false,
              titleCloseButton: I18n.of(context).administratorAssignmentClose,
              onPressCancel: () {
                Navigator.pop(context);
                nextWidgetTap(registerBloc);
              });
        });
    }

    // show modal success
   
  }

  _isValidating(String phoneBloc) {
    phoneBloc.length > 6
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }

  _receiveCountry(ItemCountry data) {
    // ignore: close_sinks
    final bloc = context.read<AppBloc>().profileRegisterBloc.phoneBloc;
    setState(() {
      country = data;
    });
    
    print('*************************************************');
    print('COUNTRY CODE: ${data.iso}');
    print('*************************************************');

    if(data.iso != null){
      bloc.countryCode.updateValue(data.iso);
      bloc.countryCode.updateInitialValue(data.iso);
    }

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
